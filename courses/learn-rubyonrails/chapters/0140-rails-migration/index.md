## What is a Rails migration?

As we build the application we need to make changes to the databases. These
changes could be adding a table, adding a column, modifying a column type,
adding index etc.

To make these changes to the database we need to write SQL statements. However
these SQL statements are about data in the database. These SQL statements are
not reading data from the database or modifying the data in any way. These SQL
statements are about changing the database itself.

These types of SQL statements which change the database itself are called Data
Definition Language(DDL).

If we were using plain SQL, we can create a new table on an SQLite database like
this:

```sql
create table blogs(
   id integer PRIMARY KEY AUTOINCREMENT NOT NULL,
   title VARCHAR NOT NULL,
   body TEXT,
   created_at datetime NOT NULL,
   updated_at datetime NOT NULL
);
```

In Rails we would write the same like this:

```ruby
create_table :blogs do |t|
  t.string :title
  t.text :body
  t.timestamps
end
```

What we are seeing above is a Rails migration.

There are several advantages of writing DDL using Rails migrations over writing
the SQL statements. The most important ones are:

- The migration code in Ruby is database independent. We can run the same code
  for SQLite3, PostgreSQL and for MySQL and it will work.
- All migrations run sequentially and they are additive. Each migration adds to
  the previous state of the database.

## Creating tasks table

Let us start building our application. First, we need a new table to store the
tasks data. For now, let's assume that we have only a title to be stored in a
task.

Let's create a new migration to create a table named `tasks`. Execute the
following command from the terminal:

```bash
bundle exec rails generate migration CreateTasks
```

This will automatically generate a migration file in the folder `db/migrate/`.
The file will be named something like `20190128151553_create_tasks.rb`.

Open the file and add the following code:

```ruby {4}
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :title
      t.timestamps
    end
  end
end
```

Now that we have added the migration file, let's run the migration so that it
takes effect and table `tasks` is created in our database.

Run the following command in your terminal:

```bash
bundle exec rails db:migrate
```

You will get an output similar to this:

```text
== 20190128151553 CreateTasks: migrating =====================================
-- create_table(:tasks)
   -> 0.0015s
== 20190128151553 CreateTasks: migrated (0.0015s) ============================
```

The migration is now executed and the table has been created. Let's verify that
the tables are indeed created.

First run the following command to invoke the Rails console:

```bash
bundle exec rails console
```

Now we can use the `ActiveRecord::Base` to interact with our database and list
all existing tables:

```ruby
irb(main):001:0> ActiveRecord::Base.connection.tables
```

You should see the "tasks" table listed in the output array:

```ruby
=> ["schema_migrations", "ar_internal_metadata", "tasks"]
```

It's important to note that just creating a migration file is not enough. Once a
migration file is created it just sits there and it does nothing until the
command `bundle exec rails db:migrate` is executed.

Once that command is executed then Rails will make the necessary changes to the
database.

Now let's commit the current changes:

```bash
git add -A
git commit -m "Added migration script for creating tasks table"
```

## schema.rb file is the final source of truth

If we open `db/schema.rb` file then the very first three lines says this:

```text
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
```

You will also notice that the definition for our `tasks` table structure is
added in that file automatically.

Every time we run a migration, Rails writes the changed state of the database to
`db/schema.rb`. Therefore schema.rb file is the final source of truth for the
database structure.

## Rails version in the migration file

The contents of our previous migration file, `20190128151553_create_tasks.rb`,
looks like this:

```ruby
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :title
      t.timestamps
    end
  end
end
```

As we can see our class is inheriting from `ActiveRecord::Migration[7.0]`. Here
`[7.0]` is the Rails version used to create the migration.

Note that the filename starts with a timestamp. The first few numbers of the
file name (in our example, `20190128151553`) indicate the timestamp at which the
migration script was generated. Rails uses this timestamp to determine the order
of execution of migration scripts.

Rails executes a migration only one time. It means once a migration has been
executed then any changes made to that migration will have no impact unless we
"rollback" that migration.

Rails manages this by using an automatically created, special table named
`schema_migrations`. That table contains a single column and it stores the
timestamp associated with each executed migration scripts. The table and its
values looks like this:

<image>schema-migrations-table.png</image>

Whenever we are running `rails db:migrate`, Rails cross checks
`schema_migrations` and the files in `db/migrate` folder. It can therefore
identify and run the migration scripts that haven't yet been executed.

### Timestamp metadata in migrations

In the migration we have statement `t.timestamps`. That's a shortcut way of
saying create two columns `created_at` and `updated_at`. Rails encourages us to
have these two columns in all the tables.

Whenever a new record is created then `created_at` is automatically populated by
Rails. Similarly, whenever a record is updated then `updated_at` column is
updated with when the record was updated.

Some methods like `update_all` and `update_column` will not update `updated_at`
value. More on this will be covered in the coming chapters.

### The to_f method

The timestamps, we discussed in the previous section, are commonly used for
auditing, caching, and sorting purposes. Sometimes you might need to perform
arithmetic operations on it or use it as some sort of key. In these cases, it is
advisable to convert them to floating point numbers using the
[`to_f`](https://apidock.com/ruby/v2_5_5/Time/to_f) method.

In Ruby, the `to_f` method can be used with timestamps or `Time` objects to
convert the time to a floating point number. This floating point number
represents the number of seconds since the Unix epoch or January 1, 1970
00:00:00 UTC. For instance, `created_at.to_f` will yield a floating point
number, indicating a specific point in time, that you can use as a key or for
other purposes.

### Load schema and dump schema

In a large application which has been in development for a few years the number
of migrations can be 100 or even more. In such cases when we run
`rake db:migrate` then Rails executes each migration one by one sequentially.
This could take some time.

A faster way is to execute `rails db:schema:load`. This skips all the migrations
up to `<migration_version>` value found in the first line
`ActiveRecord::Schema[7.0].define(version: <migration_version>)` of
`db/schema.rb` file and directly loads the schema mentioned in `db/schema.rb`
into the database. It also marks all the existing migrations up to
`<migration_version>` as done by adding all their timestamps to
`schema_migrations` table. So, when we add new migrations, only those newly
added migrations, starting from the migration right after `<migration_version>`
will be executed upon running `bundle exec rails db:migrate`.

Does this imply that `db/schema.rb` can be updated manually without using
migrations?

The answer to this question is a bit complex and thus we have moved it to the
in-depth chapters towards the end of the book. If you're curious about the
answer, you can read
[this section](/learn-rubyonrails/rails-migrations-in-depth#significance-of-schema-file)
from the in-depth chapter and come back.

**Be careful when running `rails db:schema:load`. It resets your database and
all the stored data will be lost.**

There are some downsides for initializing a database using `schema.rb` as well.
This method only restores the database table structure. Rails can't write the
advanced database features like stored procedures, triggers, check constraints,
etc in `schema.rb`. So, such changes we make to our database won't be restored
when we load the schema.

In some rare situations, we will have to run SQL queries on the database
manually, instead of running migration scripts. The actual database structure
and the one specified in `schema.rb` will diverge in such cases.

To reverse sync them, we will run `rails db:schema:dump`. With that command, we
are instructing Rails to rewrite `db/schema.rb` according to the current
database schema.

### Reversing migrations

Let's say that we have a migration like this:

```ruby
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :body
      t.timestamps
    end
  end
end
```

We executed `rails db:migrate`. Then we realized that we need to change the
column type for body from `string` to `text`.

We have two choices. Create another migration to change the type of `body` or
rollback the migration, edit it, and then re-run it.

If we edit the migration and re-run `rails db:migrate` without rolling back, the
changes won't reflect in the database. This is because Rails marks a migration
as done once it is executed and won't execute it again.

To rollback and re-run, first, let's ask Rails what is the migration status:

```bash
bundle exec rails db:migrate:status
```

And it will output something like the following:

```text
database: db/development.SQLite3

 Status   Migration ID    Migration Name
--------------------------------------------------
   up     20200530172019  Create tasks
```

As we can see above the status of the migration ID `20200530172019` is `up`. It
means if we run `rails db:migrate` again then Rails will ignore that migration
file.

Now, to rollback this migration, run this command:

```bash
bundle exec rails db:rollback
```

Check the status again:

```bash
bundle exec rails db:migrate:status
```

And it will output something similar to this:

```text
database: db/development.SQLite3

 Status   Migration ID    Migration Name
--------------------------------------------------
  down    20200530172019  Create tasks
```

After the rollback, we can see that the status of migration ID `20200530172019`
is `down`. It means if we execute `rails db:migrate` then this migration will be
executed.

Now, we can change the migration file. The changed file looks like this:

```ruby
class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.text :body
      t.timestamps
    end
  end
end
```

Run the migration again:

```bash
bundle exec rails db:migrate
```

It should work!

But what exactly happened when we rolled back the migration?

Notice that the method name in the migration is `change`. When we execute
migration then Rails adds that change. When we rollback then Rails removes that
change.

Operations like adding tables and columns are reversible. Rails can reverse them
by dropping the added table or column. In that case, the database will be in the
exact same state as it was before.

There are some other cases where Rails will not be able to reverse the changes.
For example: dropping a column. In that case, since Rails doesn't know what all
data the column contained before, the database cannot be reverted to its
previous state.

In such cases we can help Rails by having two methods `up` and `down` instead of
`change`. Here we can manually specify what to do when the migration is being
rolled back.

Even though it is redundant, our previous migration could also be written like
this:

```ruby
class CreateTasks < ActiveRecord::Migration[7.0]
  def up
    create_table :tasks do |t|
      t.string :body
      t.timestamps
    end
  end

  def down
    drop_table :tasks
  end
end
```

### Raw execution of sql statements

Sometimes we need to execute database specific command. For such cases we can
use `execute`:

```ruby
class DeleteTasksTable < ActiveRecord::Migration[7.0]
  def change
    execute 'DELETE FROM tasks'
  end
end
```

But keep in mind that SQL syntax and functions vary with the database engine. So
if you are working on different databases for development (eg: SQLite) and
production (eg: PostgreSQL), writing native SQL will be risky.

Also note that even if the SQL we supplied is practically reversible, Rails
isn't intelligent enough to find a correct rollback strategy for SQL statements.
Therefore, we will need to manually supply `up` and `down` methods for the
migration script to be able to be rolled back.

### More tasks from Rails to manage database

Rails offers many tasks related to the database management:

```bash
bundle exec rails -T db
```

Output:

```bash
rails db:create
rails db:drop
rails db:environment:set
rails db:fixtures:load
rails db:migrate
rails db:migrate:status
rails db:prepare
rails db:rollback
rails db:schema:cache:clear
rails db:schema:cache:dump
rails db:schema:dump
rails db:schema:load
rails db:seed
rails db:seed:replant
rails db:setup
rails db:structure:dump
rails db:structure:load
rails db:version
rails test:db
```

As we can see, there are a lot of Rake tasks to manage the database. We will see
some of these tasks in detail in the upcoming chapters.

The changes we made to the files were for demonstration only. Let's revert the
changes.

```bash
git clean -fd
```

Some of the changes we have made to our database are irreversible. To get it
back in our old state, let us delete it, create a new one, and then re-run the
migration scripts on it.

Run this command to do so:

```bash
bundle exec rails db:reset
```

## Don't edit existing migrations

Occasionally you will make a mistake when writing a migration and that mistake
will get migrated to the database. In such a case you might be tempted to edit
the faulty migration and run it again. Doing this won't help because Rails has
already run the migration. When you run migrations again Rails will only run the
pending migrations.

To update a migration you must first rollback the migration, edit it and then
run the command to run migrations. Rolling back a migration and editing it is
okay unless the migration hasn't been pushed to main branch and changes haven't
been migrated to the production database.

You should strictly refrain from editing a migration that has already been run
in production. Instead create a new migration to fix the errors in faulty
migration.

## Upcoming content about migration

We will be dealing with migrations in depth in the upcoming chapters as we
progress through the book.

The reason we have not discussed migrations in detail in this chapter itself is
because migrations are a vast topic and it would have been very overwhelming if
we had discussed the whole story in this early chapter itself.

We would suggest that you go through the chapters in a linear order. But If you
are sure that you want to deep dive and learn in-depth about migrations, then
you can refer to the
[Rails migration in depth chapter](rails-migrations-in-depth) chapter in this
book and the
[official documentation](https://guides.rubyonrails.org/active_record_migrations.html)
for migrations in Rails, and come back.
