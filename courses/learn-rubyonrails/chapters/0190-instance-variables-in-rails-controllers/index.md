We previously explored how a list of tasks is presented using the following controller code:

```ruby
class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end
end
```

In the corresponding `index.html.erb` file, we employ the `@tasks` variable to iterate through each task and display its title:

```ruby
<h1>ToDo</h1>
<ul>
<% @tasks.each do |task| %>
  <li><%= task.title %></li>
<% end %>
</ul>
```

In this context, variables prefixed with `@` in Rails controllers are referred to as instance variables. These instance variables possess the unique property of being automatically available in our Rails views.

Hence, in the `index.html.erb` file, we can directly access and utilize the `@tasks` instance variable.

It's important to note that any instance variable created in a controller becomes accessible in the corresponding view file. Conversely, variables that are not defined as instance variables in the controller will not be accessible in the views.

There is **nothing to commit** in this chapter. This chapter primarily focused on elucidating the concept of instance variables in Rails, highlighting their automatic availability in views.
