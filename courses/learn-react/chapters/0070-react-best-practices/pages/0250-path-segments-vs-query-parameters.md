In this section, we will fetch the details of a user with the ID `1234567890`
from the API - `https://example.com/api/user`. There are two ways APIs are
generally designed to achieve this.

## Path segments

Path segments are parts of a URL. Parameters can be added to the URL as path
segments. In our example, we can append the user ID or any other property that
can be used to uniquely identify the user to the URL.

```text
https://example.com/api/user/1234567890
```

A `GET` request to this API endpoint will return the details of the user with
the ID `1234567890` because that is the ID supplied in the path segment.

We can generally represent this endpoint as

```text
https://example.com/api/user/:id
```

Here `:id` is the path segment. If we replace `:id` with a user ID, the API will
return the details of the corresponding user.

A URL can have multiple path segments. For example,

1. `https://example.com/api/user/:id/task/:task_id`
2. `https://example.com/api/user/:first_name/:last_name`

## Query parameters

Query parameters are `key-value` pairs that are appended to a URL after a
question mark like this:

```text
https://example.com/api/user?id=1234567890
```

A `GET` request to this API endpoint will return the details of the user with
the ID `1234567890` because that is the ID supplied in the query parameter
`id=`.

A URL can have multiple query parameters separated by `&`. For example,

```text
https://example.com/api/user?id=1234567890&task_id=24123489`
```

This URL has two query parameters `id` and `task_id` with the values
`1234567890` and `24123489` respectively.

## Path segments vs Query parameters

Now let's look at when path segments are preferred and when query parameters are
preferred.

Let's say we need to search for a user based on the `first_name` and `last_name`
parameters. Using path segments, the endpoint will look like:

```text
https://example.com/api/user/:first_name/:last_name
```

Using two path segments side-by-side is usually considered a bad practice. Let's
say the API has another endpoint that looks like this:
`https://example.com/api/user/:id/tasks`. A `GET` request to
`https://example.com/api/user/1234567890/tasks` may cause a conflict because it
could mean two things -

1. Matching with `https://example.com/api/user/:first_name/:last_name`:
   first_name is 1234567890 and last_name is tasks
2. Matching with `https://example.com/api/user/:id/tasks`: id is 1234567890

In this case, query parameters are usually preferred,

```text
https://example.com/api/user?first_name=Oliver&last_name=Smith
```

Query parameters clearly indicate which parameter is being passed. Query
parameters are usually preferred for endpoints used to search or filter a
collection of entities or when we have to pass more than one parameter. Like in
the above example, the endpoint is used to search for users with first name
"Oliver" and last name "Smith".

There are cases where we need to pass more than one parameter using path
segments. This can be achieved by separating the parameter segments with another
segment. For example, the API endpoint to fetch a task with ID `24123489` that
was created by the user with ID `1234567890` can be:

```text
https://example.com/api/user/:id/task/:task_id
```

Path segments are preferred when the parameter passed is a unique identifier.

- `https://example.com/api/user/:id`
- `https://example.com/api/user/:username`

Two unique identifiers can also be passed in the following format:

```text
https://example.com/api/user/:id/task/:id
```

In conclusion, `path segments` are preferred when fetching the details of a
`single entity` using a unique identifier. `Query parameters` are preferred when
fetching details of `multiple entities` like when performing a search or filter
operation.

## How to send query params?

We can define the query params in the options object of request using the `params` key, like so:

```js
axios.get("https://example.com/api/user", {
  params: { name: "Oliver", id: 1 },
});
```

Axios will take care of handling the parameters and maintaining their type. Axios will serialize `options.params` object and add it to the query string. The resultant query string for the above mentioned Axios request will be like so:

```text
https://example.com/api/user?name=Oliver&id=1
```

We can utilize the above mentioned params in backend using the `params` hash. We can directly access the required param by using the `key` of that param in `params` hash. For example, we can access the `name` param, like so:

```rb
params[:name] #Oliver
```

We can directly use these params in say a `where` clause, like so:

```rb
User.where(id: params[:id], name: params[:name])
```

We can also send an array of values in query params, like so:

```js
axios.get("https://example.com/api/user", {
  params: {
    ids: [1, 2, 3],
  },
});
```

And array params can be accessed in the same way, like so:

```rb
User.where(id: params[:ids])
```

Now let's consider a special case when we need to send an array of values in the query params and also wanted to maintain the position of items in the array then we have to define a serializer for params. We can use the [qs](https://www.npmjs.com/package/qs) package to parse and serialize the params like so:

```js
axios.get("https://example.com/api/user", {
  params: {
    ids: [1, 2, 3],
  },
  paramsSerializer: params => {
    return qs.stringify(params);
  },
});
```

The resultant query string for the above mentioned Axios request will be like so:

```text
https://example.com/api/user?ids[0]=1&ids[1]=2&ids[2]=3
```

And we can access the query params, like so:

```rb
User.where(id: params[:ids]) # users with [1, 2, 3] ids
User.where(id: params[:ids][0]) # user with "1" id
```

## Encoding query parameters

URLs can only have certain characters from the standard 128 character ASCII set.
Reserved characters such as `&`, `blankspace`, `#` etc are not supported inside
a URL and these must be encoded.

For example, let's say we are passing full name as a query parameter:

```text
https://example.com/api/user?full_name=Oliver Smith
```

In this case, there is a blankspace between the first and last names. We need to
encode this URL before sending a request to it. The above URL when encoded will
look like this:

```text
https://example.com/api/user?full_name=Oliver%20Smith
```

The blankspace is replaced with `%20`. The API on receiving this request will
parse the value `Oliver%20Smith` to `Oliver Smith`. `%20` is what we get when we
encode a blankspace using URL encoding. They replace reserved characters with a
`%` followed by two hexadecimal digits. You can use this
[website](https://www.url-encode-decode.com/) to URL encode/decode a string.

The [qs](https://www.npmjs.com/package/qs) package can be used to encode and
parse URLs. To encode an object of parameters:

```javascript
import { stringify } from "qs";

// Returns full_name=Oliver%20Smith
const queryString = stringify({ full_name: "Oliver Smith" });

// Redirects to https://example.com/user?full_name=Oliver%20Smith
window.location.assign(`https://example.com/user?${queryString}`);
```

To parse a query string of parameters to an object:

```jsx
import { parse } from "qs";

// Returns { full_name: "Oliver Smith" }
const user = parse("full_name=Oliver%20Smith");

<h1>Showing profile with name {user.full_name}</h1>;
```

[Axios](https://www.npmjs.com/package/axios) has the URL encoder feature built
in. The following code sends a `GET` request to
`https://example.com/api/user?full_name=Oliver%20Smith`:

```javascript
import { axios } from "axios";

axios.get("https://example.com/api/user", {
  params: { full_name: "Oliver Smith" },
});
```

## URL naming conventions

**Frontend**

URLs that open a page should use the `kebab-case`. These URLs usually appear in
the browser address bar and search results. Doing so helps in increasing the SEO
score of your website. For example, `https://example.com/user-profile` opens the
User Profile page.

**Backend**

API endpoints should use the `snake_case` over `kebab-case`. For example,
`https://example.com/api/user/:id/friends_list` fetches the friends list for a
user.
