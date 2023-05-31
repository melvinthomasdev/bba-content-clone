## What is routing?

Routing is the term used to denote the process of mapping URLs to the right
controller and to the right actions. In other words, it is used to define which
method should be executed when a request is received.

We define all the endpoints and their corresponding controller actions in
`config/routes.rb`.

## How Rails routing works

Assume we have defined a route like this:

```ruby
get "/articles" => "articles#list"
```

But wait! What is the `=>` symbol?

The `=>` symbol is known as the `hashrocket`. It's used to denote Hash literals
in Ruby. But with newer versions of Ruby and Rails, we prefer to use JSON styled
Hash notation, where we use a colon.

Still the `=>` can be found in many places, predominantly in the `routes.rb` and
the `Gemfile`.

Coming back to routing, here is how it will work:

- When a user visits http://localhost:3000/articles Rails looks at the
  `config/routes.rb` file and tries to find first pattern matching with
  `/articles`.
- In this case, we have only one entry and its value corresponds to
  `articles#list`.
- Rails will split that string into two parts: `articles` and `list`.
- The first part, `articles`, will be used to search for a controller with a
  matching name. In this case, Rails will be searching for the class
  `ArticlesController`.
- The second part, `list`, will be considered as the name of the method to be
  called.
- Now, Rails will run the method `list` defined inside `ArticlesController`
  class and the result will be returned to the client.

Let's take another example:

```ruby
get "/books" => "books#list"
```

Here if the request is made to `/books` then Rails will send the request to
`BooksController` and action would be `list`.

## Dynamic segments in routes

Let's say that we want to see the details of the book
[The Fountainhead](https://en.wikipedia.org/wiki/The_Fountainhead).

The URL could look like `http://localhost:3000/books/the-fountainhead`. What
should the route configuration be for this?

We can have something like this:

```ruby
get "/books/the-fountainhead" => "books#the_fountainhead"
```

If we have thousands of books, or if the books are dynamically added, this
strategy will not scale. We can't manually keep making an entry in the routes
file for each book.

[Dynamic Segments](https://guides.rubyonrails.org/routing.html#dynamic-segments)
are there to rescue us in such situations. This is how we define routes using
`Dynamic segment` approach.

```ruby
get "/books/:id" => "books#show"
```

In the above case when user visits `/books/the-fountainhead`, Rails will send
the request to `show` action inside `BooksController` class.

Also, Rails will make the request path segment corresponding to `:id` available
in `params` method. The value of `params` behaves like a hash.

We can access the value of `:id` from `show` action like this:

```ruby
class BooksController < ApplicationController
  def show
    book_name = params[:id]
    # get the book details from the database
  end
end
```

## Root URL

Root URL determines what to respond when a user tries to load the home page of
our application. In our case, it will be http://localhost:3000.

We will define route to the root URL like this:

```ruby
root to: "home#welcome"
```

In the above case when a user visits the homepage, the `welcome` action in the
`HomeController` will be triggered.

The link for homepage won't work as we have not implemented the `welcome` action
yet.

## More about Rails routing in the official guide

There is a lot more to explore in Rails routing. The official Rails guide on
[Rails routing](https://guides.rubyonrails.org/routing.html#bound-parameters)
has some excellent material on it.

Here are some must reads.

- [Bound parameters](https://guides.rubyonrails.org/routing.html#bound-parameters)
- [Dynamic Segments](https://guides.rubyonrails.org/routing.html#dynamic-segments)
- [Static Segments](https://guides.rubyonrails.org/routing.html#static-segments)
- [The Query String](https://guides.rubyonrails.org/routing.html#the-query-string)
- [Naming routes](https://guides.rubyonrails.org/routing.html#naming-routes)
- [Route Globbing](https://guides.rubyonrails.org/routing.html#route-globbing-and-wildcard-segments)
- [Redirection](https://guides.rubyonrails.org/routing.html#redirection)

We haven't made any changes in our project. So there is nothing to commit in
this chapter.
