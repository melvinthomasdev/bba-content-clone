In the previous chapter we learnt how we can query a task from the database
using the `find_by` method.

There are several methods which we can use to query one or more than one records
from database. In this chapter we will take a look at these finder methods.

## find

Let's take an example where a task with ID 1 doesn't exist. What happens when we
query a task record with ID 1. Before moving on, pause for a moment to think
about what will be the output if we query a record which doesn't exist. Will we
get a null value for output?

To answer the question, it depends upon the finder_method used to query data.
For eg, If we use the `find` method:

```ruby
Task.find(1)
```

The above command will raise an exception if there doesn't exist a task with
ID 1. You can get away with it if you properly handle exceptions in your Rails
application. Handling exceptions is always a good thing.

But how do we prevent exceptions? Let's take a look at some other finder_methods
to answer that question.

## find_by

Using `find_by` is convenient when we are searching for a record using a column
of the record:

```ruby
Task.find_by(name: "Get Milk")
Task.find_by(desc: "Get Eggs")
```

If a record isn't found then the `find_by` method will return a `nil` value.
Note that the bang version(!) of `find_by` will raise an exception if no record
is found.

```ruby
Task.find_by!(name: "Get Milk")
Task.find_by!(desc: "Get Eggs")
```

Above commands will raise an exception if no record is found.

## where

Active Record allows us to use `where` to build more complex queries:

```ruby
Task.where(name: "Get Milk", user_id: 3).first
```

Please note that `where` operation returns `ActiveRecord:Relation`. Also note
that return of where clause could be a collection of records.

## Don't use dynamic finder methods

For every field or attribute that you have defined in your table, `ActiveRecord`
generates a dynamic finder method. For example, in our `Task` model we have
defined `title` and `slug` fields for which `ActiveRecord` will provide finder
methods `find_by_title` and `find_by_slug` for our `Task` model.

While these method may seem convenient at first, but we strongly recommend
against using them.

One reason being that the method names can become cumbersome when querying
multiple fields. For example, if we want to query `title` and `slug` together we
can do so with finder methods like this:

```ruby
Task.find_by_title_and_slug("Task title", "task-title")
```

Or

```ruby
Task.find_by_slug_and_title("task-title", "Task Title")
```

On the other hand we can achieve the same result using the `find_by` method as
it takes in multiple arguments, like this:

```ruby
Task.find_by(title: "Task Title", slug:"task-title")
```

As we can see using the `find_by` method is far more concise and legible when
compare to the finder method approach.

The second, and perhaps more important reason to not use dynamic finder methods
is the way they are implemented under the hood. Dynamic finder methods are
implemented via `method_missing` which takes a huge toll at performance
comparatively.

## finder methods file in Ruby on Rails

Rails has a file named
[finder_methods](https://github.com/rails/rails/blob/23b4aa505d04731c7890e19e8f8996869526f5b3/activerecord/lib/active_record/relation/finder_methods.rb)
which lists a lot of finder methods which are worth taking a look.

## Best practices

We should use the `find` method over `find_by!` method if we are querying using
the `id` attribute only. Because in the `find` method we can directly pass the
`id` value without defining any key which makes the code cleaner.

For example:

```rb
# Incorrect way
def load_user!
  @user = User.find_by!(id: params[:id])
end
# Correct way
def load_user!
  @user = User.find(params[:id])
end
```

There is **nothing to commit** in this chapter.
