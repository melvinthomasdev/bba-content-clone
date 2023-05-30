While writing Rails code we prefer convention over configuration and we follow
the conventions adopted by Rails. Because of this we are not required to write a
lot of configuration code.

The idea is that if you configure your applications in the same way most of the
time then this can be treated as the default way of setting up a Rails
application.

Rails has adopted a default way of doing things and laid down some conventions
that should be followed while working with Rails. Naming conventions being one
of the few conventions.

In this chapter we will be summarizing Rails naming conventions which we have
used in our Granite application.

## General naming conventions in Ruby

- Class names and module names use `PascalCase`. For example,
  `ApplicationController`.

- Method and variable names use `snake_case`. For example, `attr_accessor`.

Naming conventions in a Rails application are more or less based on the general
naming conventions in Ruby language.

We will take a look at the naming conventions used in models, views and
controllers of a Rails application as Rails is based on an MVC pattern and these
three components serve as the core of any Rails application.

## Naming conventions in Active Record model

Active Record uses some naming conventions to map models with database tables.
Rails pluralizes the class names to find the respective database tables. For
example, in our Granite application, for `User` class, we have the `users`
table.

Rails is capable of pluralizing (and singularizing) both regular and irregular
words. Model class names must use the `PascalCase` form when composed of two or
more words, while the database table names must use the `snake_case` form.

For example, the `UserNotification` model class has the first letter of each
word capitalized and its corresponding table name, `user_notifications` is
plural with underscores separating the two words.

You can also override the naming convention using the
`ActiveRecord::Base.table_name=` method to specify the table name that should be
used instead of the table name Rails expects due to the naming conventions.

Since `ApplicationRecord` inherits from `ActiveRecord::Base` class,
`table_name=` method is available to all models which inherit from
`ApplicationRecord`.

For example, for the `UserNotification` class, we could have set the table name
to `notifications`, like so:

```ruby
class UserNotification < ApplicationRecord
  self.table_name = "notifications"
end
```

## Naming model associations

Let's also understand how to name associations inside a model.

While declaring an association using methods like `belongs_to` and `has_one`,
the association name must match with the singular form of associated model name
because the aforementioned methods create an association between each instance
of the declaring model with a single instance of the other model.

For example:

```ruby
class Task < ApplicationRecord
  belongs_to :user
end
```

Had we used the pluralized form of `user` model in the above example and tried
to create the instance using `Task.create(users: @user)`, Rails would have
thrown an exception for uninitialized constant `Task::Users`.

This is because Rails automatically infers the class name from the association
name. If the association name is wrongly pluralized, then the inferred class
will be wrongly pluralized too. In this case the inferred class is `User`.

For declaring an association between one instance of the declaring model and
multiple instances of the other model, the association name must match with the
plural form of the other model's name. For example:

```ruby
class User < ApplicationRecord
  has_many :tasks
end
```

## Naming conventions for databases

As we discussed in the previous section, table names in a database should be
`plural` and use the `snake_case` form. Same goes for the column names.

Foreign keys should be named following the pattern `singularized_table_name_id`.
These are the fields that Active Record will look for when you create
associations between your models.

For example, inside the `tasks` table we had created a foreign key by the name
of `user_id` because `Task` model shares a `belongs_to` association with the
`User` model.

## Naming conventions for Controllers

Since a Controller is a Ruby class, it follows the general convention of naming
a Ruby class. It uses `PascalCase` and has the `Controller` keyword as a suffix.

There are two key details to note here:

- The name of the controller is usually plural. For example, notice how tasks is
  plural in `TasksController`.

- The `Controller` keyword suffix is always singular. Meaning we don't use
  `Controllers` as suffix.

Controller actions are methods and use `snake_case`. Their names usually match
the route names defined in the routes config file.

In case of RESTful routes, controller actions are usually named after the
standard CRUD operations performed by RESTful routes namely index, show, new,
create, edit, update and delete. For example:

```ruby
resources :users, only: %i[create index]
```

All requests for creating a user on the `users` route will instantiate the
`UsersController` model and call it's `create` action.

## Naming conventions for routes

Route names use the `snake_case` form, and usually match the corresponding
controller's name without the controller suffix.

Route names can be singular or plural depending upon the resource type. In Rails
we have both singular as well as plural resources. We have already discussed the
difference between them in one of the [early
chapters](/learn-rubyonrails/restful-routes-in-ruby-on-rails#difference-between-singular
resource-and resources-in-rails-routes) in the book.

However, both singular as well as plural resources map to a plural controller by
default. For example:

```ruby
resources :users
resource :comment
```

In the above example, requests on `users` and `comment` route will be routed to
`UsersController` and `CommentsController` respectively. Note that even though
`comment` is a singular resource, it is mapped to the `CommentsController` where
comments is plural.

## Naming conventions for Views

All of our view files need to reside in the appropriate view folders, which we
must first create and name properly.

In our application, we have a view folder for each of the controllers. We use
the following naming convention for our view folders.

The name of the folder within `app/views` should be the same as the associated
controller name. And also folder names should be `snake_case`.

View files should match the corresponding action names and use `snake_case`
followed by the appropriate response type and file extension in this particular
order separated by a dot(.).

This is the format of the view file with the associated controllers view folder:

```ruby
app/views/controller_name/action_name.response_type.file_extension
```

For example, in our Granite application we have stored all view files related to
the `TasksController` inside `app/views/tasks` directory.

And view file corresponding to the `show` action of `TasksController` is
`app/views/tasks/show.json.jbuilder` where `show` is the action name and
`json.jbuilder` are response type and file extension respectively.

## Naming conventions in services, workers and carriers

All services, workers and carriers should reside within `app/services`,
`app/workers` and `app/carriers` directories respectively. Their file names
should use `snake_case` and should be suffixed with `_service`, `_worker` and
`_carrier` to clearly define their responsibilities.

Since services, workers and carriers are all classes, they should follow the
general naming conventions of naming a class in Ruby i.e. their names should use
`PascalCase` and match with their `camelized` file names.

For example, in the Granite application, `TodoNotificationWorker` class is
present inside `app/workers/todo_notification_worker.rb`.

## Naming conventions and folder structure for tests

In Rails, the tests that you write along with fixtures and other test-related
files such as factories and test_helper, all goes inside the `tests` folder.

It is suggested that the `tests` directory structure should mirror the `app`
directory's structure. This makes it easy to locate corresponding code and its
test files.

Another important point to note is that the name of a test file should contain
`_test` suffixed to the name of the corresponding file which is being tested.

For example, if `TasksController` in the Granite application was present inside
the `app/controllers/api/v1/tasks_controller.rb`, then its corresponding test
file should have been present inside
`tests/controllers/api/v1/tasks_controller_test.rb`, which in turn mirrors the
folder structure of the app directory.

`tests` folder also contains a subfolder for `factories`. Factory names and
model names should have a one to one correspondence. For example, in Granite,
task model and task factory are both named `Task.rb`

Let's also talk about naming test cases in Rails. Test cases are Ruby methods in
a unit test class hence they should use `snake_case`.

Like all method names in Rails, test cases should have a descriptive and
meaningful name for better readability. A good rule of thumb is to mention what
is being tested and the constraints under which the test is being performed.

Let's look at this with the help of an example. Consider the
`test_not_found_error_rendered_for_invalid_task_slug` test case in
`TasksControllerTest`. It is pretty clear from the name itself that we are
testing if a `not_found` error will be thrown if an invalid task slug is given.
In this case, response is the entity that is being tested and invalid task slug
is the constraint.

A test case name should always start with `test_` for it to be executed while
running the tests as discussed before in the
[Testing User model chapter](/learn-rubyonrails/testing-user-model#adding-tests-for-user-model)

**There is nothing to commit in this chapter as it's an in-depth chapter that
doesn't have anything to do with our granite application.**
