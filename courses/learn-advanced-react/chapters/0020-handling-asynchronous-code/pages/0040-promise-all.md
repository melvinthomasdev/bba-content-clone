`Promise.all` is a method that takes an array of promises as an input and
returns a single `Promise` that will resolve only when all the input’s promises
have been fulfilled.

Let's take an incorrect example of an effect that runs once on startup. It first
retrieves a post and then its comments via two async API functions
`fetchPostDetails()` and `fetchComments()` respectively before setting the
`loading` state to false as shown:

```javascript
useEffect(() => {
  fetchPostDetails();
  fetchComments();
  setLoading(false);
}, []);
```

The problem here is that `setLoading` does not wait for the fetch to complete.
It will stop the loading irrespective of whether the fetch happens or not.

We can work around this using the async await format as shown:

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

The `setLoading(false)` now waits for the `fetchComments()` function which in
turn waits for the `fetchPostDetails()` functions. This works, but why wait for
the API calls to be sequentially executed when they can be called at the same
time?

Using `Promise.all`, we can make the requests together and call
`setLoading(false)` after all requests are completed as shown:

```javascript
const fetchPostDetailsAndComments = async () => {
  await Promise.all([fetchPostDetails(), fetchComments()]);
  setLoading(false);
};

useEffect(() => {
  fetchPostDetailsAndComments();
}, []);
```

This ensures `loading` is set to `false` only after both APIs have been called
simultaneously. This happens to be the ideal use case of `Promise.all` i.e: when
we have to resolve multiple independent promises asynchronously.

If any of the requests fail, `Promise.all` also fails immediately and stops all
work. It will return the first failing promise’s message/error.

## Pitfalls

When working with async functions, remember to not just pass function names like
so:

```jsx
await Promise.all([fetchPostDetails, fetchComments]); //Do not do this
```

The `Promise.all` will resolve immediately by returning the function definitions
of `fetchPostDetails` and `fetchComments` instead of invoking the async
functions.

Also, keep in mind that one should not use `Promise.all` when the requests are
associated with each other. If the order of execution of requests can change the
results, avoid using `Promise.all`.

For example, fetching the likes on a post and sorting the posts by likes
shouldn't be run together as shown:

```javascript
const updateAndSortPosts = async () =>
  await Promise.all([updateLikes(), sortPostsByLikes()]);

useEffect(() => {
  updateAndSortPosts();
}, []);
```

This might allow for the sorting to happen before the fetch gives you an
incorrect sort. The sort must always happen after the fetch like this:

```javascript
const updateAndSortPosts = async () => {
  await updateLikes();
  await sortPostsByLikes();
};

useEffect(() => {
  updateAndSortPosts();
}, []);
```
