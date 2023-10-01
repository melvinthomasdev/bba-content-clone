## What is request?

- A request is a way to communicate between a server and a browser.
- A request is sent to a server and then the server responds with the
  appropriate data back to the browser, also known as a client.

## What is required for a request?

- For a request to be made mainly below things needs to be considered:

## HTTP Method (method)

- There are many types of methods but mainly we use four of them:
  1. `GET` : Indicates that some data is required from a server. This is the
     default method when you type a URL in a browser.
  2. `POST` : Indicates that the new data needs to be entered into a server and
     usually has a body.
  3. `PUT` : Indicates that we want to modify the existing data in some way.
  4. `DELETE` : Indicates that we want to delete some existing data.

## URL

- URL is a path that we usually type in a browser like `http://google.com`
- It can also contain query parameter at the end. In
  `http://google.com?name=bigbinary&location=pune` we are adding two query
  parameters `name(bigbinary)` and `location(pune)`.


## Headers

- Header is also known as a metadata for a request like what kind of content is
  being sent or what kind of content is accepted (visit
  [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers) for common
  headers).
- It also contains cookies that are stored in a browser.
- Using these cookies and headers server identifies which user is sending a
  request.

## Body / Payload

- Body is usually a data that we want to send along with the request.
- It can be of type string, json object, array or a file(video/audio)

# What do we get in response?

- Response only contains three main things:

## Status

- Status is a code that shows whether a response is successful or something went
  wrong. If request was a success it will return `200` as a status. (visit
  [here](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) for all the
  available status codes and their meanings)

## Response Headers

- It is same as a request header but contains the metadata about response.

## Body / Payload

- Whenever a data needs to be returned from a server usually you get it in the
  form of body/payload.

# How to track a request in browser?

- There are different ways to get into developer tools in the browser that you
  might need to look online.
- You need to visit the `Network` tab and refresh the page. It will show you the
  list of all the request that are being sent.
- Once you click a particular request you will be able to locate different
  things using below diagrams:

<image>request-and-headers.png</image>

<image>payload.png</image>

<image>response.png</image>

# How do we use it?

- In order to make request, cypress gives us a default command called
  `cy.request`. Which, by default will not handle authentication for you.
- When you authenticate using UI, the authentication details are stored as
  cookies in the browser.
- To pass the authentication details, with every request you need to also
  include cookies in the request headers, which is done automatically by browser
  but this will not work in case of manual request made by `cy.request`.
- Therefore, we have introduced a new custom command called `apiRequest` shown
  below.

```javascript
Cypress.Commands.add("apiRequest", options =>
  cy.get("@requestHeaders").then(requestHeaders =>
    requestHeaders
      ? cy.request({
          ...options,
          headers: { ...requestHeaders, "accept-encoding": "gzip" },
        })
      : cy.log("No request headers found")
  )
);
```

- To use this properly, post every login you need to get headers from any
  request and set it's alias as `requestHeaders` as shown below

```javascript
cy.wait("@fetchInitialData").then(({ request }) =>
  cy.wrap(request.headers).as("requestHeaders")
);
```

- Now every request made using `apiRequest` will use headers created during
  login.
- Apart from this you can use parameter from
  [cypress document](https://docs.cypress.io/api/commands/request) to fill other
  details like body, method and url.

- For Example

```javascript
cy.apiRequest({
  url: "api/v1/request-url", // request url
  method: "POST", // request method
  form: true, // other parameters for cy.request
  body: {
    // request body
  },
  failOnStatusCode: false,
});
```

`failOnStatusCode` flag is used to tell the Cypress to not fail the test if the `status code is not 200`. By default, the test will fail if the `status code is not 200`.

# Example of searching and deleting data using request.

- Apart from setting alias right after login, first you need to search the id of
  the data that you want to delete from a server by using below method:

```javascript
cy.apiRequest({
  method: "GET",
  url: "<URL to search all the data>",
  qs: { "data[search_string]": "<String to be searched>" }, // query parameter to filter data
});
```

- This will return all the data that matches query parameters.
- From that data you can segregate `Id` of the data that you want to delete and
  make a delete request.

```javascript
cy.apiRequest({
  method: "PATCH",
  url: "<URL to delete the data>",
  body: { data: { ids: ["<Ids of the data to be deleted>"] } },
});
```

- If you combine both above functions than you end up with below function which
  will search and delete data.

```javascript
cy.apiRequest({
  method: "GET",
  url: "<URL to search all the data>",
  qs: { "data[search_string]": "<String to be searched>" },
}).then(({ body }) => {
  const dataDetails = body.data[0];

  cy.apiRequest({
    method: "PATCH",
    url: "<URL to delete the data>",
    body: { data: { ids: [dataDetails.id] } },
  });
});

// reload if you want the data to appear in UI.
```

# When to use request?

We already discussed how to use the request method in the above section. Now, let's see when to use the request method. Let's say we need to add a test case for editing an article. But we cannot edit an article without creating it. Consider we already have another test case for creating an article. So we don't have to create the article via UI which is a time taking process. Instead, we can create an article via request and then edit it via UI. This will save a lot of time. We will create the article via request in the `before` hook and then edit it via UI in the `it` block. Also, at the end of the test, we can delete the article via request in the `after` hook. This will make sure that the article is deleted after the test is completed.

```javascript
describe(() => {
  beforeEach(() => {
    cy.apiRequest({
      method: "POST",
      url: "<URL to create an article>",
      body: { data: { title: "Article Title", body: "Article Body" } },
    });

    cy.reloadAndWait(2);
  });

  it(() => {
    // edit the article via UI
  });

  afterEach(() => {
    cy.apiRequest({
      method: "GET",
      url: "<URL to search all the data>",
      qs: { "data[search_string]": "Article Title" },
    }).then(({ body }) => {
      const dataDetails = body.data[0];

      cy.apiRequest({
        method: "PATCH",
        url: "<URL to delete the data>",
        body: { data: { ids: [dataDetails.id] } },
      });
    });
  });
});
```

Note: We should define these request methods as utility functions. So that we can reuse them in other tests as well.

In the above test case, we have used `cy.reloadAndWait(2)` after calling the `cy.apiRequest` method. This is because if we do something using the request method, it will get reflected in the UI only after reloading the page. So, we need to reload the page and wait for the network requests to get completed. Here is the implementation of `cy.reloadAndWait` method:

```javascript
Cypress.Commands.add("reloadAndWait", requestCount => {
  requestCount && cy.interceptApi("fetchRequests", requestCount);
  cy.reload();
  requestCount && cy.waitForMultipleRequest(requestCount);
});
```

Now, consider we have to create more data. In that case, we might need to call request methods multiple times. But we don't have to reload the page every time. We need to reload only after completing all the request methods.

```javascript
beforeEach(() => {
  // Incorrect
  articleUtils.createArticleViaRequest(articleDetails);
  cy.reloadAndWait(4);
  categoryUtils.createCategoryViaRequest(categoryDetails);
  cy.reloadAndWait(4);

  // Correct
  articleUtils.createArticleViaRequest(articleDetails);
  categoryUtils.createCategoryViaRequest(categoryDetails);
  cy.reloadAndWait(4);
});
```
