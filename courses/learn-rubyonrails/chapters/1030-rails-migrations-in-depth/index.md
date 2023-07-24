## Raw SQL migrations and their complications

### When to use raw SQL?

Sometimes, Rails-style migration scripts might not be enough to meet our needs.
Some changes in real-life requires us to run raw SQL code. A good example of
this case is adding additional constraints to the database.

We add constraints to our database to ensure the integrity of our data.
Constraints are validated every time we make a change to our database. Since
constraint validation is a database-level operation, they are always
thread-safe. Therefore, database constraints help us prevent race conditions.

We can use Rails migration to add foreign key constraints and unique constraints
during table creation.

Some databases provide several constraining techniques which are very unique to
the specific DB.
[exclusion constraint](https://www.postgresql.org/docs/9.0/ddl-constraints.html#DDL-CONSTRAINTS-EXCLUSION)
in PostgreSQL and
[enum constraint](https://dev.mysql.com/doc/refman/8.0/en/constraint-enum.html)
in MySQL are some examples. We can't express these in Rails migration scripts as
of now.

In such cases, we will have to write raw SQL queries to achieve the desired
result.

### Writing raw SQL in migrations

Rails supports native queries for migrations too. Here is how we write a native
SQL query in Rails migration:

```ruby
class SampleSQLMigration < ActiveRecord::Migration[7.0]
  def up
    # add an exclusion constraint
    execute <<~SQL
      ALTER TABLE sales_orders
      ADD CONSTRAINT sales_orders_non_deleted_date_unique
      EXCLUDE (order_date WITH =) WHERE (archived = false);
    SQL
  end

  def down
    # remove the exclusion constraint
    execute <<~SQL
      ALTER TABLE sales_orders
      DROP CONSTRAINT sales_orders_non_deleted_date_unique
    SQL
  end
end
```

Here, the `execute` method accepts a string of native SQL query and then runs it
on the database.

The `<<~` squiggly symbol is a plain ruby syntax for writing long multi-line
indented content. Ruby calls it
["Here Documents" or heredocs](https://ruby-doc.org/3.2.2/syntax/literals_rdoc.html#label-Here+Document+Literals)
in short.

This migration script will add a new exclusion constraint
`sales_orders_non_deleted_date_unique` on the table `sales_orders`. This
constraint ensures that no two rows with same `order_date` exists unless any one
of them is `archived`. In simpler words, there should only be a single
un-archived `SaleOrder` for any given `order_date`.

Exclusion constraint is a PostgreSQL specific feature and therefore this SQL
will succeed only when executed on a PostgreSQL database.

We have to provide the migration separate `up` and `down` methods instead of a
single `change` method when using native SQL migrations. Otherwise, the
migration won't be reversible. We will discuss more about reversible migrations
in the next section.

### Raw SQL is not recommended

Raw SQL migrations can do everything a Rails migration can do. But as discussed
earlier, the converse is not true. We can't do everything raw SQL does, using
Rails migration scripts.

But still, we use the Rails way for writing migrations. Ever wondered why? There
are four strong reasons why raw SQL migrations aren't recommended unless it is
the only possible way of achieving our requirement.

They are:

- Databases differ in SQL syntax and supported features. An SQL migration script
  written for PostgreSQL is not guaranteed to work for another database system
  like SQLite. So we will have to use the same database system for development
  and production environments.
- Native SQL migrations are inherently non-reversible. Irrespective of the
  complexity, Rails isn't capable of finding an appropriate inverse SQL script
  from the supplied one as of now. So, we will have to write `up` and `down`
  scripts for every migration.
- We manually have to make sure that the names we define adhere to Rails naming
  conventions to avoid breaking **conventions over configuration** style.
- Active Record queries are much more readable and maintainable compared to a
  raw SQL statement.

## Reversible and non reversible migrations

If we make any mistakes in the migration script, and if we had migrated that
particular migration to database, then reverting the changes of that migration
in DB depends on how we had written that migration in the first place.

To make sure we are able to revert changes in database level, we will have to
rollback our previous migration and rerun it with modifications. When we
rollback a migration, the database will be restored to its previous state.

Rails lets us rollback already executed migrations using the command
`bundle exec rails db:rollback`.

Even though Rails can automatically devise a strategy for reverting several
migration operations, there are some operations that are inherently
irreversible.

Some examples will be updating the value of a column or dropping a column. In
both cases, there is now way of knowing what data that column contained earlier.
So Rails cannot reverse the operation.

Even though it cannot be automated, we can ask Rails to execute a script which
will reverse the changes we had made.

As discussed in the earlier chapters, we do this by specifying `up` and `down`
methods instead of a single `change` method in migration files.

As discussed earlier, Rails isn't smart enough to automatically determine the
inverse of a given SQL script irrespective of its complexity. So we should
manually write `up` and `down` methods if we are using these irreversible
methods.

Writing rollback scripts for migrations is only a recommendation. In real life,
we will encounter situations where we cannot specify a strategy for reversing a
migration. Rails do not force us to make our migrations always reversible. We
can use the `change` method to define the irreversible migrations in such cases.

## Possible operations in Rails migrations

Rails provide us these methods to perform migration operations. Some
not-so-relevant methods are omitted to avoid being too verbose:

- **add_column**

Description: Used to add a column to an existing table. We will specify the
table name, name of the column to add and its data type as parameters.

Usage:

```ruby
add_column :table_name, :column_name, :string
```

- **add_index**

Description: To add index to the specified column. Indices are used to speed up
queries in the expense of additional storage. For example: `email` column of
`users` table should be indexed to quickly retrieve user's details using the
given `email` input.

Usage:

```ruby
add_index :table_name, :column_name
```

- **change_column**

Description: Used to change a column's data type. There are some subsidiary
methods available as well. `change_column_null` sets or removes a `NOT NULL`
constraint on a column. `change_column_default` changes the default value of a
column.

Note that the **change_column command is irreversible**.

Usage:

```ruby
change_column :table_name, :column_name, :string
change_column_null :table_name, :column_name, false
change_column_default :table_name, :column_name, from: true, to: false
```

- **change_table**

Description: Used to add or remove columns, rename existing columns, change the
datatype of columns, add indices to columns, etc, all in one block.

Usage:

```ruby
change_table :table_name do |t|
  t.remove :column_1, :column_2
  t.string :column_to_change_datatype
  t.index :column_to_add_index
  t.rename :column_old_name, :column_new_name
end
```

- **create_table**

Description: To create a new table specifying its columns and constraints. As
discussed earlier `t.timestamps` creates two columns `created_at` and
`updated_at`.

Usage:

```ruby
create_table :table_name do |t|
  t.string :column_1
  t.text :column_2
  t.timestamps
end
```

- **drop_table**

Description: Drops a table from the database.

The two main options that this command takes in are:

- `:force`

Set to `:cascade` to drop dependent objects as well. Defaults to `false`.

- `:if_exists`

Set to `true` to only drop the table if it exists. Defaults to `false`.

Usage:

```ruby
drop_table :table_name, :options
```

- **remove_column**

Description: Removes an existing column from a table.

Usage:

```ruby
remove_column :table_name, :column_name
```

- **remove_index**

Description: Removes a previously added column index from a table. We can supply
`if_exists: true` as an additional parameter to suppress error when trying to
remove non-existent indices.

Usage:

```ruby
remove_index :table_name, :column_name
remove_index :table_name, :column_name, if_exists: true
```

- **rename_column**

Description: Renames a single column of specified table.

Usage:

```ruby
rename_column :table_name, :old_column_name, :new_column_name
```

## Seeding initial data

Most of the time we need some basic essential data in our database for our
application to start. We want such data to be fed to the database during its
initialization.

This process of initializing a database with basic data is called seeding. Rails
provides a seeding mechanism that we can use to insert data during database
setup.

To see it in action, open the file `db/seeds.rb` and add the following content
to it:

```ruby
oliver = User.create(
  name: "Oliver",
  email: "oliver@example.com",
  password: "welcome",
  password_confirmation: "welcome"
)

Task.create(
  title: "Initial task.",
  assigned_user_id: oliver.id,
  task_owner_id: oliver.id
)
```

Now, try resetting the database. **Warning:** This will clear all the data in
your database.

Run the following command to delete and rebuild the database from schema:

```bash
bundle exec rails db:reset
```

The above command is a shortcut of running all these four commands sequentially:

```bash
bundle exec rails db:drop
bundle exec rails db:setup

# where db:setup runs the following:
# bundle exec rails db:create
# bundle exec rails db:schema:load
# bundle exec rails db:seed
```

Now, if you start the application, we can log in with the username:
`oliver@example.com` and password: `welcome` without registering any such user
manually. Also, you can see a task assigned to Oliver, when you first log in to
this account.

## Internals of migrations and schema loads

As you have already seen, the file names of every Rails migration script start
with a number. It is actually a timestamp representing the time at which that
file was created. Rails calls this timestamp number, the **version** of the
migration script.

Rails uses an internally managed table in our database named `schema_migrations`
to track which all migrations have been executed. It contains a single column
and it stores the versions of all migrations scripts that have been executed.

Whenever we run `bundle exec rails db:migrate`, Rails checks the
`schema_migrations` table for all executed migrations and then checks versions
of all files in the `db/migrate` folder. All the files whose version doesn't
exist in `schema_migrations` will be executed in ascending order of their
versions specified in filename.

We have one more auto-generated file which keeps track of the executed
migrations, that is the `db/schema.rb` file.

Whenever we run `bundle exec rails db:migrate`, Rails goes through the whole
database structure and rewrites `schema.rb` with one big Rails migration script
equivalent of that structure. Also, it copies the version of the last created
migration script to `schema.rb`.

Since `schema.rb` regeneration is independent of the executed script, any
changes we have made manually to the database structure prior to the execution
of migration script will also be reflected in `schema.rb`.

We can manually request a `schema.rb` regeneration using the command
`bundle exec rails db:schema:dump`.

### Significance of schema file

As we have discussed earlier, when initializing a new database, we can use this
file to bypass executing all the migrations one by one.

If we run the command `bundle exec rails db:schema:load`, then Rails will
execute the migration script defined in `schema.rb` and thus initialize the
database structure in one go.

Running `bundle exec rails db:schema:load` also marks all of the migration files
preceding the one specified in the `schema.rb` as executed. This is done by
adding their version to the `schema_migrations` table.

To be specific, Rails compares the timestamp specified in the `schema.rb` with
the timestamps of all migration files and everything that is prior to the
`schema.rb` timestamp is added to the table.

In effect, even though we took a shortcut and didn't run any migrations at all,
we marked all of those scripts as executed. So we won't be running them again.
Only the newly added migration scripts will be executed when we run
`bundle exec rails db:migrate` from now on.

Note that `bundle exec rails db:schema:load` only loads the structure of the
database. It won't run `bundle exec rails db:seed` internally for us. If we have
data to seed, we will have to run `bundle exec rails db:seed` manually after
loading schema.

Since Rails migrations can't express some of the advanced SQL features like
exclusion constraints, partial indices, triggers, stored procedures, etc, they
won't be saved to the `schema.rb` file and thus won't be restored when we run
`bundle exec rails db:schema:load`.

So, if we are using such database features in our migration scripts using raw
SQL, then we will have to refrain from initializing our database using
`bundle exec rails db:schema:load` command.

## Bulk mode migrations

Altering an existing table in the following way is a bad idea:

```ruby
def change
  add_column :users, :first_name, :string
  add_column :users, :last_name, :string
  add_column :users, :phone_number, :string
end
```

This is because each of the queries is performed separately, even if it is done
on the same table. Rails translates the above script to the following SQL:

```sql
ALTER TABLE `users` ADD `first_name` varchar(255);
ALTER TABLE `users` ADD `last_name` varchar(255);
ALTER TABLE `users` ADD `phone_number` varchar(255);
```

But, MySQL and PostgreSQL support combining these queries to a single SQL as
shown below:

```sql
ALTER TABLE `users`
  ADD `first_name` varchar(255),
  ADD `last_name` varchar(255)
  ADD `phone_number` varchar(255);
```

Both methods do the same thing, that is, adding three columns to an existing
table.

In the database world, executing a single query is much faster than executing
three individual queries one by one even though their results are the same. This
is because of the optimizations the DB engines can perform when executing
operations in batch.

In this case, each of these queries takes almost the same amount of time to
complete. That makes the first group of SQL statements three times slower in
comparison with the second SQL statement.

Since we will have to keep the server down while running migrations, this is
quite a large saving in time, at least for production servers with large
databases.

To achieve the same effect in rails migrations we can bring all these three
alterations under a single `change_table` method and enable bulk mode. Our
previous example can be re-written as follows in bulk mode:

```ruby
def change
  change_table :users, bulk: true do |t|
    t.string :first_name
    t.string :last_name
    t.string :phone_number
  end
end
```

There is a rubocop rule that enforces bulk mode in table altering migrations.
You can refer to details of the cop
[here](https://www.rubydoc.info/gems/rubocop/0.61.1/RuboCop/Cop/Rails/BulkChangeTable).

All changes we have made in this chapter were for demonstration only. We do not
need to commit them. To clear the changes run this command:

```bash
git reset --hard HEAD
```
