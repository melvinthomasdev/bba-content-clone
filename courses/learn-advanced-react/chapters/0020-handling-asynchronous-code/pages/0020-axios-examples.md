Here are a few different ways to implement the same `update` function to change a task using the `axios` package.

All of the below examples are variants of the same axios function and have the same functionality.

```javascript
// Implicit return, no async keyword, no await keyword
const update = ({ slug, payload }) => axios.put(`/tasks/${slug}`, payload);

// Implicit return, async keyword added, no await keyword
const update = async ({ slug, payload }) =>
  axios.put(`/tasks/${slug}`, payload);

// Implicit return, async keyword added, await keyword added
const update = async ({ slug, payload }) =>
  await axios.put(`/tasks/${slug}`, payload);

// Explicit return, no async keyword, no await keyword
const update = ({ slug, payload, quiet }) => {
  const path = `/tasks/${slug}${quiet && "?quiet"}`;
  return axios.put(path, payload);
};

// Explicit return, async keyword added, no await keyword
const update = async ({ slug, payload, quiet }) => {
  const path = `/tasks/${slug}${quiet && "?quiet"}`;
  return axios.put(path, payload);
};

// Explicit return, async keyword added, await keyword added
const update = async ({ slug, payload, quiet }) => {
  const path = `/tasks/${slug}${quiet && "?quiet"}`;
  return await axios.put(path, payload);
};
```

The above examples are equivalent since we were talking about Axios functions which returns a Promise. In the case where a function
doesn't return a Promise, the equailvaency of function declarations that we had discussed earlier won't hold true.

For example, the following function declarations are NOT equivalent if `runSomething` doesn't return a Promise:

```javascript
// declaration 1: doesn't return promise
const fn = () => runSomething();

// declaration 2: returns a promise
const fn = async () => runSomething();
```
