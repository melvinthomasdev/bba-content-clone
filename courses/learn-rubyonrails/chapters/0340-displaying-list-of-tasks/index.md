In this chapter we will send the list of tasks in JSON format from the backend
so that the frontend could display all those tasks.

## Features

These are the basic requirements of this feature:

- A dashboard which is also the home page of our application.

- An unordered list of all tasks which will be displayed on the application home
  page.

<image alt="displaying list of tasks feature">
  displaying-list-of-tasks.png
</image>

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

const fetch = () => axios.get("/tasks");

const tasksApi = { fetch };

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

import tasksApi from "apis/tasks";
import { PageLoader, PageTitle, Container } from "components/commons";
import Table from "components/Tasks/Table";

const Dashboard = () => {
  const [tasks, setTasks] = useState([]);
  const [loading, setLoading] = useState(true);

  const fetchTasks = async () => {
    try {
      const {
        data: { tasks },
      } = await tasksApi.fetch();
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
      <div className="h-screen w-screen">
        <PageLoader />
      </div>
    );
  }

  if (either(isNil, isEmpty)(tasks)) {
    return (
      <Container>
        <h1 className="my-5 text-center text-xl leading-5">
          You have not created or been assigned any tasks 🥳
        </h1>
      </Container>
    );
  }

  return (
    <Container>
      <div className="flex flex-col gap-y-8">
        <PageTitle title="Todo list" />
        <Table data={tasks} />
      </div>
    </Container>
  );
};

export default Dashboard;
```

Now, we have created a `Dashboard` which will call the `fetchTasks` API and
store the list of tasks fetched from the database in its state. It will pass
down the lists of tasks to the `Table` component which will render a list of all
tasks from our database.

Finally, let's create a React route to render our `Dashboard` component.

To do so, add the following lines to `App.jsx`:

```jsx
// previous imports
import Dashboard from "components/Dashboard";

const App = () => {
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

Next let's update our `NavBar` component so that on clicking the `Todos`
navitem, we get redirected to `/dashboard`:

```javascript{6}
// imports as it was
const NavBar = () => {
  return (
    // previous jsx as it was
      <Link
        to="/dashboard"
        className={classnames("text-sm font-medium text-gray-800", {
          "text-indigo-600": location.pathname === "/dashboard",
        })}
      >
        Todos
      </Link>
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
