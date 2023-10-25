In previous chapters we learnt how to use APIs to perform various CRUD
operations and interact with our backend. After each operation the backend
responds with a JSON of either relevant data, success message or errors. But we
still seem to be missing a big part of how Rails applications are supposed to be
built.

Rails is an MVC application framework. To give you a quick refresher MVC stands
for Model-View-Controllers. We have models and controllers in our application
but what about views? We haven't used any views in our application except for
`index` action of `HomeController`, which renders an HTML view.

Views are responsible for displaying the results of a controller action in a
user friendly manner. In our application we have delegated that job to React.

In Rails, views can do more than data presentation and user interaction. We can
also use view templates to compile a JSON response and send it to the client
side for React to use the JSON and display the data.

In the previous chapter, we added a feature to assign users to task and display
the task assignee information on show task page.

We updated the `show` action of `TasksController` to render a JSON of task
details such as the `task `object, `assigned_user`. It gets the job done but it
is not the most efficient way to respond with a JSON.

The JSON data we responded with didn't contain too many keys. But what about the
case where we have to declare relatively larger JSON response structures?

Declaring a JSON response inside controllers is not a good practice for a couple
of reasons, like the following:

- Controllers should only be responsible for producing the appropriate output
  when requests arrive. Rendering JSONs should be delegated to view templates.

- Declaring JSONs inside controllers will make the controllers grow in size. We
  should aim to keep controllers as thin as possible.

In this chapter we will see how we can use
[Jbuilder](https://github.com/rails/jbuilder) to declare JSON response
structures outside of controllers in the view templates. It is a gem that ships
with Rails and it is a great tool for declaring JSON structures.

`Jbuilder` is quite useful when it comes to generating and rendering JSON
responses for API requests in Rails. It provides a number of benefits over
declaring JSONs inline which we will see in the coming sections of this chapter.

## Features

- We will separate the job of fetching a task and responding with a JSON of task
  details, between the `show` action of `TasksController` and it's corresponding
  view template.

- Fetched task details should be passed on to the view template using instance
  variables. Instance variables declared inside a controller action are mutually
  accessible to the controller action as well as to that action's corresponding
  view template.

## Technical design

- We will query the requested `task` inside `load_task!` callback which is
  called before the `show` action.

- We will create a view template for `show` action under the `app/views/tasks`
  folder.

- We will be able to access the `task` information inside the corresponding view
  template.

- Inside the newly created Jbuilder view template for `show` action, we will
  declare our JSON response structure derived from `task` and subsequently
  create an HTTP response with the JSON.

- We will add a default response format for RESTful routes since we require them
  to respond in JSON format.

- We will update the `Edit` and `Show` components in frontend to support the
  updated task JSON received as response from the show task API call.

## Updating TasksController to render Jbuilder template

We have already taken care of fetching the task in `load_task!` callback which
is invoked before the `show` action. Let's update the `show` action to render
it's corresponding view template.

To do so update the `show` action in the `TasksController` with the following
line of code:

```ruby {5}
class TasksController < ApplicationController
  # previous code

  def show
    render
  end

  private

    # previous code
end
```

Inside the `show` action we have called the `render` method to render its
associated view template. We can also skip the call to `render`.

Rails being a developer friendly and productivity oriented framework takes care
of this. Even if we skip the call to `render`, Rails still renders the
associated view template.

You should only skip explicitly invoking the `render` method, as long as you're
sure that a view file exists for the corresponding action. Else Rails will raise
a template error.

We don't need to pass the `:ok` status as well because we will delegate the task
of declaring and responding with JSON data to `Jbuilder` template and by default
`Jbuilder` always sends an `:ok` status with the response unless specified
otherwise.

## Adding Jbuilder template for show action of TasksController

Before we move on to creating a `Jbuilder` template for the show action, it is
important to understand how to name a `Jbuilder` template file. It is very
similar to the naming convention for views in Rails.

The view template will share its name with the associated controller action
followed by the `.json.jbuilder` file extension. For example, the `show`
controller action of the `tasks_controller.rb` will use the `show.json.jbuilder`
view file in the `app/views/tasks` directory.

Let's create the `Jbuilder` template using the following command:

```bash
touch ./app/views/tasks/show.json.jbuilder
```

Add the following lines of code to `/app/views/tasks/show.json.jbuilder`

```ruby
json.task do
  json.id @task.id
  json.slug @task.slug
  json.title @task.title

  json.assigned_user do
    json.id @task.assigned_user.id
    json.name @task.assigned_user.name
  end
end
```

As we discussed while introducing `Jbuilder`, all instance variables in scope of
the corresponding controller action can be accessed in the view template. Hence
we can access the `@task` object.

Note that, to declare a nested JSON, we can wrap the nested JSON keys inside the
nesting key with the help of a `do...end` block. In the above code, all the task
details are nested inside the `task` key. Similarly for `assigned_user` also, we
can use a block to declare a nested JSON object with assigned user details.

If you'd like to learn more about the `do..end` block in Ruby, then please go
through the
[Ruby block lesson](https://courses.bigbinaryacademy.com/learn-ruby/blocks-procs-lambda/ruby-blocks/)
in BigBinary Academy.

All `.jbuilder` view files end up outputting a JSON response. The
`show.json.jbuilder` view file will return a JSON structure similar to the one
depicted below:

```javascript
task: {
  id: "h4nid45udi131h44uh41",
  slug: "pay-bills",
  title: "Pay bills"
  assigned_user: {
    id: "buw48wrbdbao48292bur",
    name: "Eve Smith"
  }
}
```

In the above JSON structure, only `id`, `slug` and `title` attributes of the
task record are included since we had extracted only these particular
attributes.

Also, notice that the `assigned_user` object is nested inside the `task` object.

Nesting `assigned_user` inside the `task` object has made this JSON structure
much more easier to comprehend and manipulate. The `assigned_user` refers to the
user who is assigned to the specific task we are dealing with.

Whereas, a separate JSON for `assigned_user` would have been a bit confusing to
someone who doesn't know about the application. They would find it difficult to
figure out what `assigned_user` is supposed to be.

The above JSON structure example shows how `Jbuilder` allows us to declare
meaningful JSON structures with ease.

By now you should be getting a picture of how `Jbuilder` works. You can read
more about `Jbuilder` and it's features from the
[official Jbuilder page](https://github.com/rails/jbuilder).

## Using extract! method

In the above snippet while we have achieved what we wanted, but the code is
repetitive and goes against the DRY principle. Fortunately `Jbuilder` provides
us the helper method `extract!` that helps us solve this problem.

Let's take another look at our previous snippet:

```ruby
json.task do
  json.id @task.id
  json.slug @task.slug
  json.title @task.title

  json.assigned_user do
    json.id @task.assigned_user.id
    json.name @task.assigned_user.name
  end
end
```

Since we can see that the desired keys for our JSON response are identical to
the attribute names of our `@task` model instance, we can use the `extract!`
method which extracts the mentioned attributes or hash elements from the passed
object and turns them into keys of the JSON.

We can write the above snippet like this using the extract method:

```ruby {2-5,8-10}
json.task do
  json.extract! @task,
    :id,
    :slug,
    :title

  json.assigned_user do
    json.extract! @task.assigned_user,
      :id,
      :name
  end
end
```

This will return the exact response as before:

```javascript
task: {
  id: "h4nid45udi131h44uh41",
  slug: "pay-bills",
  title: "Pay bills"
  assigned_user: {
    id: "buw48wrbdbao48292bur",
    name: "Eve Smith"
  }
}
```

## Updating default response format

The default response format in Rails is `text/html` whereas we want our
application to respond in a JSON format.

Before adding the `Jbuilder` for `show` action, we had been rendering a JSON
response from the controller action itself. We were explicitly telling Rails to
respond in JSON format when we passed an argument named `json` to the `render`
method of each action.

However, after adding the `Jbuilder` template, we have removed the `render` call
and because we haven't mentioned a response format, Rails will fallback to the
default response format and look for `text/html` data to respond with.

This will cause Rails to throw an exception for missing template because we have
a template that responds with JSON data and Rails, because of it's default
response format will require `text/html` data to respond with.

We can fix this by adding a default response format in our routes config file.

Make the following change in `config/routes.rb`:

```ruby {2}
Rails.application.routes.draw do
  resources :tasks, except: %i[new edit], param: :slug, defaults: { format: 'json' }
  resources :users, only: :index

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

We have specified the default response format for all requests on `tasks`
resources.

But the above-mentioned format is not a scalable way to do that particular job.
This is where the `defaults` block comes in handy.

The `defaults` block can be used to define the defaults, like say format of the
response, etc, for multiple routes.

Since we are using Rails to build API endpoints which must respond in JSON
format, let's go ahead and add a default `json` response format for all the
RESTful routes in our application.

Usually we use the `api/v1` namespace to denote these API routes. But for
simplicities sake we are setting the defaults without namespace.

Update `config/routes.rb` with the following lines of code:

```ruby {2,5}
Rails.application.routes.draw do
  defaults format: :json do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: :index
  end

  root "home#index"
  get "*path", to: "home#index", via: :all
end
```

Note that we haven't added a default response format for `root` path because
`index` action of the `HomeController` responds with an HTML view.

## Adding lambda route constraints

While the `defaults` block works, there is still an issue. If we visit the
`/tasks` resource, like `localhost:3000/tasks`, in the browser we will be seeing
a JSON response on the screen even when the request format is not JSON. This
could cause problems with our app. For example, if we have a route
`/tasks/create` and if a user visits the route or refreshes the page from that
URL, then the browser will show a JSON response instead, where we are expecting
the browser to show the task creation form.

This is because the `format` is a constraint that is optional by default. What
this means is that the routes under `defaults format: :json` will match `GET`
requests as well because the format is optional by default.

For example, a `GET /tasks` request without the format as JSON, will match with
`tasks#index` block, instead of redirecting to `home#index` as we would expect.

One way to solve this issue is to use a lambda to explicitly match to JSON
requests. To implement that we need to update `config/routes.rb` like this:

```ruby {2-8}
Rails.application.routes.draw do
  constraints(lambda { |req| req.format == :json }) do
    resources :tasks, except: %i[new edit], param: :slug
    resources :users, only: :index
  end

  root "home#index"
  get "*path", to: "home#index", via: :all
end
```

Using `lambda {|req| req.format==:json}` as the constraint will make sure that
only JSON requests will match with the resources listed in the block.

You can learn more about constraints from Ruby on Rails guide on
[Rails Routing from the Outside In](https://guides.rubyonrails.org/routing.html).

Since we have made sure that only JSON requests get matched to our resources, we
need to make sure to explicitly set `Accept` and `Content-Type` to
`application/json` in our request headers.

You might remember doing so in `setAuthHeaders` method of our `axios.js` file in
the
[Setting up React environment](/learn-rubyonrails/setting-up-react-environment)
chapter of this book.

The content of our `setAuthHeaders` method is as follows:

```javascript{4-5}
// Remaining code
export const setAuthHeaders = () => {
  axios.defaults.headers = {
    Accept: "application/json",
    "Content-Type": "application/json",
    "X-CSRF-TOKEN": document
      .querySelector('[name="csrf-token"]')
      .getAttribute("content"),
  };
  const token = localStorage.getItem("authToken");
  const email = localStorage.getItem("authEmail");
  if (token && email) {
    axios.defaults.headers["X-Auth-Email"] = email;
    axios.defaults.headers["X-Auth-Token"] = token;
  }
  setLoading(false);
};
// Remaining code
```

This is done to make sure only JSON requests get matched with resources and all
HTML requests get redirected to `home#index`.

## Updating Edit and Show components

To support the updated JSON response from show task API call, update the
Edit.jsx with the following lines of code:

```jsx {47-55 }
import React, { useState, useEffect } from "react";

import tasksApi from "apis/tasks";
import usersApi from "apis/users";
import Container from "components/Container";
import PageLoader from "components/PageLoader";
import { useParams } from "react-router-dom";

import Form from "./Form";

const Edit = ({ history }) => {
  const [title, setTitle] = useState("");
  const [userId, setUserId] = useState("");
  const [assignedUser, setAssignedUser] = useState("");
  const [users, setUsers] = useState([]);
  const [loading, setLoading] = useState(false);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();

  const handleSubmit = async event => {
    event.preventDefault();
    try {
      await tasksApi.update({
        slug,
        payload: { title, assigned_user_id: userId },
      });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      setLoading(false);
      logger.error(error);
    }
  };

  const fetchUserDetails = async () => {
    try {
      const {
        data: { users },
      } = await usersApi.fetch();
      setUsers(users);
    } catch (error) {
      logger.error(error);
    }
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: {
          task: { title, assigned_user },
        },
      } = await tasksApi.show(slug);
      setTitle(title);
      setAssignedUser(assigned_user);
      setUserId(assigned_user.id);
    } catch (error) {
      logger.error(error);
    }
  };

  const loadData = async () => {
    await Promise.all([fetchTaskDetails(), fetchUserDetails()]);
    setPageLoading(false);
  };

  useEffect(() => {
    loadData();
  }, []);

  if (pageLoading) {
    return (
      <div className="w-screen h-screen">
        <PageLoader />
      </div>
    );
  }

  return (
    <Container>
      <Form
        type="update"
        title={title}
        users={users}
        assignedUser={assignedUser}
        setTitle={setTitle}
        setUserId={setUserId}
        loading={loading}
        handleSubmit={handleSubmit}
      />
    </Container>
  );
};

export default Edit;
```

Now, fully replace the `Show.jsx` with the following lines of code:

```jsx
import React, { useState, useEffect } from "react";
import { useParams, useHistory } from "react-router-dom";

import Container from "components/Container";
import PageLoader from "components/PageLoader";
import tasksApi from "apis/tasks";

const Show = () => {
  const [task, setTask] = useState([]);
  const [pageLoading, setPageLoading] = useState(true);
  const { slug } = useParams();

  let history = useHistory();

  const updateTask = () => {
    history.push(`/tasks/${task.slug}/edit`);
  };

  const fetchTaskDetails = async () => {
    try {
      const {
        data: { task },
      } = await tasksApi.show(slug);
      setTask(task);
    } catch (error) {
      logger.error(error);
    } finally {
      setPageLoading(false);
    }
  };

  useEffect(() => {
    fetchTaskDetails();
  }, []);

  if (pageLoading) {
    return <PageLoader />;
  }

  return (
    <Container>
      <h1 className="pb-3 pl-3 mt-3 mb-3 text-lg leading-5 text-gray-800 border-b border-gray-500">
        <span className="text-gray-600">Task Title : </span> {task?.title}
      </h1>
      <div className="bg-bb-env px-2 mt-2 mb-4 rounded">
        <i
          className="text-2xl text-center transition cursor-pointer duration-300ease-in-out ri-edit-line hover:text-bb-yellow"
          onClick={updateTask}
        ></i>
      </div>
      <h2 className="pb-3 pl-3 mt-3 mb-3 text-lg leading-5 text-gray-800 border-b border-gray-500">
        <span className="text-gray-600">Assigned To : </span>
        {task?.assigned_user.name}
      </h2>
    </Container>
  );
};

export default Show;
```

Now, let's commit the changes:

```bash
git add -A
git commit -m "Added Jbuilder template for show action in TasksController"
```
