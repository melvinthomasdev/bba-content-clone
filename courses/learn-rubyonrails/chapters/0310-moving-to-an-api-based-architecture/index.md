As of now the Rails view is building the list of "Tasks" and the server is
responding with the HTML.

Now we will switch to the `API` style where the server will primarily send data
as JSON API and the client will build the HTML. This is different from the "pure
API" style that we discussed in the last chapter. Here the frontend code and the
backend code are in the same repository.

## Deleting Rails views

As we will be sending JSON responses from controllers we don't need this
`tasks/index.html.erb` file. We can remove this file like so:

```bash
rm app/views/tasks/index.html.erb
```

## Sending JSON response from the controllers

Let's open `app/controllers/tasks_controller.rb` and let's change the `index`
action.

Since `tasks` in no longer required in its corresponding view file, we can
remove the `@` sign as it needn't be an instance variable:

```ruby {3,4}
class TasksController < ApplicationController
  def index
    tasks = Task.all
    render status: :ok, json: { tasks: }
  end
end
```

In Ruby 3.1.2, we can omit the values in hash literals and keyword arguments.

For example, `{ x: , y: }` is a syntax sugar of `{ x: x, y: y }`. Similarly
`foo( x:, y: )` is a syntax sugar of `foo( x: x, y: y )`.

So, the `json` response in the above mentioned `index` action is equivalent to
`{ tasks: tasks }`.

For more details please refer to this
[issue](https://bugs.ruby-lang.org/issues/14579) from the Ruby org.

If we open new task page by going to the URL
[http://localhost:3000/tasks](http://localhost:3000/tasks) we will be getting
the response in the JSON format.

## Configuring React for API based architecture

Let's create a new controller called `Home`:

```bash
bundle exec rails generate controller Home
```

It will generate the following files:

```bash
Running via Spring preloader in process 8810
      create  app/controllers/home_controller.rb
      invoke  erb
      create    app/views/home
      invoke  test_unit
      create    test/controllers/home_controller_test.rb
      invoke  helper
      create    app/helpers/home_helper.rb
      invoke    test_unit
      invoke  assets
      invoke    scss
      create      app/assets/stylesheets/home.scss
```

Now let's create an `index` action:

```ruby {2,3,4}
class HomeController < ApplicationController
  def index
    render
  end
end
```

We have already created our entry point `App.jsx`, in the
[chapter for setting up react environment](https://bigbinary.com/learn-rubyonrails-book/setting-up-react-environment).

`App.jsx` will act as the single entry point to the React client and
[react-router](https://reactrouter.com/) will be used for routing in the React
side.

We will be serving `App.jsx` when the `home#index` action is called.

So now, we need to create a view file for `home#index`, if it doesn't exist
already:

```bash
touch app/views/home/index.html.erb
```

Add the following line in to `app/views/home/index.html.erb`:

```ruby
<%= react_component 'App' %>
```

## Updating Rails routes

Open `config/routes.rb` and add following lines:

```ruby {}
Rails.application.routes.draw do
  resources :tasks, only: :index

  root "home#index"
  get '*path', to: 'home#index', via: :all
end
```

Now visit [http://localhost:3000/](http://localhost:3000/) and this time we
should get message `Home`.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added API based architecture"
```
