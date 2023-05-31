Now let's try to display list of tasks from the database.

Open `app/controllers/tasks_controller` and let's change the `index` action:

```ruby {3}
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

Open `app/views/tasks/index.html.erb` file and let's pass `@tasks`:

```ruby
<% @tasks.each do |task| %>
  <p>
    <%= task.id %>
    <%= task.title %>
  </p>
<% end %>
```

Now visit http://localhost:3000/tasks and we will see a list of tasks.

**Note:** You may have noticed we haven't added any import statements in
`TaskController` and still we have access to the `Task` model. This is because
we do not need to explicitly import modules in Rails due to to the concept of
`autoloading` implemented in Rails. If you're curious to know more about the
autoloading feature, then you can go through the
[Loading behaviour of Ruby on Rails in depth](https://www.bigbinary.com/learn-rubyonrails-book/loading-behavior-of-ruby-on-rails-in-depth)
chapter which addresses this topic in detail and then come back to where you
left.

## Instance variables in view files

In the controller we set `@tasks` which is used in the view file. A variable set
in Rails controller starting with `@` sign are called **instance variables**.

The specialty of instance variables is that they're available in our Rails
views. We don't need to pass them explicitly to our Rails views.

That's why in the `index.html.erb` we are able to refer to `@tasks`.

Any instance variable created in a controller is available in the view file.

If the variable in the controller is not an instance variable (all variables
without @ sign are not instance variables) then those variable will not be
available in the views.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added instance variables in Tasks controller"
```
