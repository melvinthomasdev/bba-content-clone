## Namespaces in Rails

In the previous section,
[Updating default response format](/learn-rubyonrails/use-jbuilder-to-render-json#updating-default-response-format),
we have mentioned that usually we use the `api/v1` namespace to denote the API
routes in our app.

The reason we haven't used this approach in our application is because
namespaces is an advanced concept to be introduced at the beginning of the book
and would distract the reader from the flow of the book.

Namespaces are used to organize a group of controllers. For example, you may
wish to organize a group of controllers that are only accessible by the admin of
your app, under the `Admin::` namespace. You can do so by placing your
controllers in `app/controllers/admin` directory and editing your `routes.rb`
file like so:

```ruby
namespace :admin do
  resources :articles
end
```

You would need to add the namespace to your controllers:

```ruby
module Admin
  class ArticlesController < ApplicationController
    # Controller action code...
  end
end
```

This will create `Admin::ArticlesController` which will respond to the RESTful
routes under `/admin/articles` with the prefix `admin` to the path method used
to identify the resources like so:

| Prefix             | VERB   | URI Pattern         | Controller#Action      |
| ------------------ | ------ | ------------------- | ---------------------- |
| admin_articles     | GET    | /admin/articles     | admin/articles#index   |
|                    | POST   | /admin/articles     | admin/articles#create  |
| admin_new_article  | GET    | /admin/articles/new | admin/articles#new     |
| admin_edit_article | GET    | /admin/articles/:id | admin/articles#edit    |
| admin_article      | GET    | /admin/articles/:id | admin/articles#show    |
|                    | PATCH  | /admin/articles/:id | admin/articles#update  |
|                    | PUT    | /admin/articles/:id | admin/articles#update  |
|                    | DELETE | /admin/articles/:id | admin/articles#destroy |

You can also add a namespace to classes using a `scope resolution operation` or
`::` like so:

```ruby
class Admin::ArticlesController < ApplicationController
  # Controller action code...
end
```

Using the `::` operator in the above code means, `ArticlesController` in the
namespace of `Admin`.

Namespaces are a handy way to organize our routes, but it is not very flexible.
If we want a more customizable solution then we can use `scopes` instead.

## Routing with scopes

Scopes are a bit more complex but the advantage they provide is that they give
us more options to fine-tune exactly what we want to achieve.

The `scope` method accepts three options; `module`, `path` and `as`.

### The module option

`module` option lets us define in which module the controller for the embedded
resources will reside in.

For example the for the following snippet:

```ruby
scope module: 'admin' do
  resources :articles
end
```

Rails will look for the controllers for `/articles` route inside the `Admin::`
module. Thus rails will generate the following routes:

| Prefix       | VERB   | URI Pattern   | Controller#Action      |
| ------------ | ------ | ------------- | ---------------------- |
| articles     | GET    | /articles     | admin/articles#index   |
|              | POST   | /articles     | admin/articles#create  |
| new_article  | GET    | /articles/new | admin/articles#new     |
| edit_article | GET    | /articles/:id | admin/articles#edit    |
| article      | GET    | /articles/:id | admin/articles#show    |
|              | PATCH  | /articles/:id | admin/articles#update  |
|              | PUT    | /articles/:id | admin/articles#update  |
|              | DELETE | /articles/:id | admin/articles#destroy |

### The path option

`path` allows us to set the prefix that will appear in the URI, before the
resource name.

For example the following snippet would add the prefix `/admin` to `articles`
route:

```ruby
scope  path: 'admin' do
  resources :articles
end
```

The above snippet would generate the following routes:

| Prefix       | VERB   | URI Pattern         | Controller#Action |
| ------------ | ------ | ------------------- | ----------------- |
| articles     | GET    | /admin/articles     | articles#index    |
|              | POST   | /admin/articles     | articles#create   |
| new_article  | GET    | /admin/articles/new | articles#new      |
| edit_article | GET    | /admin/articles/:id | articles#edit     |
| article      | GET    | /admin/articles/:id | articles#show     |
|              | PATCH  | /admin/articles/:id | articles#update   |
|              | PUT    | /admin/articles/:id | articles#update   |
|              | DELETE | /admin/articles/:id | articles#destroy  |

So while the URI pattern has the prefix `admin` to it, the controller actions
and path name prefixes remain unchanged.

The above snippet is similar to using scope without any options specified, like
so:

```ruby
scope :admin do
  resources :articles
end
```

### The as option

The `as` can be used to change the name of the path method used to identify the
resources by adding the supplied value as a prefix.

For example, the following snippet will add `admin` as a prefix for the path
methods for the `articles` resource:

```ruby
scope as: 'admin' do
  resources :articles
end
```

The above snippet would add the prefix `admin` for the path method and generate
the following routes:

| Prefix             | VERB   | URI Pattern   | Controller#Action |
| ------------------ | ------ | ------------- | ----------------- |
| admin_articles     | GET    | /articles     | articles#index    |
|                    | POST   | /articles     | articles#create   |
| admin_new_article  | GET    | /articles/new | articles#new      |
| admin_edit_article | GET    | /articles/:id | articles#edit     |
| admin_article      | GET    | /articles/:id | articles#show     |
|                    | PATCH  | /articles/:id | articles#update   |
|                    | PUT    | /articles/:id | articles#update   |
|                    | DELETE | /articles/:id | articles#destroy  |

As we can see, the `scope` method allows us to define our routes in a more
customized way, allowing us to define specific `module`, `path` and `as`
options.

## Scope vs Namespace

You might be wondering what is the difference between the `scope` and
`namespace` method, since both methods manipulate how the restful routes for a
resource are generated in Rails.

The major difference between the two methods is the value of the `module`,
`path` and `as` options.

While in the `scope` method the options have no default value and have no effect
unless specified, in the `namespace` method block the scope will automatically
add the same value for `as`, `module` and `path` options.

In a way, `namespace` is a shorthand for writing a `scope` with all three
options being set to the same value.

For example, in the following snippet, the `namespace` will add the `admin`
prefix to the path, module and the path helper method:

```ruby
namespace "admin" do
  resources :articles
end
```

The above snippet is the same as:

```ruby
scope "/admin", as: "admin", module: "admin" do
  resources :articles
end
```

Both the snippets will generate the routes for the resource `articles` like so:

| Prefix             | VERB   | URI Pattern         | Controller#Action      |
| ------------------ | ------ | ------------------- | ---------------------- |
| admin_articles     | GET    | /admin/articles     | admin/articles#index   |
|                    | POST   | /admin/articles     | admin/articles#create  |
| admin_new_article  | GET    | /admin/articles/new | admin/articles#new     |
| admin_edit_article | GET    | /admin/articles/:id | admin/articles#edit    |
| admin_article      | GET    | /admin/articles/:id | admin/articles#show    |
|                    | PATCH  | /admin/articles/:id | admin/articles#update  |
|                    | PUT    | /admin/articles/:id | admin/articles#update  |
|                    | DELETE | /admin/articles/:id | admin/articles#destroy |

**This is an in-depth chapter and hence you do not need to commit any of these
changes.**
