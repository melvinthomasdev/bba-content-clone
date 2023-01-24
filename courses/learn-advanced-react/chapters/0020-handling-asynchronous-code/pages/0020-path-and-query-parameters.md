The insertion of data within the URL of an API endpoint can generally be done in 2 different ways:

- Path parameters
- Query parameters

In this section, we will compare the two methods used by fetching the details of a user with the ID `123456` from the API endpoint `https://example.com/api/user`.

## Path parameters

Path parameters are parts of the URL itself.

In our example, we can append the user ID or anything that uniquely identifies the user to the URL like so: `https://example.com/api/user/123456`.

It is more generally represented as the URL `https://example.com/api/user/:id` where `:id` is what we call the path parameter and identifies the user we're fetching data on.

A URL can have multiple path parameters like so:

  - `https://example.com/api/user/:id/task/:task_id`
  - `https://example.com/api/user/:first_name/:last_name`

## Query parameters

Query parameters are key-value pairs that are appended to a URL after a question mark like so: `https://example.com/api/user?id=123456`.

It can be generally represented as `https://example.com/api/user?key=value`.

A URL can have multiple query parameters separated by `&`. For example, `https://example.com/api/user?id=123456&task_id=789` has two query parameters `id` and `task_id` with the values `123456` and `789` respectively.

## Path vs Query parameters

How do you choose between these two methods?

Path parameters are used to identify a specific resource(s), while query parameters are used to sort/filter those resources.

Let's say we need to search for a user based on the `first_name` and `last_name` parameters. Using path parameters, the endpoint will look like `https://example.com/api/user/:first_name/:last_name`.

Using two path parameters side-by-side is usually considered a bad practice. Let's say the API has another endpoint that looks like this: `https://example.com/api/user/:id/tasks`.

A `GET` request to `https://example.com/api/user/123456/tasks` could cause a conflict here due to ambiguity. It could match with a potential `https://example.com/api/user/:first_name/:last_name` or `https://example.com/api/user/:id/tasks`

In this case, query parameters would be preferred and the URL could be built like this: `https://example.com/api/user?first_name=Oliver&last_name=Smith`

In cases where we need to pass more than one path parameter, we can separate the parameter segments with another segment. For example, the API endpoint above can be written as `https://example.com/api/user/:id/task/:task_id`
- `https://example.com/api/user/:id`
- `https://example.com/api/user/:username`

<!-- TODO: Rework section, poor structure -->

## Defining Query Parameters in Axios

We can define the query params in an Axios request using the `params` key, like so:

```js
axios.get("https://example.com/api/user", {
  params: { name: "Oliver", id: 1 },
});
```

This will produce a query string that looks like `https://example.com/api/user?name=Oliver&id=1`

## Encoding query parameters

URLs can only have certain characters from the standard 128-character ASCII set. Reserved characters such as `&`, `<blank space>`, `#` etc are not supported inside a URL and these must be encoded.

For example, when passing the full name as a query parameter you can't send it with a blank space between the first and last names like so: `https://example.com/api/user?full_name=Oliver Smith`

We need to encode this URL before sending a request to it like this: `https://example.com/api/user?full_name=Oliver%20Smith`

The API on receiving this request will parse the value `Oliver%20Smith` to `Oliver Smith`. `%20` is what we get when we encode a blank space using URL encoding. They replace reserved characters with a `%` followed by two hexadecimal digits.

[Axios](https://www.npmjs.com/package/axios) has a URL encoder feature built in. The `GET` request shown below translates to the URL: `https://example.com/api/user?full_name=Oliver%20Smith`:

```javascript
import { axios } from "axios";

axios.get("https://example.com/api/user", {
  params: { full_name: "Oliver Smith" },
});
```

If you require manual encoding of values, the [qs package](https://www.npmjs.com/package/qs) can be used to encode and parse URLs. To encode an object of parameters:

```javascript
import { stringify } from "qs";

const queryString = stringify({ full_name: "Oliver Smith" }); // => "full_name=Oliver%20Smith"
window.location.assign(`https://test.com/user?${queryString}`); //Redirects to https://test.com/user?full_name=Oliver%20Smith
```

Or to parse a query string of parameters to an object:

```jsx
import { parse } from "qs";

const user = parse("full_name=Oliver%20Smith"); // => { full_name: "Oliver Smith" }
<h1>Showing profile with name {user.full_name}</h1>;
```

You can also use this [website](https://www.url-encode-decode.com/) to test out the encoding and decoding of strings.

## URL naming convention

### Frontend

URLs that open a page should use the `kebab-case`. Doing so helps in increasing the SEO score of your website as these URLs usually appear in the browser address bar and search results.

For example, `https://example.com/user-profile` should open the user profile page.

### Backend

API endpoints should use the `snake_case` over `kebab-case`.

For example, `https://example.com/api/user/:id/friends_list` fetches the friends list for a user.
