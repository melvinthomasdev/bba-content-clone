Consider we have a blog application. In that application, we need to test the
blog creation part. After successful creation, we will receive a toaster message
"Post added successfully". Lets create the test case.

```js
describe("Blog", () => {
  test("verify manage blog operations", () => {
    cy.clearAndType(blogSelectors.titleField, "Blog title");
    cy.clearAndType(blogSelectors.descriptionField, "Blog Description");
    cy.get(blogSelectors.saveButton).click();
    cy.get(commonSelectors.toastrContainer).should(
      "have.text",
      bogTexts.createdBlogMessage
    );
  });
});
```

Unfortunately, this test will fail. When we click the save button, it will
trigger an API to create the post. And it will show the toastr message only
after getting a response for the API request. In order to handle these kinds of
cases, cypress has a function `wait()` that will wait for the given time. So we
can add a `wait()` after clicking the button like this.

```js
describe("Blog", () => {
  test("verify manage blog operations", () => {
    cy.clearAndType(blogSelectors.titleField, "Blog title");
    cy.clearAndType(blogSelectors.descriptionField, "Blog Description");
    cy.get(blogSelectors.saveButton).click();
    cy.wait(1000);
    cy.get(commonSelectors.toastrContainer).should(
      "have.text",
      bogTexts.createdBlogMessage
    );
  });
});
```

This test may work fine locally, but it will lead to flaky test cases that fail randomly. The reason is we don't know the exact time duration to wait for
the request. Sometimes, the request can take more than `1000ms`. In that case,
the test will fail. So what if we change the waiting to `10000ms(10 sec)`? It
will be enough for an API to get the response. But it will increase the
execution time. Even if we get the response in 1 second, it will wait for 10
seconds. How do we overcome this problem? The solution is to use `intercept`
method in cypress.

## Intercept

`intercept` will watch the request that matches the URL we provide. Here is the
way to solve the above problem using `intercept`

```js
describe("Blog", () => {
  test("verify manage blog operations", () => {
    cy.clearAndType(blogSelectors.titleField, "Blog title");
    cy.clearAndType(blogSelectors.descriptionField, "Blog Description");
    cy.intercept("POST", "/api/blog").as("addBlog");
    cy.get(blogSelectors.saveButton).click();
    cy.wait("@addBlog");
    cy.get(commonSelectors.toastrContainer).should(
      "have.text",
      bogTexts.createdBlogMessage
    );
  });
});
```

Here we use the `intercept` method to watch the API and alias it. Then we click
on the save button. And then, we wait for that request by using
`cy.wait("@addBlog")`. Whenever we get a response, it will stop waiting.

Keep in mind that we should add the `intercept` before calling the API. That
means here, we should keep it before the command that clicks on the save button.

### Usage of Intercept

Let us consider we have the feature to search for a blog. Let's say the API URL
is something like `/api/v1/blogs?title=science`. In that case, we can use the
intercept and wait for the request like the following.

```js
cy.intercept("api/v1/**").as("searchBlogs");
// Command to click on save button
...
cy.wait("@searchBlogs")
```

Here we have used a glob pattern to match the URL. The intercept will match the
request that starts with `api/v1`. But there are some problems that we may face
if we go with this method. Before explaining that, we should know the working of
`intercept`.

Intercept is a kind of an event listener. Once we define an intercept with an alias
for a request, then it will consider all the API requests that match the URL as
a part of that intercept throughout the spec. So in our case, the intercept will
match all the requests that start with `api/v1` and its alias will be
`searchBlogs`.

Let's say we have another request following the search request. And consider we
have added a wait command like this

```js
cy.wait("@searchBlog");
```

But, because of some reason, let's consider that the request is triggered just
after calling the wait command. Here, we expect that the cypress will search and
find the new request, and if the request is not triggered, it will wait for the
request to get triggered and to get completed. But what happens is that, at the
time of calling the wait condition, it will search for the matching request. But
at this time, the new request is not yet triggered. So while searching for the
latest matching request, cypress will find the previous search request. Since
that request is already completed, cypress will stop waiting. So it won't wait
for the expected request.

One thing to note here is that an intercept wait command has a timeout period
for both request and response. Here the `cy.wait("@searchBlog")` waits until
it's specified **request timeout** to detect a request matching the intercept
route, if it doesn't the test fails. Once a corresponding request is detected,
then test execution waits till a corresponding response is detected. Here the
intercept waits for the response until it's specified **response timeout**. If
it doesn't detect a response the test fails.

Now, Let's go with the solution! The intercept command has a prop `times` which
is the maximum number of times it can match requests. If we provide times as
`1`, after matching a request, it won't match any other request and we can't
wait for another request using the same alias, until we define another intercept
with that alias.

```js
cy.intercept({ url: "api/v1/**", times: 1 }).as("searchRequest")
....
cy.wait("@searchRequest");
....
....
cy.intercept({ url: "api/v1/**", times: 1 }).as("fetchRequest")
....
cy.wait("@fetchRequest");
```

Now, after cypress wait for the first request, then it won't match another
request. So we have added another intercept for the next request. If the second
request is not triggered yet, it will wait for that request to get triggered for
a maximum of 10 seconds (we have configured it as 10 sec). If the request is
triggered in between that time, it will wait for the request to get completed.

Let's create a custom command for this.

```js
Cypress.Commands.add("interceptApi", alias => {
  cy.intercept({ url: "api/v1/**", times: 1, resourceType: "xhr" }).as(alias);
});
```

Here, we are using the prop `resourceType` with value `xhr` to make sure
that we are intercepting only XHR requests.
Now we can use the custom command like this.

```js
// Proper method

cy.interceptApi("searchRequest")
cy.clearAndType(commonSelectors.searchField, "science");
cy.wait("@searchRequest");
....
....
cy.interceptApi("createPost")
cy.get(commonSelectors.saveButton).click();
cy.wait("@createPost");
```

An interesting thing about the `times` prop is that if we aren't defining such a
prop then we are implicitly defining it to have a value of **infinity**.

```javascript
cy.intercept("api/v1/**").as("apiCall");
```

The `@apiCall` intercept would detect and attach itself to all the requests
matching the glob pattern within the test body. This method to intercept and
wait for all API calls might seem easy and efficient at first glance, but using
this technique would create an issue with the ordering of the requests and their
corresponding wait commands.

Consider we have 4 requests of which we are not waiting for the 3rd request and
the final request is a debounced search request.

```javascript
...
cy.wait("@apiCall");           // 1st request
...
cy.wait("@apiCall");           // 2nd request
...
                               // 3rd request. But skipping the wait command for the request.
...
// command to initiate search debounced by 350ms
cy.wait("@apiCall")
```

Here the final wait command although intended for the search request, actually
attaches itself to the 3rd request which we were intending to skip. This happens
because the search request itself isn't triggered soon after the command since
it is debounced and hence the intercept considers the 3rd request as the latest
matching request. Now since we aren't waiting for the search request response,
the rest of the test loses it's integrity making the test flaky or failing. We issue intercepts only when we need them to avoid such ordering issues. This
technique has the added advantage of helping us keep track of all the requests
and it's routes.

### Handling multiple requests

Let's consider that multiple requests are happening after we click on the save
button. For example, let's consider there is one request to update the blog and
another one to fetch the blogs. The fetch request will be triggered immediately
after the update request is completed.

```js
cy.interceptApi("updateRequest")
cy.interceptApi("fetchRequest")
// Command to click on the save button.
....
cy.wait("@updateRequest");
cy.wait("@fetchRequest");
```

We might think this will work. But it won't. Here cypress will only wait for the
first request properly. Because both `"updateRequest"` and `"fetchRequest"`
aliases will be pointing to the first request.

In this case what we can do is, we can update the values of the `times` prop
to 2. So basically the code will look like this.

```js
cy.intercept({ url: "api/v1/**", times: 2 }).as("updateAndFetchRequest")
....
cy.wait(["@updateAndFetchRequest", "@updateAndFetchRequest"]);
```

```js
cy.wait("@updateAndFetchRequest");
cy.wait("@updateAndFetchRequest");
// This is same as
cy.wait(["@updateAndFetchRequest", "@updateAndFetchRequest"]);
```

Here we will allow the intercept to match up to 2 requests. Then we wait for it
2 times. So the cypress will wait for the 2 matched requests to get triggered
and to get completed.

Let's update our custom command to support this as well.

```js
Cypress.Commands.add("interceptApi", (alias, times = 1) => {
  cy.intercept({ url: "api/v1/**", times }).as(alias);
});

Cypress.Commands.add("waitForMultipleRequest", (alias, times = 1) => {
  const aliases = [...new Array(times).fill(alias)];

  return cy.wait(aliases);
});
```

Let's update the above code using the custom commands.

```js
// Proper method

cy.interceptApi("updateAndFetchRequest", 2);
// Command to click on the save button.
...
cy.waitForMultipleRequest("@updateAndFetchRequest",2);
```

Consider we will get a toaster message after the update request. In that case,
we have to verify that toaster message and then we need to wait for the fetch
request. In that case, we can use the wait command like this.

```js
// Proper method

cy.interceptApi("updateAndFetchRequest", 2);
// Command to click on the save button.
....
cy.wait("@updateAndFetchRequest");
//  Verify the toastr message here.
...
cy.wait("@updateAndFetchRequest");
```

Keep in mind, we shouldn't skip any request without properly adding the
intercept and the wait command. We can see the alias as a tag for the
corresponding request in the logs. So just make sure that all the requests in
the spec have a tag attached to them in the logs.

A question people may have is why are we using glob pattern to match the URL
when we can use the particular URL for each intercept? Often, a seemingly simple action like clicking a form submit button or an edit button triggers multiple requests, each of which requires an intercept and a subsequent wait. If we are
using a particular URL for each intercept then we would first need intimate
knowledge of the API calls and their routing, we would also repeat the code for
each request. In such cases using the glob pattern to match all such API calls
is a smart decision because we could use the same intercept (specifying the no
of times a request is triggered) to wait for all it's attached requests, keeping
the code dry. Using glob patterns we can make intercepts a one-stop store for
all spying/waiting for several API calls.

e.g.

```javascript
// incorrect method

cy.intercept("api/v1/articles").as("updateArticleRequest");
cy.intercept("api/v1/categories").as("updateCategoryRequest");
cy.intercept("api/v1/comments").as("updateCommentsRequest");
// command to click submit button
...
cy.wait("@updateArticleRequest");
cy.wait("@updateCategoryRequest");
cy.wait("@updateCommentsRequest");

// correct method

cy.interceptApi("updateRequest", 3);
cy.get(commonSelectors.submitButton).click();
cy.waitForMultipleRequest("@updateRequest", 3);
```

```javascript
// incorrect method - intercepting all the requests at once
cy.interceptApi("allRequests", 5);
cy, get(blogSelectors.blogsList).click();
cy.wait("@allRequests");
cy.get(blogSelectors.addNewPost).click();
cy.clearAndType(blogSelectors.titleField, "My first blog");
cy.clearAndType(blogSelectors.descriptionField, "My first blog description");
cy.get(commonSelectors.submitButton).click();
cy.waitForMultipleRequest("@updateRequest", 3);

// correct method - intercepting requests separately
cy.interceptApi("fetchPosts");
cy, get(blogSelectors.blogsList).click();
cy.wait("@fetchPosts");
cy.get(blogSelectors.addNewPost).click();
cy.clearAndType(blogSelectors.titleField, "My first blog");
cy.clearAndType(blogSelectors.descriptionField, "My first blog description");
cy.interceptApi("updateRequest", 3);
cy.get(commonSelectors.submitButton).click();
cy.waitForMultipleRequest("@updateRequest", 3);
```
