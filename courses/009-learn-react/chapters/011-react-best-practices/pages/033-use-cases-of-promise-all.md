## What is Promise.all?

`Promise.all` is a method that takes an array of promises as an input and returns a single `Promise` that will resolve only when all the input’s promises have been fulfilled. It fails immediately and stops all the work if any of the input promises fail, and will return the first failing promise’s message/error.

## When to use Promise.all?

Let's consider a component where we are rendering a post that has some details like a photo, title, caption, and some comments.

We have 2 separate APIs to fetch the details of the post and the comments.

This component has a `loading` state which initially has a value of true and there will be a `Loader` on screen until the `loading` state is set to false.

Now we have to fetch the details of the post and the comments when the component mounts and set the `loading` state to false. As a result, the `Loader` will stop and the details and comments will be displayed.

Let's assume that `fetchPostDetails()` is an async function that gets the details of the post, `fetchComments()` is also an async function that gets the comments of the post, and `setLoading(false)` will set the `loading` state to false.

Solution 1:

```javascript
useEffect(() => {
  fetchPostDetails();
  fetchComments();
  setLoading(false);
}, []);
```

Here details and comments will be fetched and the `loading` state will also be set to false when the component mounts.

So what's the problem? Will the `setLoading` wait for the fetch to complete?

The answer is no. The `setLoading(false)` will be called irrespective of the completion of the fetching of the details and comments. This means that the loader will stop, but there is no confirmation that the details and comments will be rendered in the UI at that time.

Solution 2:

```javascript
const fetchPostDetailsAndComments = async () => {
  await fetchPostDetails();
  await fetchComments();
  setLoading(false);
};

useEffect(() => {
  fetchPostDetailsAndComments();
}, []);
```

Now, how is this different from the first solution? Let's see.

In the `fetchPostDetailsAndComments` method first `fetchPostDetails()` will be called. After completion of `fetchPostDetails()`, `fetchComments()` will be called. Following the completion of `fetchComments()`, `setLoading(false)` will be executed. This looks fine, but we can do better.

When we are invoking `fetchPostDetails()`, the `fetchComments()` statement waits for the `fetchPostDetails()` to complete. We are making API calls in a plain sequential order where each request is waiting for the last one to complete. That's wastage of time over here since the two API calls are independent of each other.

Solution 3:

```javascript
const fetchPostDetailsAndComments = async () => {
  await Promise.all([fetchPostDetails(), fetchComments()]);
  setLoading(false);
};

useEffect(() => {
  fetchPostDetailsAndComments();
}, []);
```

Now, this is the ideal use case of `Promise.all`. `Promise.all` is useful when we have to resolve multiple independent promises in an async manner.

In the above example rather than invoking the functions in `Promise.all` if we pass function names that is `fetchPostDetails` and `fetchComments` then it will be wrong. The `Promise.all` will resolve immediately by returning function definition of `fetchPostDetails` and `fetchComments` as we are not invoking any async operation here, we are just passing function definition.

With proper function invocation all the requests will be made together in a parallel fashion, and the `setLoading(false)` will be called only after the completion of all the requests. `Promise.all` will wait for all the requests to be completed. It also has a `fail-fast` implementation, which means if in between any of the requests fails, then `Promise.all` will fail immediately and rejects the promise.

After completion of `Promise.all` which can either resolve or reject the `setLoading(false)` will be executed. After that loading will be stopped and the required details or error message will be displayed in the UI depending upon `Promise.all` got resolved or failed.

## When not to use Promise.all?

We should not use `Promise.all` when the requests are associated with each other. If there is a case when the order of execution of requests can change the results we should avoid using `Promise.all`.

Let's say we have a list of posts where each of them is having several likes. We want to update the number of likes in some of the posts and sort them by the number of likes.

By using the `Promise.all` code will be:

```javascript
const updateAndSortPosts = async () => {
  await Promise.all([updateLikes(), sortPostsByLikes()]);
};

useEffect(() => {
  updateAndSortPosts();
}, []);
```

In the above code, there can be a case when sorting completes first and then likes are updated which will give the wrong results because both the requests are made together in a parallel fashion. Both of these requests are associated with likes and thus we should not use `Promise.all` in this case.

The correct solution in this case will be:

```javascript
const updateAndSortPosts = async () => {
  await updateLikes();
  await sortPostsByLikes();
};

useEffect(() => {
  updateAndSortPosts();
}, []);
```

## Features of Promise.all

- Aggregates a group of promises to a single promise which helps in working with results of multiple asynchronous operations together.
- `fail-fast` behavior where `Promise.all` fails immediately with the first error message if any of the input promises fails.
- Provides us a way of resolving multiple promises in a parallel fashion.
