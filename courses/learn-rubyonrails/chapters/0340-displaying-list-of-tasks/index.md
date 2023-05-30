In this chapter we will send the list of tasks in JSON format from the backend
so that the frontend could display all those tasks.

## Features

These are the basic requirements of this feature:

- A dashboard which is also the home page of our application.

- An unordered list of all tasks which will be displayed on the application home
  page.

<image>displaying-list-of-tasks.png</image>

## Technical design

To implement this feature we need to introduce the following changes:

**On the backend**

- Add an index action in the `TasksController` which will respond with a JSON of
  all tasks.

**On the frontend**

- Add an API for fetching the list of tasks from the backend.

- `Dashboard` component will call the API to fetch the tasks list and pass this
  list as a prop to the reusable `Table` component which we had already created.

- Add a route in the `App` component to render the `Dashboard`.

## Preparing to display list of tasks

First, let's create a file that contains the `APIs` for listing tasks. To do so,
run the following command:

```bash
touch app/javascript/src/apis/tasks.js
```

In `tasks.js`, paste the following content.

```js
import axios from "axios";

const list = () => axios.get("/tasks");

const tasksApi = { list };

export default tasksApi;
```

## Displaying list of tasks

Now let's try to display list of tasks from the database. We will create a
`Dashboard` component which will render the `Table` component. To do so, run the
following command:

```bash
mkdir -p app/javascript/src/components/Dashboard/
touch app/javascript/src/components/Dashboard/index.jsx
```

Inside `index.jsx`, paste the following contents:

```jsx
import React, { useState, useEffect } from "react";
import { isNil, isEmpty, either } from "ramda";

import Container from "components/Container";
import Table from "components/Tasks/Table";
import PageLoader from "components/PageLoader";
import tasksApi from "apis/tasks";

const Dashboard = () => {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchTasks = async () => {
    try {
      const {
        data: { tasks },
      } = await tasksApi.list();
      setTasks(tasks);
      setLoading(false);
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTasks();
  }, []);

  if (loading) {
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  if (either(isNil, isEmpty)(tasks)) {
    return (
      <Container>
        <h1 className="text-xl leading-5 text-center">
          You have no tasks assigned 😔
        </h1>
      </Container>
    );
  }

  return (
    <Container>
      <Table data={tasks} />
    </Container>
  );
};

export default Dashboard;
```

Now, we have created a `Dashboard` which will call the `fetchTasks` API and
store the list of tasks fetched from the database in its state. It will pass
down the lists of tasks to the `Table` component which will render a list of all
tasks from our database.

Finally, let's create a React route to render our `Dashboard` component. Inside
our `App` component we will also import and add the reusable `PageLoader`
component to be displayed in place of the hardcoded text when `loading` state is
true.

To do so, add the following lines to `App.jsx`:

```jsx
// previous imports
import Dashboard from "components/Dashboard";
import PageLoader from "components/PageLoader";

const App = () => {
  // previous code without any changes

  if (loading) {
    return (
      <div className="h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Router>
      <Switch>
        // <--- rest of the code if any ----->
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;
```

## Importance of a PageLoader in the App Component

React mounts child components before parent components. In such a case child
components like `Dashboard` might try to invoke their `useEffect` hook upon
mounting which will in turn call the `fetchTasks` function in this case.

For fetching tasks we'd have to invoke the Axios APIs. The issue here is that in
our backend we verify each API request and ensure that it has a valid auth token
and email. These tokens are set in the headers of the request.

For those headers to be set correctly for all Axios requests, we invoke the
`setAuthHeaders` function in the `App` component itself since it's the entry
point to all other components. Thus we have to ensure that all child components
are mounted only once Axios headers are successfully set.

To ensure that, we pass the `setLoading` function as an argument to
`setAuthHeaders`. Initially, the `loading` state is set to `true` in the `App`
component. Only once the `setAuthHeaders` function's execution is completed and
auth headers are set for API requests, we set the `loading` state to `false`.

Ultimately in the `App` component we have to show a `PageLoader` component when
the `loading` state is `true`. That's exactly what we did in the previous
section.

Next let's update our `NavBar` component so that on clicking the `Todos`
navitem, we get redirected to `/dashboard`.

Update the `NavItem` with `name="Todos"` in
`app/javascript/src/components/NavBar/index.jsx`, to the following content:

```js {5}
// imports as it was
const NavBar = () => {
  return (
    // previous jsx as it was
        <NavItem name="Todos" path="/dashboard" />
        <NavItem
          name="Add"
          iconClass="ri-add-fill"
          path="/tasks/create"
        />
    // previous jsx as it was
  )
}
// previous code as it was
```

Update the `index` action of `TasksController`, to send JSON response with the
tasks:

```ruby
def index
  tasks = Task.all
  render status: :ok, json: { tasks: }
end
```

Now visit URL [http://localhost:3000/dashboard](http://localhost:3000/dashboard)
so that you can see all the tasks in the browser.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added ability to display list of tasks"
```
