While handling routing or sending requests, we may need to pass dynamic data as part of the URL. There are two ways to pass dynamic data with the URL: `Path segments` and `Query params`.

### Path segments

Path segments are the parts of a URL that come after the domain name and are separated by slashes. Path segments can be static or dynamic.

For example, when retrieving product details in SmileCart, we use a URL like this: `https://smile-cart-backend-staging.neetodeployapp.net/products/:slug`. Here, `products` is the static path segment and `slug` is the dynamic path segment. The `slug` can take any string value.

<image>path-segments-example.png</image>

A URL can also have multiple path segments. For example,
`https://example.com/api/user/:id/task/:task_id`

Path segments are preferred when searching/finding a specific resource.

### Query parameters

Query parameters are key-value pairs added to the end of a URL. They are separated from the base URL by a question mark `?`, and each pair is separated by an ampersand `&` symbol.

For example, to fetch the product list we use a URL like this:

`https://smile-cart-backend-staging.neetodeployapp.net/products?search_term=mac&page=1&page_size=8`

Here, the keys are `search_term`, `page`, and `page_size`, and the values are `mac`, `1`, and `8`, respectively.

<image>query-params-example.png</image>

Query parameters are preferred when you want to sort or filter items.
