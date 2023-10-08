Up until now we have been using the Rails console to create a task. In this
chapter we are going to learn how we can achieve the same using our
application's UI.

## Features

These are the basic requirements of this feature:

- A form component which contains a title field and a submit button.

The picture below depicts how this feature will appear after it is implemented.
Note that in the picture, create form also has a field to select the assigned
user. We will only be adding the title field for now because we haven't yet
created a user.

We will add the select field once we are through with user creation.

<image>adding-a-task-using-create-action.png</image>

## Technical design

To implement this feature, we need to introduce the following changes:

**On the backend**

- Add a `create` action in `TasksController` which will handle the POST request
  from frontend side with task params. Create action will contain the logic to
  create a task and respond with a valid JSON message.

- Add a `create` route for RESTful `tasks` resources which will route POST
  request to the create action in the `TasksController`.

**On the frontend**

- Add a POST request API in the tasks API collection for task creation.

- Add a `Form` component inside `Tasks` folder which will contain `Input` and
  `Button` components for title field and submit button respectively.

- Add a `Create` component which will contain the `Form` and logic to submit the
  form once submit button inside the `Form` is clicked.

- Create a `handleSubmit` function inside `Create` which will be called when the
  form is submitted. This function will pass the task params as API payload and
  make a POST request using the POST request API.

- Add a route in `App` component to render the `Create` component.

## Implementing create action

We will now add `create` action in the `TasksController`.

Here, we need to implement the creation of a task in a way that if the record
creation is successful a
[200 response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200)
with a relevant notice is returned, and if the record creation fails, a
[422 response code](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422)
with the error message is returned.

Open `/app/controllers/tasks_controller.rb` and modify the code as shown below:

```ruby {8-18}
class TasksController < ApplicationController

  def index
   tasks = Task.all
   render status: :ok, json: { tasks: }
  end

  def create
    task = Task.new(task_params)
    task.save!
    render status: :ok, json: { notice: 'Task was successfully created' }
  end

  private

    def task_params
      params.require(:task).permit(:title)
    end
end
```

We have used the bang version, that is the `save!` method, which will raise an
exception in case an error is encountered while saving the task record. This
could be due to a couple of reasons such as validation failure or a missing
parameter. We should handle exceptions accordingly to catch the errors and send
an appropriate response.

Inside the `create` action, we are only responding with a success response
because any errors that occur will be handled and dealt with accordingly during
the exception handling. Hence we do not need to worry about sending a response
in such case within the `create` action.

The ideal place to handle exceptions occurring inside controllers is the
`ApplicationController` class because all the controller classes in our
application will inherit from it. So the methods that rescue and handle the
exception will be available to rest of the controller classes.

While we are at it, we should also create some helper methods to help us render
a response.

Update the `application_controller.rb` file like this:

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from StandardError, with: :handle_api_exception

  def handle_api_exception(exception)
    case exception
    when -> (e) { e.message.include?("PG::") || e.message.include?("SQLite3::") }
      handle_database_level_exception(exception)

    when Pundit::NotAuthorizedError
      handle_authorization_error

    when ActionController::ParameterMissing
      render_error(exception, :internal_server_error)

    when ActiveRecord::RecordNotFound
      render_error("Couldn't find #{exception.model}", :not_found)

    when ActiveRecord::RecordNotUnique
      render_error(exception.message)

    when ActiveModel::ValidationError, ActiveRecord::RecordInvalid, ArgumentError
      error_message = exception.message.gsub("Validation failed: ", "")
      render_error(error_message, :unprocessable_entity)

    else
      handle_generic_exception(exception)
    end
  end

  def handle_database_level_exception(exception)
    handle_generic_exception(exception, :unprocessable_entity)
  end

  def handle_authorization_error
    render_error("Access denied. You are not authorized to perform this action.", :forbidden)
  end

  def handle_generic_exception(exception, status = :internal_server_error)
    log_exception(exception) unless Rails.env.test?
    error = Rails.env.production? ? t("generic_error") : exception
    render_error(error, status)
  end

  def log_exception(exception)
    Rails.logger.info exception.class.to_s
    Rails.logger.info exception.to_s
    Rails.logger.info exception.backtrace.join("\n")
  end

  def render_error(error, status = :unprocessable_entity, context = {})
    error_message = error
    is_exception = error.kind_of?(StandardError)
    if is_exception
      is_having_record = error.methods.include? "record"
      error_message = is_having_record ? message.record&.errors.full_messages.to_sentence : error.message
    end
    render status:, json: { error: error_message }.merge(context)
  end

  def render_notice(message, status = :ok, context = {})
    render status:, json: { notice: message }.merge(context)
  end

  def render_json(json = {}, status = :ok)
    render status:, json:
  end
end
```

Add the translation for `generic_error` in `en.yml` file, like this:

```yml
en:
  # rest of the translations
  generic_error: "Something went wrong. Please try again later."
```

When an exception occurs, it will be caught by the `rescue_from` and will be
handled by the `handle_api_exception` method. Then based on the exception class,
the assigned methods will be called with the exception object.

Inside the exception handling callback, we are calling the `render_error` method
with the exception object and the response status code. `render_error` method
can accept an exception object as well as an error string.

Inside this method, we are checking if the given `error` argument is an
exception or a string. Since all exception classes in Rails inherit from the
`StandardError` class, the exception object will be a kind of `StandardError`
object and `message.kind_of?(StandardError)` will return true if the `error` is
an exception.

If the message is an exception object, the active record object on which this
error occurs is derived by calling the `record` helper method on the `exception`
object like `message.record`.

Whenever such an error occurs, it can be accessed like any other attribute of
the object. For example, if the error occurred on a `task` object then it can be
accessed by calling `task.errors`.

Similarly calling `message.record&.errors` will return an error object which is
an instance of `ActiveRecord::Errors`. Thus we can make use of the public
instance methods which come as part of this class to format the errors in our
desired manner.

There is a method called `full_messages`, which will provide us the full error
messages in an array and finally the `to_sentence` method converts the array of
errors returned to a comma-separated sentence where the last element is joined
by the connector word, which by default is `and`.

Calling `errors.full_messages.to_sentence` on an active record object to get a
formatted error sentence seems very redundant as we have to chain three methods.
Let us add a helper method which will return a formatted error string message
upon getting invoked on an active record object.

Take some time to think about where we should add this helper method. Ideally we
should add this as an instance method inside a model class because each active
record object is an instance of a model class.

Should we add the helper method inside each of the models? That doesn't seem
right as it is not very DRY. We should add it as an instance method inside the
`ApplicationRecord` class because the model classes in our application inherit
from `ApplicationRecord` hence it will be available to all its child classes
through inheritance.

Update the `application_record.rb` file like this:

```ruby {5-7}
class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::TranslationHelper
  primary_abstract_class

  def errors_to_sentence
    errors.full_messages.to_sentence
  end
end
```

In the above code, we haven't mentioned the instance explicitly which will call
the `errors` method. Ruby adds an implicit `self` in such a case. So `errors`
will be called on the `self` object which will refer to the object which invokes
`errors_to_sentence` method.

Now update the `application_controller.rb` file like this:

```ruby {10}
class ApplicationController < ActionController::Base
  # previous code

  private

    # previous code
    def render_error(error, status = :unprocessable_entity, context = {})
      error_message = error
      is_exception = error.kind_of?(StandardError)
      if is_exception
        is_having_record = error.methods.include? "record"
        error_message = is_having_record ? error.record.errors_to_sentence : error.message
      end
      render status:, json: { error: error_message }.merge(context)
    end
end
```

As you can see the code looks concise and easy to read now.

Now, update the `create` action of the `TasksController` with the corresponding
api responder, like this:

```ruby
def create
  task = Task.new(task_params)
  task.save!
  render_notice("Task was successfully created")
end
```

## Value omission in Ruby Hash literals

We know that in Ruby if a value is not specified inside the hash, the key will
be assigned a default value of `nil`. However from its version 3.1, Ruby
provides the option to omit the value in a hash as long as we have a variable in
scope with the same name as the key. This will assign the value stored in the
variable to the key in the hash.

The shorthand syntax is similar to how the value omission on hash literals works
in ECMAScript6.

```rb
a = 1
b = 2
c = {a: a, b: b}
#=> {:a=>1, :b=>2}
```

```rb
a = 1
b = 2
c = {a:, b:}
#=> {:a=>1, :b=>2}
```

Here, both the above code snippets produce the same hash value for `c`.

However, care should be taken while using the short-hand syntax. If we
accidentally specify keys as strings here, it will raise a syntax error.

```rb
a = 1
b = 2
c = {"a":, "b":}
#=> This raises SyntaxError
```

You may have noticed in the previous section that some of the helper methods
utilize value omission in their `render` statements. This involves using Ruby
hash objects without any corresponding values for their keys.

## Singular vs plural naming conventions

You should be mindful of naming variables correctly. If a variable contains
multiple entities like an array of objects then it should always be plural even
if it contains a single array.

Let us understand in brief with the help of an example. Suppose we have to save
the errors encountered during an active record operation on the task object in a
variable.

We can obtain errors in a task record using the `task.errors_to_sentence` helper
method. Inside the helper method, the `to_sentence` method converts an array of
errors to a single sentence. Hence we should use a singular variable name like
`error` to store the error returned by `errors_to_sentence` method.

We should have named the variable `errors` if we weren't using the `to_sentence`
method. In that case, `full_messages` method would have returned an array of
errors and the variable name should have been plural.

Similarly variables that contain a single entity should be singular. For
example, a single task record should be stored as `task` and an array of task
records should be stored as `tasks` and not `task`.

## Adding a route for creating a new task

Now, open `config/routes.rb` and make the necessary change:

```ruby {2}
Rails.application.routes.draw do
  resources :tasks, only: %i[index create], param: :slug
end
```

If you are wondering what the `%i[]` notation is, then it's a way of creating an
array of symbols where elements are separated by space.

`[:Ruby, :Python, :PHP]` is same as `%i[Ruby Python PHP]`. As we can see the
latter version is much cleaner to look at and also it's easier to modify
elements.

Please note that `%i[]` is only for array of symbols. If it's an array of
strings, then use the `%w[]` notation. That is `["Ruby", "Python", "PHP"]` is
same as `%w[Ruby Python PHP]`.

Now we will modify the Task form to send a post request to create a new task.

### Sending a POST request to create a task

Now, we will handle the client side logic to create a new task. To do that, we
will be abstracting out the API logic and UI `Form` logic to different
components. So few naming and structuring conventions to keep in mind over here.
First, we don't need a folder for `Form` right now because there aren't multiple
modules that can be grouped under `Form` entity. Thus only a `Form.jsx` is
enough. Second, we should not prefix with the keyword `Task` again nor make the
component name something like `Tasks/TaskForm.jsx`, because it's already within
the `Tasks` namespace. The extra prefixing of `Task` is redundant. The following
looks cleaner: `Tasks/Form.jsx`. PS: In case when you import if there are
conflicts between multiple forms, then import under an alias like `TaskForm`.
That's fine.

Now let's create the form file. To do so, run the following commands:

```bash
touch app/javascript/src/components/Tasks/Form.jsx
```

In `Form.jsx`, add the following content:

```jsx
import React from "react";

import Input from "components/Input";
import Button from "components/Button";

const Form = ({ type = "create", title, setTitle, loading, handleSubmit }) => {
  return (
    <form className="max-w-lg mx-auto" onSubmit={handleSubmit}>
      <Input
        label="Title"
        placeholder="Todo Title (Max 50 Characters Allowed)"
        value={title}
        onChange={e => setTitle(e.target.value.slice(0, 50))}
      />
      <Button
        type="submit"
        buttonText={type === "create" ? "Create Task" : "Update Task"}
        loading={loading}
      />
    </form>
  );
};

export default Form;
```

Here, we are using the reusable `Input` and `Button` component that we had
created before. Also, `Form` is going to be a reusable form component that we
will be using not only while creating a task but also updating a task (which
comes in a future chapter).

We have backend validation for `title` to allow a maximum of 50 characters.
However, we have added frontend validation in the `onChange` method to ensure
that from the user's perspective things are very clear.

Now, we will be creating our `Create` component that handles the API logic to
create a task. To do so, run the following command:

```bash
touch app/javascript/src/components/Tasks/Create.jsx
```

In `Create.jsx`, add the following content:

```jsx
import React, { useState } from "react";
import Container from "components/Container";
import Form from "./Form";
import tasksApi from "apis/tasks";

const Create = ({ history }) => {
  const [title, setTitle] = useState("");
  const [loading, setLoading] = useState(false);

  const handleSubmit = async event => {
    event.preventDefault();
    setLoading(true);
    try {
      await tasksApi.create({ task: { title } });
      setLoading(false);
      history.push("/dashboard");
    } catch (error) {
      logger.error(error);
      setLoading(false);
    }
  };

  return (
    <Container>
      <Form setTitle={setTitle} loading={loading} handleSubmit={handleSubmit} />
    </Container>
  );
};

export default Create;
```

We have used `history.push` to redirect our application to dashboard if a task
is successfully created.

The `history` object is provided by the `react-router-dom` package and it is
passed as a prop into each component rendered by the `Router`.

It contains the browser session history inside a stack. It has various other
properties. One such property is the `location` property. It always contains the
last entry in the history stack which is also the current location.

The `history` object has various methods as well which can be used to manually
control the browser history. Like the `push` method we have used.

The `push` method accepts a path and pushes this path into the history stack
thus updating the current location.

You can more about the `react-router-dom` package and the functionalities it
provides, from its
[official documentation](https://reactrouter.com/web/guides/quick-start).

## Handle parent key in API connector functions

We will now add an API route to create a task using `POST` request in
`app/javascript/src/apis/tasks.js`. In `tasks.js`, add the following code:

```javascript{5,9}
import axios from "axios";

const fetch = () => axios.get("/tasks");

const create = payload => axios.post("/tasks", payload);

const tasksApi = {
  fetch,
  create,
};

export default tasksApi;
```

This function to create new task will work fine but there is one problem in this
approach. Every time we call `create`, we will have to explicitly pass in the
parent key(in this case, `task`) as we did in the above mentioned `handleSubmit`
function.

```jsx
taskApi.create({ task: { text } });
```

With multiple invocation of these API connector functions, it will be very
difficult to keep track of all these parent keys and it becomes a nightmare to
maintain them. So, to avoid this we will add the parent key to API connector
functions itself, such that the developer only will have to worry about passing
in the payload. Rest will be automatically handled by the connector itself.

So the updated code in `apis/tasks.js` will be:

```javascript{5-8}
import axios from "axios";

const fetch = () => axios.get("/tasks");

const create = payload =>
  axios.post("/tasks", {
    task: payload,
  });

const tasksApi = {
  fetch,
  create,
};

export default tasksApi;
```

So here the parent key `task` is handled in the `create` function itself. And
this simplifies the `handleSubmit` function in `Create.jsx` like this:

```javascript{5}
const handleSubmit = async event => {
  event.preventDefault();
  setLoading(true);
  try {
    await tasksApi.create({ title });
    setLoading(false);
    history.push("/dashboard");
  } catch (error) {
    logger.error(error);
    setLoading(false);
  }
};
```

Let's create a route to render the `Create` component from `Tasks` folder in
`App.jsx`.

```jsx {2-3, 10-11}
// previous imports if any
import CreateTask from "components/Tasks/Create";
import Dashboard from "components/Dashboard";

const App = () => {
  // previous code if any
  return (
    <Router>
      <Switch>
        <Route exact path="/tasks/create" component={CreateTask} />
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};
// previous code if any
```

Visit http://localhost:3000 and click the `Create` button in `NavBar` and this
time enter a new task and hit "Submit" button. We should see our new task in the
tasks list.

### Application flow for creating the task

The flow of all the operations are as following:

1. Click the link `Create` on NavBar. The react-router will then render the
   `CreateTask` form. Once the form is submitted, the data is send using axios
   `POST` request to the create action in tasks controller, where the
   `task_params` method will get the strong parameters we had passed in.

2. Controller will then try to create a new record in database using
   `Task.new(task_params)`.

3. If the task creation is successful, the controller will return a status
   [ok](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/200) with a
   notice message, and if the creation fails then an appropriate error response
   will be sent from the backend with response status
   [unprocessable_entity](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422).
4. If the task record creation is successful, then, the user will be redirected
   to `/dashboard` which is the task listing page.

## Moving response messages to i18n en.locales

Let's move the response messages to en.yml:

```yaml {2}
en:
  successfully_created: "Task was successfully created!"
  task:
    slug:
      immutable: "is immutable!"
```

Let's use that to show a response. Update the `create` action of
`TasksController` with the translation, like this:

```ruby {4}
def create
  task = Task.new(task_params)
  task.save!
  render_notice(t("successfully_created"))
end
```

Let's commit the changes:

```bash
git add -A
git commit -m "Implemented create action"
```
