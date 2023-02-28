The insertion of data within the URL of an API endpoint can generally be done in 2 different ways:

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