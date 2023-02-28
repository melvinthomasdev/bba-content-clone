If you require manual encoding of values, you can use the [qs or "QueryString" package](https://www.npmjs.com/package/qs) to encode and parse URLs.

Use `stringify` To encode parameters:

```javascript
import { stringify } from "qs";

const queryString = stringify({ full_name: "Oliver Smith" }); // => "full_name=Oliver%20Smith"
window.location.assign(`https://test.com/user?${queryString}`); //Redirects to https://test.com/user?full_name=Oliver%20Smith
```

Use `parse` to decode parameters:

```jsx
import { parse } from "qs";

const user = parse("full_name=Oliver%20Smith"); // => { full_name: "Oliver Smith" }
<h1>Showing profile with name {user.full_name}</h1>;
```

You can also use this [website](https://www.url-encode-decode.com/) as a testbed to encode or decode snippets of string.