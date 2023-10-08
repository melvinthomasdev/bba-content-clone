## Always use async/await instead of promise chains

When writing an asynchronous function, resort to the async/await syntax rather
than promise chains or callbacks.

Instead of this:

```javascript
const loadProfile = id => {
  return API.fetchProfileData(id).then(profile => {
    this.setState({ profile });
    this.props.navigate(`settings/profile/${id}`);
  });
};
```

It should be written like this:

```javascript
const loadProfile = async id => {
  try {
    const profile = await API.fetchProfileData(id);
    this.setState({ profile });
    this.props.navigate(`settings/profile/${id}`);
  } catch (err) {
    console.log(err);
  }
};
```

## Use try/catch blocks with Async functions

When writing an async function, we should try to wrap everything in a try/catch
block, whenever necessary.

Instead of this:

```javascript
const initializeSQLjs = async () => {
  const existingCode = localStorage.getItem(this.editorInputKey);
  const SQL = await sqljs({
    locateFile: () =>
      `https://cdn.jsdelivr.net/npm/sql.js@1.3.0/dist/sql-wasm.wasm`,
  });
};
```

It should be written like this:

```javascript
const initializeSQLjs = async () => {
  try {
    const SQL = await sqljs({
      locateFile: () =>
        `https://cdn.jsdelivr.net/npm/sql.js@1.3.0/dist/sql-wasm.wasm`,
    });
  } catch (error) {
    console.log(error);
  }
};
```

There are exceptions when you can skip the try/catch block. For example,
consider a scenario when an asynchronous function is called inside another
asynchronous function. In such a case you can skip the try/cath block inside the
first asynchronous function which is called inside another function. For
example, consider a function that makes an API request.

```javascript
import axios from "axios";

const fetchData = () =>
  axios.get("https://api.agify.io?name=michael&country_id=US");
```

Making an API request is an asynchronous operation and ideally it should be
wrapped inside a try/catch block. Now consider a scenario where fetchData is
called inside another asynchronous function like this:

```javascript
const setData = async () => {
  try {
    await fetchData();
  } catch (error) {
    alert(error);
  }
};
```

In the above code, the call to fetchData is wrapped inside a try/catch block and
any error inside the `fetchData` will be caught by the catch block inside the
`setData` function. Hence we can omit the try/catch block in such a case.

Had we added a try/catch block within the declaration of the `fetchData`
function, then to catch any error encountered during the API call we would have
had to throw/reject the error from the catch block so that the error could be
caught again in the catch block of the parent, like say the `setData` function.
Doing so would have led us to repeat ourselves as we would be doing error
handling twice which we can avoid.

Note that the try/catch block inside an asynchronous function should not be
skipped unless that function is called inside another asynchronous function
within a try/catch block. For example, the following would not work as intended:

```javascript
import axios from "axios";

const fetchData = () =>
  axios.get("https://api.agify.io?name=michael&country_id=US");

fetchData();
```

Another thing to note here is that we have not used the `async` and `await`
keywords in `fetchData` function because `async` keyword is used to declare
functions that always returns a promise. If the return value of an async
function is not explicitly a promise, it will be implicitly wrapped inside a
promise. For example, if the return value is non-promise like a string then the
string will be wrapped inside a promise and returned from the function.

In the case of `fetchData`, the return value is a promise hence the use of
`async` keyword is not required.

We have not awaited the promise to resolve inside the `fetchData` function
because `fetchData` itself is called with an `await` keyword inside the
`setData` parent function. Hence the execution thread will only move ahead when
the return value of whatever `fetchData` resolves into.

Keep in mind that if there are any asynchronous side effects in the `fetchData`
function apart from the returned promise then an `await` keyword should be added
for those. For example:

```javascript
import axios from "axios";

const fetchData = async () => {
  await otherAsynchronousSideEffect();
  return axios.get("https://api.agify.io?name=michael&country_id=US");
};
```

Since we cannot use the `await` keyword outside of an `async` function, we have
added an `async` keyword as well in the above example.

## Different ways of declaring async functions

Take a look at the following example, where all the versions of the update
function have the same behaviour.

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

## Why use async/await

To answer this we need to understand how we handled asynchronous code in
javascript world before async/await.

Before async/await, we had callback functions and promises.

```javascript
const request = require("request");
request("https://example.com", (err, res) => {
  if (err) {
    console.error(err);
  } else {
    this.setState({ profile: res.data });
    //Rest of code....
  }
});
```

Above is the example of a callback function. In order to execute the code
synchronously, we have to write the code in nested format. They do not scale
well even for moderately complex asynchronous code. The resulting code often
becomes hard to read, easy to break, and hard to debug.

Although promises are definitely an improvement on callbacks, they too are not
without problems.

## Using the finally block

There is a `finally` block which you should use for performing operations which
need to be performed regardless of the result of the asynchronous operation. For
example, consider the following example:

```jsx
import React, { useState, useEffect } from "react";
import axios from "axios";

const Display = () => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    try {
      const data = await axios.get(
        "https://api.agify.io?name=michael&country_id=US"
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

In the above code, if the `finally` block isn't used then `setLoading(false)`
will need to be called inside both `try` as well as `catch` blocks. That will
lead to code-repetition. Besides, the whole point of a `finally` block is to
contain code that should be executed regardless of how the promise resolves. So
using a `finally` block is the correct way to do it.

However, there is an edge case where the finally block would become obsolete.
Consider the following code:

```javascript
import React, { useState, useEffect } from "react";
import axios from "axios";

const Display = ({ history }) => {
  const [data, setData] = useState(null);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    try {
      const data = await axios.get(
        "https://api.agify.io?name=michael&country_id=US"
      );
      setData(data);
      history.push("/");
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

In the above code, in case if the promise resolves successfully then the
application will be redirected to another path and the `Display` component will
be unmounted before the execution reaches `finally` block. Note that your code
will behave the same if `history.push("/")` is replaced with
`window.location.href` method. Hence in such cases it doesn't make sense to use
a finally block.

When you render the above mentioned component, it will show the following error
in the browser console:

<image>state-update-in-unmounted-component.png</image>

In the above case, to invoke the `setLoading(false)` React state update when the
promise resolves successfully, we must call it inside the `try` block rather
than the `finally` block.

## Why do we use state to store response data?

We use the state to store data so that when the request promise is completed the component will be re-rendered to show the updated content or perform the required actions. Making requests to the server is an async operation. After completing the request the response data is stored in a state. This state update causes React to re-render the component. And after this re-render, the updated data is displayed in UI.

## Don't manipulate data before storing

We should not manipulate the response data before storing it. We should store the request's response data in the exact format server sends us. Any further manipulation needed with the data should be done after storing the data in the state.

Let's understand with an example. Let's say we have a component where we are requesting `members` and these `members` are used by two components `Table` and `Select`. This `Select` component needs to restructure the `members` array to populate its `options` prop properly.

The structure of `members` from backend response is like this:

```js
members = [
  {
    name: "Oliver Smith",
    id: "1"
  },
  //other values
]
```

The structure of `members` required by the `Select` component is like this:

```js
members = [
  {
    label: "Oliver Smith",
    value: "1"
  },
  //other values
]
```

The `Table` component requires the `members` in the same structure as sent by the server.

The code will look like this:

```jsx
const Dashboard = () => {
  const [members, setMembers] = useState([]);

  const formatMembersForSelect = members => {
    //code to restructure members for Select
  };

  const fetchMembers = async () => {
    try {
      const { members } = await axios.get("api/v1/members");
      setMembers(formatMembersForSelect(members)); // anti-pattern: shouldn't format here.
    } catch () {
      //rest of the code to handle errors
    }
  };

  return (
    <div>
      <Table
        rows={members} //this will not work
      />
      <Select options={members} />
    </div>
  );
};
```

As per the statement, `setMembers(formatMembersForSelect(members));`, we have manipulated the backend response before storing it into the state called `members`, and this is an anti-pattern. We should store the `members` state with the exact same data, that was sent by the server. Here the formatting is a necessity only for the Select component. Thus only when passing the value to the Select component, we should format it, rather than storing the formatted value in the state itself. Also, we due to this formatting, we lost the initial structure of `members` data. The `Table` component which requires `members` in the same structure as sent by the server will not work properly anymore.

So the correct code will be, like this:

```jsx
const Dashboard = () => {
  const [members, setMembers] = useState([]);

  const formatMembersForSelect = members => {
    //code to restructure members for Select
  };

  const fetchMembers = async () => {
    try {
      const { members } = await axios.get("api/v1/members");
      setMembers(members);
    } catch () {
      //rest of the code to handle errors
    }
  };

  return (
    <div>
      <Table rows={members} />
      <Select
        options={formatMembersForSelect(members)} // correct place to apply the formatting
      />
    </div>
  );
};
```

Further reading

- [Asynchronous JavaScript: Introducing async and await](https://www.twilio.com/blog/asynchronous-javascript-introducing-async-and-await)
- [Callback Hell](http://callbackhell.com)
- [JavaScript: Promises and Why Async/Await Wins the Battle](https://dzone.com/articles/javascript-promises-and-why-asyncawait-wins-the-ba#)
