## What is an N+1 query?

The `N+1` query issue arises when your code executes `N` number of extra
database queries to fetch some data that could have been fetched in a single
query.

This is a major performance bottleneck. Let us understand it better and see how
it can bring down application performance with the help of an example:

```ruby
class Movie < ApplicationRecord
  has_many :reviews
end

class Review < ApplicationRecord
  belongs_to :movie
end
```

In the above example, each review belongs to a movie and each movie can have
multiple reviews.

Now, consider a scenario where you are required to fetch a list of all movies
along with the reviews for each movie in the list.

This can be done by querying the movies and then looping over the movies to get
the reviews for each movie like this:

```ruby
Movie.all.map do |movie|
	movie.reviews
end

# SELECT "movies".* FROM "Movies"
# Review Load (0.1ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" = ?  [["movie_id", 1]]
# Review Load (0.0ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" = ?  [["movie_id", 2]]
# Review Load (0.0ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" = ?  [["movie_id", 3]]
# Review Load (0.0ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" = ?  [["movie_id", 4]]
```

As you can see in the above example, the number of queries made appear to be
`N+1`, where one query fetches the list of movies and then `N` number of queries
fetch the reviews for `N` number of movies.

Hence, the number of network calls appear to be proportional to the number of
movie records in this case. What if the movie list contained a thousand or more
records? Surely making that many calls to the database for a single operation is
not efficient.

In the coming sections we will see how to overcome this issue.

## Query with includes method

Rails provides an `ActiveRecord` method called `includes` which can be used to
specify associations to be included in the result set. It loads associated
records beforehand using techniques like `eager loading` or `preloading`, and
thus reducing the number of database calls and improving the application
performance significantly.

Let us take the previous example and try to implement it using `includes` method
to see how it works:

```ruby
movies = Movie.includes(:reviews)

# Movie Load (0.5ms)  SELECT "movies".* FROM "movies"
# Review Load (0.5ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" IN (?, ?, ?, ?)  [["movie_id", 1], ["movie_id", 2], ["movie_id", 3], ["movie_id", 4]]
```

As you can see from the above example, specifying the `reviews` association
inside `includes` method has led to a reduced number of queries to fetch the
same information that previously took `N+1` queries. This can provide a
significant boost to the application's performance.

Now, when you call the `reviews` method on a movie object from the list of
movies, your application won't make an additional database call to get you the
information. This is because the information was `preloaded`.

Under the hood the `includes` method either uses the `preload` method or
`eager_load` method depending upon the type of query to load up the association
data in advance.

## Preload

By default `includes` delegates to `preload` method which makes two queries like
we saw in the previous example.

1. First query loads up the data from the parent model.
2. Second query loads up data from the specified association.

Previous example would look the exact same if we were to replace `includes` with
`preload` like this:

```ruby
movies = Movie.preload(:reviews)

# Movie Load (0.5ms)  SELECT "movies".* FROM "movies"
# Review Load (0.5ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" IN (?, ?, ?, ?)  [["movie_id", 1], ["movie_id", 2], ["movie_id", 3], ["movie_id", 4]]
```

## Eager load

In case an `includes` query contains a `where` clause which contains an
attribute from the specified association, then `includes` delegates to the
`eager_load` method. `eager_load` method loads all association data along with
the data from parent model in a single query using a `LEFT OUTER JOIN` on the
associated table. For example:

```ruby
movies = Movie.eager_load(:reviews).where("reviews.content = 'sample content'")

# SQL (0.3ms)  SELECT "movies"."id" AS t0_r0, "movies"."title" AS t0_r1, "reviews"."id" AS t1_r0, "reviews"."content" AS t1_r1, "reviews"."movie_id" AS t1_r2, FROM "movies" LEFT OUTER JOIN "reviews" ON "reviews"."movie_id" = "movies"."id" WHERE (reviews.content = 'sample content')
```

We will see how `joins` work later in this chapter.

`includes` method in Rails cannot use the `preload` method when a query contains
the `where` clause because `preload` always generates two SQL queries and
`where` clause cannot be used in such a case.

For example:

```ruby
movies = Movie.preload(:reviews).where("reviews.content = 'sample content'")

# Movie Load (1.1ms)  SELECT "movies".* FROM "movies" WHERE (reviews.content = 'sample content')
# (Object doesn't support #inspect)
```

As you can see, using `preload` in a query with the `where` clause when the
conditions inside `where` clause contain attributes from the association table
leads to an error because Rails applies the conditions inside `where` clause on
the parent model which is the `Movie` class in this case.

This means that you can still use `preload` with a `where` clause if the `where`
clause contains attributes which are not from the specified association. For
example:

```ruby
movies = Movie.preload(:reviews).where("movies.title = 'sample title'")

# Task Load (0.6ms)  SELECT "tasks".* FROM "tasks" WHERE (tasks.title = 'hello')
```

In the above example, the `where` clause doesn't contain any attributes from the
association table i.e. the `reviews` table.

## Specifying multiple associations in includes method

In Rails, you can specify multiple associations inside the `includes` method.
Consider the following example where the `Movie` class also has an association
with the `Actor` class:

```ruby
class Movie < ApplicationRecord
	has_many :reviews
	has_many :actors
end
```

You can query the `reviews` and `actors` along with the movies using the
`includes` method like this:

```ruby
Movie.includes(:reviews, :actors)

# Movie Load (0.5ms)  SELECT "movies".* FROM "movies"
# Review Load (0.5ms)  SELECT "reviews".* FROM "reviews" WHERE "reviews"."movie_id" IN (?, ?, ?, ?)  [["movie_id", 1], ["movie_id", 2], ["movie_id", 3], ["movie_id", 4]]
# Actor Load (0.3ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" IN (?, ?, ?)  [["movie_id", 1], ["movie_id", 2], ["movie", 3]]
```

There is an additional query to load up the information for the `actors`
association in the above example. Thus a separate query will be made for each
association specified inside the `includes` method.

## Loading nested associations with includes

Suppose each movie has many actors and each actor belongs to a certain region.
Can you visualize the nested associations in this case? We can use `includes` to
load nested associations like this:

```ruby
Movie.includes(actors: [:region])

# Task Load (1.8ms)  SELECT "movies".* FROM "movies"
# User Load (0.3ms)  SELECT "actors".* FROM "actors" WHERE "actors"."id" IN (?, ?, ?, ?)  [["id", 1], ["id", 2], ["id", 3], ["id", 4]]
# UserNotification Load (0.1ms)  SELECT "region".* FROM "regions" WHERE "actor"."region_id" IN (?, ?, ?, ?)  [["region_id", 1], ["region_id", 2], ["region_id", 3], ["region_id", 4]]
```

## Query with joins method

A join clause is used to combine records from two tables by using values common
to each.

`Active Record` provides two finder methods for specifying `JOIN` clauses on the
resulting SQL namely `joins` and `left_outer_joins`.`joins` method should be
used for `INNER JOIN` whereas the `left_outer_joins` method is used for queries
using `LEFT OUTER JOIN`.

An `INNER JOIN` query performed on two tables, compares each row of table_1 with
each row of table_2 to find all pairs of rows which satisfy the join condition,
then combines the rows that match the join condition to produce a single table.

For example, consider an example where all movie records have to be fetched
where the reviews contain less than and equal to 3 stars:

```ruby
movies = Movie.joins(:reviews).where("reviews.stars <= ?", 3)

# Movie Load (0.3ms)  SELECT "movies".* FROM "movies" INNER JOIN "reviews" ON "reviews"."movie_id" = "movies"."id" WHERE (reviews.stars <= 3)
```

In the above example, the `joins` method is performing an `INNER JOIN` on
`movies` and `reviews` table based on the common `movie_id` value in both tables
and producing a table which contains all rows where the review contains 3 or
less than 3 stars.

A `LEFT OUTER JOIN` is an extension on `INNER JOIN`, where an `INNER JOIN` join
is performed first, then for each row in table_1 which does not satisfy the join
condition with any row in table_2, a joined row is added with null values in
columns of table_2. Thus, the joined table always has at least one row for each
row in table_1.

## Query with nested joins

To see how we can make query with nested joins let's update the schema like this:

```ruby
class Movie < ApplicationRecord
  has_many :bookings
end

class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :movie
end

class Review < ApplicationRecord
  belongs_to :booking
end
```

In the above example, each review belongs to a booking and each booking belongs
to a movie. One movie can have multiple bookings and each booking can have
multiple reviews. Now, the movie and review are not directly connected.

Let's consider a scenario where we want to fetch a list of all movies where the
review has 3 or more stars:

```ruby
movies_with_at_least_three_review_stars = Movie.joins(bookings: :reviews).where("reviews.stars >= ?", 3)

# Movie Load (0.4ms)  SELECT "movies".* FROM "movies" INNER JOIN "bookings" ON "bookings"."movie_id" = "movies"."id" INNER JOIN "reviews" ON "reviews"."booking_id" = "bookings"."id" WHERE (reviews.stars >= 3)
```

In the above query, the `joins` method is performing an `INNER JOIN` on `movies`
and `bookings` table based on common value `movie_id`. Then `INNER_JOIN` is
performed on the `bookings` and `reviews` table based on the common value
`booking_id`. This produces a table containing all the movies having at least
one booking and rating. Then on this table, another query is performed to get
the movie with a rating of 3 or more stars. Most importantly, this nested join
statement allowed us to ensure that only a single DB query was invoked.

To read more about querying and joins please refer following links:

- https://guides.rubyonrails.org/active_record_querying.html
- https://www.cloudbees.com/blog/speed-up-activerecord
- https://thoughtbot.com/upcase/advanced-activerecord-querying

## joins vs includes

You should use `joins` when you are merely filtering records based on values in
associations and you should use `includes` when you have to access the values in
associations because `joins` method does not load the association data.

For example, if you have to filter out movie records based on reviews, then use
`joins` and if you have to access the reviews and render them then you should
use `includes`.

## Common pitfalls leading to N+1 Queries

### 1. Accessing associated records in view templates

Let’s say you have a Post model that belongs to a Author:

```ruby
class Author < ApplicationRecord
    has_many :posts
end

class Post < ApplicationRecord
    belongs_to :author
end
```

And you have a view that displays a list of posts, along with the author’s name for each post:

```ruby
<% @posts.each  do |post| %>
  <div class="post">
    <h2><%= post.title %></h2>
    <p>By <%= post.author.name %></p>
    <p><%= post.body %></p>
  </div>
<% end %>
```

If you load the posts using a simple `@posts = Post.all` query in your controller, this will result in an **N+1** query issue. This means one query is executed to load all the posts, and **N** additional queries are executed to load the author's name for each post. This issue can be easily overlooked because the associated records are being accessed in the view template.

The same consideration should be taken when **rendering partials** or usage of **helper methods** that access associated records, especially when the code is separated across different architectural layers.

### 2. Using delegates can hide N+1 queries.

```ruby
class Post < ApplicationRecord
  belongs_to :user
  delegate :name, to: :user, prefix: true
end

<% @posts.each do |recipe| %>
  <%= post.user_name %>
<% end %>
```

By looking at the code in this example, it appears to be perfectly fine, with no obvious issues. However, behind the scenes, Rails’s delegate method calls `user` on each post individually, leading to another N+1 query problem.


### 3. Using methods that do not return an `ActiveRecord::Relation` within loops

```ruby
class Post
  has_many :comments
  def latest_comment
    comments.order(:created_at).last
  end
end

# When fetching a single post, no problem arises
post = Post.find(id)
puts post.latest_comment

# However, fetching a list of posts causes N+1 queries even though we have added .includes(:comments)
Post.includes(:comments).each do |post|
  puts post.latest_comment
end
```

Active Record implements "method chaining" which allow us to use multiple Active Record methods together. You can chain methods in a statement when the previous method returns an  `ActiveRecord::Relation`, like `all`, `where`, `includes`, `joins` and `order`. You can’t chain Active Record methods, after a method that does not return an `ActiveRecord::Relation`, like `to_a`, `find` or `last`. You need to put those methods at the end of the statement.

If you try each link of the chain, you will see that just the call to last does not return an `ActiveRecord::Relation`.

```ruby
relation = ActiveRecord::Relation
comments = Post.find(id).comments
puts comments.is_a?(relation) #=> true
puts comments.order(:id).is_a?(relation) #=> true
puts comments.order(:id).last.is_a?(relation) #=> false
```

This is what happens when you try to fetch the list:

```ruby
# When "each" is called, active record will execute 2 queries
# - 1 to fetch the post
# - And 1 to fetch the comments
Post.includes(:comments).each do |post|
  # As it is really:
  # comments.order(:created_at).last
  #
  # With the "order" it builds a new query and execute it
  # on "last", and it will do it for each post
  puts post.latest_comment
end
```

At the moment you call each on the `ActiveRecord::Relation`, it will execute the query. But then for each post it will execute a new query, because although you already have the comments loaded, with the code `order(:created_at).last` you are building a new query to fetch the latest comment with a different order.

This is why when you try to fetch a list of posts, the method seems to ignore the `includes`, and runs a query for each post to get the `latest_comment` resulting in N+1 query.

## How to detect N+1 queries ?

### 1. Use the bullet gem
The [bullet gem](https://github.com/flyerhzm/bullet) can automatically detect and alert you to N+1 queries in your application.

### 2. Usage of `strict_loading`
By default, Rails will not raise an error if you try to access an association that has not been loaded. However, you can manually use the `strict_loading` option to cause an error to be raised if you try to access an unloaded association. This can help prevent N+1 queries by alerting you about cases where you accidentally executed unnecessary queries. You can read more about it in this [blog](https://www.bigbinary.com/blog/rails-6-1-adds-strict_loading-to-warn-lazy-loading-associations).

### 3. Using performance monitoring tools
Leverage performance monitoring tools like [New Relic](https://newrelic.com/) to assess your application's performance and identify N+1 queries. Additionally, you can use tools such as [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler) and [stackprof](https://github.com/tmm1/stackprof) locally to generate flame graphs, which can help you detect N+1 queries.
