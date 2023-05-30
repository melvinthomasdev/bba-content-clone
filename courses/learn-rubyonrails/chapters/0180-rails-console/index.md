## Introducing Rails console

Rails console is a command line program for interacting with the Rails
applications. It has the full power of the Ruby language and Rails environment.
We can start the Rails console using the following command:

```bash
bundle exec rails console
```

The above command would show a console like so:

```ruby
irb(main):001:0>
```

Let's run some commands to see how Rails console can help us get some useful
information.

## Finding column names of the table

`Task.column_names` returns the names of all the columns of `tasks` table:

```ruby
irb(main):001:0> Task.column_names
=> ["id", "title", "created_at", "updated_at"]
```

Notice that we have a column named `id` present. Rails adds this column by
default and it serves as the primary key of the table. The value of the id auto
increments when a new record is created. We will see it in action shortly.

## Finding number of records in the table

`Task.count` returns the number of records in the table:

```ruby
irb(main):002:0> Task.count
   (0.1ms)  SELECT COUNT(*) FROM "tasks"
=> 0
```

It means right now we do not have any record in the `Tasks` table.

## Creating a new task using Task.create

`Task.create` creates and saves a new task in the database:

```ruby
irb(main):003:0> Task.create
   (0.3ms)  begin transaction
  SQL (2.8ms)  INSERT INTO "tasks" ("created_at", "updated_at") VALUES (?, ?)  [["created_at", "2019-01-28 17:00:26.379031"], ["updated_at", "2019-01-28 17:00:26.379031"]]
   (11.7ms)  commit transaction
=> #<Task id: 1, title: nil, created_at: "2019-01-28 17:00:26", updated_at: "2019-01-28 17:00:26">
```

Notice that the id is 1. If we create one more task then the id of the new task
will be 2.

We can exit the Rails console by typing `exit`.

## Clearing the console

On Mac we can use **Command + K**. On Linux we can use **Ctrl + l**.

## Reloading the console or an object

To reload the console we can use the `reload!` command:

```ruby
>> reload!
Reloading...
=> true
```

To reload the object we can use the `reload` method on an object:

```ruby
>> task.reload
Task Load (0.3ms)  SELECT "tasks".* FROM "tasks" WHERE "tasks"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
=> #<Task id: 1, title: "My first task", created_at: "2020-03-30 08:55:09", updated_at: "2020-04-03 09:01:42">
```

Let's say that we have "rails console" open. Now if we make any changes to any
model then that change would not be reflected in the console. One solution is to
`reload` the object with `reload` method on an object, like we had shown in
above code block or reload the application itself by executing `reload!`
command. If none of those works in reloading the latest values from the
database, then the final solution is to exit the console and start the console
again from scratch.

## Getting value of the last expression

Say we write some query into the console and forget to assign it to a variable.
In the next line we want to refer to the returned value. we can use the special
variable, underscore(`_`), to retrieve the result of the last expression.

```ruby
> Task.find(1)
  Task Load (0.3ms)  SELECT "tasks".* FROM "tasks" WHERE "tasks"."id" = ? LIMIT ?  [["id", 1], ["LIMIT", 1]]
 => #<Task id: 1, title: "My first task", created_at: "2020-03-30 08:55:09", updated_at: "2020-04-03 09:01:42">
> _
 => #<Task id: 1, title: "My first task", created_at: "2020-03-30 08:55:09", updated_at: "2020-04-03 09:01:42">

```

We can see in the above example we are using the `_` to access the last
expressions value.

## Use c as a shortcut

Rails console can be started by either of the following two commands:

```bash
bundle exec rails console
```

```bash
bundle exec rails c
```

## Switching the environment

Rails console can be started in staging or in test environment like this:

```bash
bundle exec rails console -e test
bundle exec rails console -e staging
```

When we do `bundle exec rails console` then it is equivalent to the followings:

```bash
bundle exec rails console -e development
```

## Command history

If we want to re-execute a previously executed command then we can have two
options.

We can use the up and down arrow to get to the previously typed command.

We can also use **ctrl+r** to search the previously history just like it can be
done on bash shell.

## Use source location to know the location of the code

If we want to know where a method is defined then we can use
[source_location](https://apidock.com/ruby/Method/source_location) to find that.

We know that `Task` models have `save` method because of ActiveRecord. Let's
find out where this `save` method is defined:

```ruby
>> Task.first.method(:save).source_location
==> ["/Users/user.name/.rbenv/versions/3.1.2/lib/ruby/gems/3.0.0/gems/activerecord-6.1.4.1/lib/active_record/suppressor.rb", 43]
```

## User helper

Rails makes helper methods available to console:

```ruby
>> helper.number_to_currency(10)
==> "$10.00"

>> helper.time_ago_in_words(Time.now)
=> "less than a minute"
```

## Working in a sandbox

When we open console and if we make any changes to the database then those
changes are permanent in the database. However sometimes we want to test
something and we want all those changes to rollback when we exit console. This
is very often used in debugging in the development and test environment.

```bash
bundle exec rails console -e development --sandbox
```

The above command will load the Rails console with development environment in
sandbox mode. Example:

```ruby
Loading development environment in sandbox
Any modifications you make will be rolled back on exit
>> Task.update_all(name: "new name")
>> exit
```

Once we exit then all the task name we had changed would be rolled back.

## Use exit to quit console

```bash
irb(main):001:0> exit
```

## Simple prompt

By default when console starts then prompt like this:

```bash
$ bundle exec rails console
Running via Spring preloader in process 77597
Loading development environment (Rails 7.0.3.1)
irb(main):001:0> a = 1
irb(main):002:0> b = 2
irb(main):003:0> c = 3
```

We can also ask console to have simple prompt:

```bash
$ bundle exec rails console -- --simple-prompt
Running via Spring preloader in process 77680
Loading development environment (Rails 7.0.3.1)
>> a = 1
>> b = 2
>> c = 3
```

There is **nothing to commit** in this chapter since all we had done was work in
the Rails console.
