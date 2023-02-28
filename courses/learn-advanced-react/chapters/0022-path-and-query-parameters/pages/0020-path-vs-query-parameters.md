How do you choose between path and query parameters?

Path parameters are used to identify a specific resource(s), while query parameters are used to sort/filter those resources.

Let's say we need to search for a user based on the `first_name` and `last_name` parameters. Using path parameters, the endpoint will look like `api/user/:first_name/:last_name`.

This has 2 path parameters side-by-side and is usually considered a bad practice. If the API has another endpoint that looks like `api/user/:id/tasks`, a `GET` request to `api/user/123456/tasks` could cause a conflict here due to ambiguity as it could potentially match with `api/user/:first_name/:last_name` or `api/user/:id/tasks`.

Thus, query parameters would be preferred in this case and the URL could be built like this: `https://example.com/api/user?first_name=Oliver&last_name=Smith`

In cases where we need to pass more than one path parameter, we can separate the parameter segments with another segment. For example, an API endpoint that needs a user and a task can be written like `https://example.com/api/user/:id/task/:task_id`.