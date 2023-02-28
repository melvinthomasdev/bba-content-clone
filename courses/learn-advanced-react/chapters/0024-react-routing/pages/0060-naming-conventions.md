All routes should be named appropriately to convey the purpose of the component
it renders.

Following Rails conventions for RESTful route names on the client side is a good
practice we follow here at BigBinary. Take an example of a page that displays or
modifies tasks. Appropriate route names would be:

- `/tasks` for a page that displays all tasks
- `tasks/new` for a page that contains a task creation form
- `tasks/:id` for a page that displays a single task
- `tasks/:id/edit` for a page that contains a task editing form

Also, ensure that you do mention the resource when declaring routes that use
said resource. `tasks/new` conveys a lot more information over `/new`

You should also ensure that the frontend and backend routes for a resource do
not mismatch. For example, if the API endpoint to fetch a `task` is `tasks/:id`,
then the route for displaying a page containing that task information should be
`tasks/:id/show` rather than `task/:id/show`.

## Naming dynamic route builders

As the project grows, the number and lengths of routes increase. Dynamic route
builders help us keep the code DRY and save us the effort of building them
manually. Here's an example of a dynamic route builder that can create form
pages for all the project IDs that exist:

```jsx
const buildProjectDetailsFormRoute = projectId =>
  `/projects/${projectId}/details/form`;
```

Some conventions that we recommend following to keep these functions intuitive
and modular:

- The function name should start with the `build` keyword and end with the
  `Route`.
- The function name should resemble the route it's building.
- These functions should be kept within the global scope with all the routes of
  the application.
