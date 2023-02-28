In the previous page, you've probably noticed the entire body of the async
function being wrapped in a `try/catch` block.

When writing an async function that interacts with a server, there's always a
chance of failure which is mitigated by the `try/catch` block.

When writing asynchronous functions like this one:

```javascript
const fetchUserData = async userId => {
  const response = await API.fetchUserData(userId);
  setUserData(response);
};
```

Make sure you catch possible errors with the `try-catch` block.

```javascript
const fetchUserData = async userId => {
  try {
    const response = await API.fetchUserData(userId);
    setUserData(response);
  } catch (error) {
    console.log(error);
  }
};
```

There are exceptions when you can skip the try/catch block. When using an
asynchronous function that uses a `try/catch` block inside another asynchronous
function, you can skip the error catching in the top-level function like so:

```javascript
import axios from "axios";

const fetchUserData = () =>
  axios.get("https://example.com?name=michael&country_id=US");

const initializeUserData = async () => {
  try {
    const response = await fetchUserData();
    setUserData(response);
  } catch (error) {
    alert(error);
  }
};
```

You don't have to wrap the contents of `fetchData` inside a `try/catch` block
since the only async code in `initializeData` is `fetchData`.

If we'd implemented a try/catch block within the declaration of the `fetchData`
function, we would also need to either throw or reject the error from the catch
block so the parent block could catch the error.

## The Finally Block

Remember to use the `finally` block for operations that need to be performed
regardless of the result of the asynchronous operation like so:

```jsx
import React, { useState, useEffect } from "react";
import axios from "axios";

const Display = () => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    try {
      const data = await axios.get(
        "https://example.com?name=michael&country_id=US"
      );
      setData(data);
    } catch (error) {
      alert(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => fetchData(), []);

  if (loading) return <p>Loading...</p>;

  return <p>{data}</p>;
};

export default Display;
```

In the code above, the `finally` block runs regardless of an error and sets
`loading` to false. It helps reduce code repetition.

We could set loading to false outside of the `try/catch` block and avoid the
`finally` block as shown:

```jsx
const fetchData = async () => {
  try {
    const data = await axios.get(
      "https://example.com?name=michael&country_id=US"
    );
    setData(data);
  } catch (error) {
    alert(error);
  }
  setLoading(false);
};
```

While the above implementation of `fetchData` works just fine in most cases, the
difference is that it won't set `loading` to false if there's an error in the
catch block.

The `finally` block always runs, even if the catch block runs into its own
error.
