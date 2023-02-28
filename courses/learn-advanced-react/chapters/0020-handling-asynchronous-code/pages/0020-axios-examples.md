Here are a few different ways to implement the same `update` function to change a task using the `axios` package.

All of the below examples are variants of the same function and have the same functionality.

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