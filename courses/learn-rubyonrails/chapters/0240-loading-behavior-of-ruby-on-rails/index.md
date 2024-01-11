## Why Rails does not have any import statements?

In the previous chapter, we had the following code in the controller:

```ruby
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

You might be expecting that you need to explicitly import
`ApplicationController` and `Task`. However, in Rails you don't have to do that.

If you are using just Ruby and not Rails then you need to use `require` to load
all the necessary files.

When it comes to loading files then Ruby is like any other programming language.
However Rails is not like other frameworks. It does most of the importing for
us.

## Rails has a strong opinion

To better understand why in Rails you don't have to use `require`, let's look at
why we need to do explicit imports in other frameworks.

Other frameworks offer a lot of freedom in terms of what the names of the folder
can be. You can name the folders to be `src`, `source`, `code` or anything else.

It's not like that in Rails. Rails has an opinion on this matter. Rails says
that having different names in different projects make it harder to switch
between projects. Secondly these names do not really matter so why don't we
standardize it. That's why when you do `rails new` you get folders like `app`,
`bin`, `db`, `config` etc.

Rails has further opinion on what the folder names should be within the `app`
folder. The convention states that the controllers should be in the folder
`controllers` and the models should be in folder `models` etc.

The advantage of this approach is that, no matter which Rails project you are
working on there is consistency in the structure. In other programming languages
and frameworks developers use what is being imported to find out what all files
are being used and where to go to look for those files. But in Rails that
cognitive load is very less.

## Conventions can help reduce complexity

If Rails were not loading the right files automatically then we would need to
load the necessary files manually and the code might look like this:

```ruby
# DO NOT DO THIS.
require "application_controller"
require "task"
# DO NOT DO THIS.

class TaskController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

But in a Rails application, we can write the above controller as follows and it
will still work:

```ruby
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

In a Rails application file names have to match the constants they define, with
directories acting as namespaces.

For example, the file `app/helpers/users_helper.rb` should define `UsersHelper`
and the file `app/controllers/admin/payments_controller.rb` should define
`Admin::PaymentsController`. The file `app/models/task.rb` must define `Task`.

Most of the other frameworks do not put this constraint. It means in the other
frameworks file `a` can have stuff related to `b`. If a program is using `b`
then there is no guaranteed place to look for. In such cases `import` statements
come in handy. If the program is importing `a` and using `b` then developers get
a hint that the developer needs to look at file `a` to see the code related to
`b`. This is not the case with Rails.

Rails uses `String#camelize` method to find out the class name for the given
file name. For example, Rails expects that file
`app/controllers/users_controller.rb` to define class `UsersController`.

```ruby
"users_controller".camelize # => UsersController
```

Another example of Rails convention is when we specify the routes and Rails
automatically maps to the corresponding controller. Consider the following route
from this application:

```ruby
resources :tasks
```

As per Rails conventions it expects two things:

- A file named `tasks_controller.rb` to be available at `app/controllers`.
- This file should have class `TasksController`.

In the above example the convention that Rails follows is that, it takes the
route `tasks` and suffixes with a `_controller.rb` and checks for such a
controller file.

If we update the routes name to `:tasks2` then Rails will not be able to find
the corresponding controller and we will see an exception.

```ruby
resources :tasks2
```

The reason for failure is that the route expects a `tasks2_controller.rb` file,
but we haven't created that.

Rails conventions are here to help us. It does not mean that we are constrained
by it. Rails does provide an option to override the convention. For example we
can fix the previous example like this:

```ruby
resources :tasks2, controller: "tasks"
```

If we have a good reason to break away from the convention then by all means we
should break away. Sometimes projects migrate from one language to another.
Let's assume that there is a legacy project which used Java and they were
working with a table named `task_apac`. If they migrate the project from Java to
Ruby on Rails then Rails expects table name to be `tasks`. However the table
name is `task_apac`. This is a good legitimate case where we need to break away
from the convention and that can be done like this.

```ruby
class Task < ApplicationRecord
  self.table_name = "task_apac"
end
```

## Autoload paths

As we mentioned earlier Ruby still needs to know the exact file name with
location to load those files. When we mention `Task.all` then Rails determines
that it needs to look for a file named `task.rb`. Now the question is where to
look for this file.

Rails adds all the subdirectories under `app` folder to memory in
`autoload_paths`. When the time comes to look for a file then Rails starts
looking for the file in `autoload_paths`.

By default, the autoload paths of an application consist of all the
subdirectories under `app` directory plus the autoload paths of engines it might
depend on. Some directories like `assets`, `javascript` etc, are excluded by
default.

If we create any directory under `app` then those directories are also added to
`autoload_paths`. If we create a folder `app/services` and a file named
`payments_service` within it, then if we use `PaymentsService` then Rails will
picks up the right file without us doing anything extra.

## References

We will be covering in-depth about this loading behaviour of Rails later in this
book.

We have kept it towards the end of the book, given that it covers a bit more
complex stuff, that is not directly involved in your `granite` application.

But if you are curious and feel that you can't move forward without learning
more, then please use the following references:

- [Loading behavior of Ruby on Rails in depth](/learn-rubyonrails/loading-behavior-of-ruby-on-rails-in-depth).
- [Autoloading and Reloading Constants](https://guides.rubyonrails.org/autoloading_and_reloading_constants.html).

There is **nothing to commit** in this chapter. This chapter was only aimed at
making you understand how loading works in Rails.
