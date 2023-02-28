URLs can only have certain characters from the standard 128-character ASCII set. Reserved characters such as `&`, `<blank space>`, `#` etc are not supported inside a URL and these must be encoded.

For example, when passing a full name as a query parameter, since you can't send it with a blank space between the first and last names like `api/user?full_name=Oliver Smith`, you can encode the URL before sending the request like this: `api/user?full_name=Oliver%20Smith`.

The API on receiving this request will parse the value `Oliver%20Smith` to `Oliver Smith`.

Encoded characters are represented by a `%` followed by two hexadecimal digits like `<blank space>` being represented by `%20` in the example above.

The [Axios](https://www.npmjs.com/package/axios) package has a URL encoder feature built in as shown below:

```javascript
import { axios } from "axios";

axios.get("https://example.com/api/user", {
  params: { full_name: "Oliver Smith" },
}); // Automatically translates to "https://example.com/api/user?full_name=Oliver%20Smith"
```