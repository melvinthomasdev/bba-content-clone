This section of the guide assumes you have prior knowledge of promises, async
functions, the try-catch blocks and the fetch API. If you'd like a refresher,
please refer to
[this guide ](https://courses.bigbinaryacademy.com/learn-advanced-javascript/promises/asynchronous-and-callbacks/)
made by our folk here at BigBinary.

Axios is an HTTP client-side library that allows you to make HTTP requests much
like the `fetch()` method.

However, it does have a few advantages over the Fetch API like not having to set
your headers or perform tedious tasks such as converting your request body to a
JSON string for each request.

It also has better error handling and can throw quite a few 4xx and 5xx errors
for you off the bat.

Here's an example of a simple get request in a simple component:

```jsx
import axios from "axios";
import React from "react";

const userURL = "/users/123";

const UserCard = () => {
  const [user, setUser] = useState(null);

  const fetchData = async () => {
    try {
      const { data: userData } = await axios.get(userURL);
      setUser(userData);
    } catch (error) {
      console.log(error);
    }
  };

  useEffect(() => fetchData(), []);

  if (!user) return null;

  return (
    <div>
      <h1>{user.name}</h1>
      <img src={user.profilePicture} />
    </div>
  );
};

export default App;
```

The above code uses an initializer `useEffect` hook to fetch data regarding the
user for the UserCard component.

## Setting Default Headers

Axios follows the "Singleton Pattern" and as such, we receive a singleton when
we import it. Any changes we make to this singleton will be reflected everywhere
we use Axios.

This is extremely useful while handling headers. When logging in, we can set
auth tokens in Axios headers so that we won’t have to specify it for every
request. When logging out, we can reset the Axios headers.

You can add headers like base URLs, default timeouts & tokens such as an
`X-CSRF` token as shown:

```jsx
import axios from "axios";
import { getCSRFToken } from "components/utils";

axios.defaults.baseURL = "https://example.com/api/v1/";
axios.defaults.timeout = 1000;
axios.defaults.headers.common["X-CSRF-Token"] = getCSRFToken();

//Any further requests will now use the defaults set above
axios.get("/users/123").then(response => {
  console.log(response);
});
```

It is suggested to add the above configuration to an initializer `useEffect`
hook inside `App.jsx` (or the highest component in your hierarchy) so that those
Axios defaults are prepared to be used throughout the app.

Also, errors in Axios are resolved by default when the status code is between
`200` - `300`, otherwise, the request will be rejected. You can change this by
passing a [validateStatus](https://github.com/axios/axios#handling-errors) in
the request config.

## Bypassing Defaults

When you need to make API calls that differ from the defaults, you can create a
new instance to handle with its config as shown:

```jsx
import axios from "axios";
import { getCSRFToken } from "components/utils";

const API = axios.create({
  baseURL: "https://example.com/api/v2/",
  timeout: 2000,
  headers: {
    "X-CSRF-Token": getCSRFToken(),
  },
});

API.get("/users/123").then(response => {
  console.log(response);
});
```
