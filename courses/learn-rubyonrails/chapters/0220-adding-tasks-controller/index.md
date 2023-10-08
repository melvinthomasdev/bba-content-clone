## Controller and actions

Rails `Controllers` are Ruby classes, that store a series of actions. Let's
generate a controller to carry out tasks related operations:

```bash
$ bundle exec rails generate controller Tasks
Running via Spring preloader in process 28301
      create  app/controllers/tasks_controller.rb
      invoke  erb
      create    app/views/tasks
      invoke  test_unit
      create    test/controllers/tasks_controller_test.rb
      invoke  helper
      create    app/helpers/tasks_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    coffee
      create      app/assets/javascripts/tasks.coffee
      invoke    scss
      create      app/assets/stylesheets/tasks.scss
```

Notice that the above command created multiple files. Let's open the controller
file `app/controllers/tasks_controller.rb` and add action `index` to
`TasksController`:

```ruby {2,3,4}
class TasksController < ApplicationController
  def index
    render html: "This is index action of Tasks controller"
  end
end
```

Now go to the browser and hit
[http://localhost:3000/tasks](http://localhost:3000/tasks).

We will get a routing error:

```bash
Routing Error
No route matches [GET] "/tasks"
```

## Defining routes to map requests to controller actions

Whenever we hit URL on the browser, Rails looks up for that path in the routes
file. If a match is found, then the mapped action in the controller is invoked.

We want to route all requests with URL `/tasks` to `index` action of
`TasksController`.

Open `config/routes.rb` and add following lines:

```ruby {2}
Rails.application.routes.draw do
  resources :tasks, only: :index
end
```

Now visit [http://localhost:3000/tasks](http://localhost:3000/tasks) and this
time we should get message `This is index action of Tasks controller`.

## Adding view file

In the above case the content was rendered by the controller itself. We want
views to deliver the final html content.

So let's create file `app/views/tasks/index.html.erb`:

```bash
touch app/views/tasks/index.html.erb
```

Open `app/views/tasks/index.html.erb` file and add the following line:

```ruby
<H1>List of tasks will appear here</H1>
```

Open `app/controllers/tasks_controller.rb` then change the action `index`:

```ruby {2,3,4}
class TasksController < ApplicationController
  def index
    render
  end
end
```

Now visit [http://localhost:3000/tasks](http://localhost:3000/tasks) and this
time we should get message `List of tasks will appear here`.

## A gentle introduction to Application controller

All our controllers inherit from `ApplicationController`. This class is
contained in the file `app/controllers/application_controller.rb`, which gets
created when we execute the `rails new` command.

This is what `application_controller.rb` looks like as of now.

```ruby
class ApplicationController < ActionController::Base
end
```

As we can see `ApplicationController` in turn inherits from
`ActionController::Base`, which defines a number of helpful methods. We can take
a look at the
[API documentation](https://api.rubyonrails.org/v7.0.5/classes/ActionController.html)
to understand in detail.

Since `ApplicationController` is the base controller from which all other
controllers inherit, this controller also act as a gatekeeper. This controller
can check for authentication, authorization, logging etc. We will see all this
in action soon.

## Using Rails console to add tasks

Let's open "rails console":

```bash
$ bundle exec rails console
Running via Spring preloader in process 10511
Loading development environment (Rails 7.0.5)
irb(main):001:0>
```

Let's create a `Task` record and save it in the table:

```msg
irb(main):005:0> task = Task.new(title:"Write a blog")
=> #<Task id: nil, title: "Write a blog", created_at: nil, updated_at: nil>

irb(main):006:0> task.save
   (0.3ms)  begin transaction
  Task Create (0.7ms)  INSERT INTO "tasks" ("title", "created_at", "updated_at") VALUES (?, ?, ?)  [["title", "Write a blog"], ["created_at", "2019-01-30 07:35:50.117114"], ["updated_at", "2019-01-30 07:35:50.117114"]]
   (196.3ms)  commit transaction
```

Let's create one more task and try to save this record:

```msg
irb(main):007:0> task = Task.new(title:"Learn Ruby on Rails")
=> #<Task id: nil, title: "Learn Ruby on Rails", created_at: nil, updated_at: nil>

irb(main):008:0> task.save
   (0.1ms)  begin transaction
  Task Create (0.6ms)  INSERT INTO "tasks" ("title", "created_at", "updated_at") VALUES (?, ?, ?)  [["title", "Learn Ruby on Rails"], ["created_at", "2019-01-30 07:36:01.248102"], ["updated_at", "2019-01-30 07:36:01.248102"]]
   (181.4ms)  commit transaction
```

Calling `task.save` saves the object in the database. A row is added in `tasks`
table.

Now we can see all the tasks stored in the database using `Task.all`:

```msg
irb(main):009:0> Task.all
  Task Load (0.3ms)  SELECT  "tasks".* FROM "tasks" LIMIT ?  [["LIMIT", 11]]
=> #<ActiveRecord::Relation [#<Task id: 3, title: "This is my first task", created_at: "2019-01-30 07:35:50", updated_at: "2019-01-30 07:35:50">, #<Task id: 4, title: "This is my second task", created_at: "2019-01-30 07:36:01", updated_at: "2019-01-30 07:36:01">]>
```

We will be learning how to display all these tasks in the coming chapters.

## Displaying a list of tasks

Now that we have our tasks created, we can pass the list of tasks to our view
file to display it.

First we need to query the list of tasks in our tasks controller and make them
available for our view file like this:

```ruby{3}
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

Now we can use the instance variable `@tasks` to display our list of tasks.
Instance variables from within a controller is directly accessible in the
corresponding view files.

You may have noticed that within the `TaskController`, we haven't added any `require` statements to bring in the `Task` model. This is facilitated by a functionality provided by the Rails framework called `autoloading`, which eliminates the necessity for explicit module imports. We will explore the intricacies of this feature in the forthcoming chapter.

Replace the content of `app/views/tasks/index.html.erb` file with the following:

```ruby
<h1>ToDo</h1>
<ul>
<% @tasks.each do |task| %>
  <li><%= task.title %></li>
<% end %>
</ul>
```

Now when we visit http://localhost:3000/tasks we will see a list of the tasks
that we have created so far.

This approach works if we want Rails to respond only with a view file. But what
if we want a JSON response or an XML response instead? In that case, we can use
Rails MimeResponds, as you will see in the next section.

## Rails MimeResponds

In this section, we will be seeing the different ways of responding with data,
by either going through the views or without it.

`respond_to` is a Rails helper method and it's a way to tell Rails all the
formats the controller action knows about.

If different actions support different formats, then this method helps in
responding differently based on the request.

Let's take an example. No need to type this since we won't be committing this
code:

```ruby
class TasksController < ApplicationController
  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.json { render json: @tasks }
      format.xml { render xml: @tasks }
    end
  end
end
```

In the `respond_to` block, we are specifying what the action needs to reply with
based on the request formats like `html`, `xml` or `json`.

In case of `html` we are telling rails to go ahead with the default or implicit
route of rendering the view. Whereas for `json` and `xml` we are rendering
`@tasks` in the respective formats as response.

When the `format` responder is passed with 'json', we are telling it to respond
to requests with the `.json` extension by serializing to JSON.

We need to pass `:html` with no arguments in cases where we need to handle
`.html` requests in the default way by using conventions and views.

If the request is for `/tasks.xml` then the controller will look for a
`/tasks/index.xml.erb` view file to render.

If such a view file doesn’t exist then Rails will try to directly render the
resource in the `xml` format by invoking `to_xml`.

There is another helper method called `respond_with`. The `respond_with` and the
class-level `respond_to` methods have been moved to the `responders` gem. Let's
install the `responders` gem first.

Add this line to the Gemfile:

```ruby
gem "responders"
```

Now, install the gem:

```bash
bundle install
```

In `respond_with` method, we don't need to explicitly tell what needs to be sent
for different mime-types. This makes our work much easier and also this is the
benefit abiding to the DRY principle.

Let's take an example:

```ruby
class TasksController < ApplicationController
  respond_to :html, :xml, :json

  def index
    @tasks = Task.all
    respond_with(@tasks)
  end
end
```

Now let's commit changes:

```bash
git add -A
git commit -m "Added tasks controller and index action"
```
