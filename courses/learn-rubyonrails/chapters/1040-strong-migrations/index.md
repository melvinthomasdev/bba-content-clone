In this chapter, we will see what strong migrations are and how they can help in
building a reliable application. We will first learn about dangerous migrations
and the detrimental effects they can have on business operations. Eventually, we
will look at a gem called `strong_migrations` that will enable us to write
reliable migrations.

## Consequences of Dangerous migrations

At this point, you might already know what migrations are. In a nutshell,
migrations are a feature of Active Record that allows you to evolve your
database schema over time. Developers often tend to overlook how dangerous
migrations can be if they are not planned and executed carefully. There are
several potential risks and challenges that can arise during a migration,
including:

- **Data loss**: If data is not properly backed up and transferred during a
  migration, it can be lost or corrupted.
- **Downtime**: They can cause disruptions to business operations if they are
  not properly managed.
- **Compatibility issues**: Migrations can sometimes result in compatibility
  issues with existing systems and processes.
- **Security risks**: Migrations can expose an organization to security risks if
  they are not properly secured.

The above facts reinforce the need for well-written migrations which can
potentially save the organization a large amount of time and money during
maintenance.

## Downtime

Among the risks associated with migrations, let us take a look at the concept of
downtime. Downtime refers to a period of time during which a system, service, or
application is unavailable or not functioning correctly. Downtime can have
significant consequences for businesses, as it can result in lost revenue,
reduced productivity, and decreased customer satisfaction. It is important for
businesses to minimize downtime and ensure that their systems and services are
as reliable and available as possible. So it stands to reason for an
organization to enforce a minimal downtime policy.

Now, let us assume we have a PR that consists of some hefty migrations. Consider
the PR is merged and we are set to run our migrations in the production
environment. While running these time-consuming migrations in the production
environment, the tables associated with each operation can be rendered
irresponsive to read and write queries, hence contributing to the downtime of
the application.

But why are read and write queries blocked in the first place? The answer boils
down to two concepts in Database Management Systems: `transactions` and `locks`.
Transactions refer to a set of operations that are executed as a single unit,
either all completed successfully or all being rolled back if any of the
operations fail. Transactions use locks to control concurrent access to data.
Locks in a database are used to protect data integrity and consistency by
preventing multiple transactions from accessing and potentially modifying the
same data simultaneously. This is why some operations will be blocked while
running migrations. There are several types of locks that can be used in a
database, including `exclusive locks`, `shared locks`, `update locks`, and
`intent locks`.

It should be noted that Rails will run your migrations inside a transaction if
your database supports it. So while running the migrations, tables might be
locked down by the operations within your migrations hence rendering other
operations, using the same table, unprocessable.

This is just one type of dangerous migration. We will see more of these
dangerous migrations in a later section.

## Detecting unsafe migrations

We just saw a case where a dangerous migration can prove to be harmful to our
application. As a workaround, we could use the techniques that we will discuss
in the next section. But it can be time-consuming and often require the
developers to self-inspect whether the migration they've written is dangerous or
not.

Wouldn’t it be easier if there was someone to tell you whether a migration is
dangerous or not each time you try to migrate? That is exactly what the
`strong_migrations` gem does. Its purpose is to let you know that you’re running
an unsafe migration and instruct you on what you can do to make it better.

To use this gem, you can add the following line to your application’s Gemfile:

```bash
gem "strong_migrations"
```

Afterward, you can run the below commands to complete the setup.

```bash
bundle install
rails generate strong_migrations:install
```

Now every time you try to run an unsafe migration, you will be warned of the
same. Please note that this does not happen when you try to run raw SQL queries.
Strong Migrations cannot ensure safety for raw SQL statements. In case you have
to execute raw SQL statements in your migrations, then it's better to explicitly
assure its safety, like so:

```rb
class ExecuteSQL < ActiveRecord::Migration[7.0]
  def change
    safety_assured { execute "..." }
  end
end
```

## Dangerous migrations and their corresponding checks

In this section, we will see examples of some unsafe migrations and explore the
reason why they are unsafe. We will also see how we can make them safe.

### Adding a column with a default value

Let us see how we normally tend to perform migration for this operation.

```rb
class AddSomeColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :some_column, :text, default: "default_value"
  end
end
```

The problem with the above code is that when a column is added, an
`access exclusive` lock is made on the table preventing it from being used by
other operations. Now while adding a column with a default value, the latter
will have to be propagated across all the rows in the table which can be
time-consuming. This means that during the entire time, read and write queries
on the table will be blocked.

In earlier versions of Postgres, MySQL, and MariaDB, adding a column with a
default value to an existing table caused the entire table to be rewritten.
However, In Postgres 11+, MySQL 8.0.12+, and MariaDB 10.3.2+, this no longer
requires a table rewrite and is safe, except for volatile functions like
gen_random_uuid().

A safe approach to this migration would be to add the column without a default
value and then change the default.

```rb
class AddSomeColumnToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :some_column, :text
    change_column_default :users, :some_column, "default_value"
  end

  def down
    remove_column :users, :some_column
  end
end
```

We already saw that Active Record creates a transaction around each migration.
So one should avoid back-filling, like using the `update` command, in the same
transaction that alters a table since it keeps the table locked for the duration
of the backfill. If necessary you can use `disable_ddl_transaction!` within the
migration to prevent it from being wrapped by a transaction.

### Changing the type of the column

This one is similar to adding a column with a default value, i.e, during the
entirety of the operation, the lock on the table prevents read and/or write
operations on that table.

So a code like the one given below would not suffice.

```rb
class ChangeSomeColumnType < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :some_column, :new_type
  end
end
```

A better way would be to:

1. Create a new column
2. Write to both columns
3. Backfill data from the old column to the new column
4. Move reads from the old column to the new column
5. Stop writing to the old column
6. Drop the old column

### Removing a column

The migration for removing a column might be straightforward.

```rb
class RemoveSomeColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :some_column
  end
end
```

While it seems tempting to use the above code, it in fact is a dangerous
migration. This is because Active Record caches database columns at runtime. So
if a user tries to insert a tuple into that table while the migrations are being
run, it would throw an exception since the column has actually been removed.
This error will persist until the application is rebooted after the migrations’
completion.

A better version for removing a column would be to:

1. Tell Active Record to ignore the column from its cache

```rb
class User < ApplicationRecord
  self.ignored_columns = ["some_column"]
end
```

2. Deploy the code
3. Write a migration to remove the column (wrap in safety_assured block)

```rb
class RemoveSomeColumnFromUsers < ActiveRecord::Migration[7.0]
  def change
    safety_assured { remove_column :users, :some_column }
  end
end
```

4. Deploy and run the migration
5. Remove the line added in step 1

A safer approach is to ensure that the column we wish to drop is not in use in
the application.

### Renaming a column

Renaming a column is similar to the case of removing a column in the sense that
both face issue of the app not being able to reload during migrations. As a
result, the queries raised during the migration end up using the cached values
which contradict the actual database state, raising exceptions. But the solution
here is not similar to the former case since we cannot just deploy the code that
uses a new column name that is not available yet.

A safer approach is to:

1. Create a new column
2. Write to both columns
3. Backfill data from the old column to the new column
4. Move reads from the old column to the new column
5. Stop writing to the old column
6. Drop the old column

### Renaming a table

The conventional code to rename a table might look like this:

```rb
class RenameUsersToCustomers < ActiveRecord::Migration[7.0]
  def change
    rename_table :users, :customers
  end
end
```

Renaming a table is something we must try to avoid entirely. However, if it is
absolutely necessary you might run into the same problems one might face while
renaming a column.

A safer approach is to:

1. Create a new table
2. Backfill data from the old table to the new table
3. Move reads from the old table to the new table
4. Stop writing to the old table
5. Drop the old table

### Adding a check constraint

For adding a check constraint one might most likely resort to the below
migration.

```rb
class AddCheckConstraint < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :users, "price > 0", name: "price_check"
  end
end
```

But as you might have guessed, this is a dangerous migration. Let us see why in
the context of the Postgresql database.

For the above code snippet, the operation performed by Postgresql can be divided
into two steps:

1. Adding a check constraint and enforcing it for all new `insert/update`
   statements. This operation requires an `access exclusive` lock. No validation
   is done in this step.
2. Checking all existing rows to verify they conform to the specified
   constraint. Validation requires a `row share` lock on the reference table
   which will block any operations requiring exclusive locks while validating
   the constraint.

As you can see, the validation can make the tables associated with the check
constraint irresponsive to certain queries for a reasonable amount of time.

An obvious better approach would be to add the check constraint without
validating existing rows in the migration.

```rb
class AddCheckConstraint < ActiveRecord::Migration[7.0]
  def change
    add_check_constraint :users, "price > 0", name: "price_check", validate: false
  end
end
```

The validation can then be done in a separate migration.

```rb
class ValidateCheckConstraint < ActiveRecord::Migration[7.0]
  def change
    validate_check_constraint :users, name: "price_check"
  end
end
```

Note that this approach is recommended only for Postgresql. Let us explore some
more dangerous migrations pertaining to the Postgresql database.

- **Adding an index**: In Postgres, adding an index non-concurrently blocks
  writes. Hence it is always advised to add indexes concurrently.
- **Adding a reference**: Rails adds an index non-concurrently to references by
  default. This means that it will run into the same problems as in the case of
  adding an index. So make sure to add the index concurrently while adding a
  reference.
- **Adding a foreign key**: This is similar to the case of adding a check
  constraint. It prevents writes when validation is performed as a part of
  adding a foreign key. Hence a safer approach would be to add the foreign key
  without validating existing rows and then validate them in a separate
  migration.
- **Setting `NOT NULL` on an existing column**: In Postgres, setting `NOT NULL`
  on an existing column blocks reads and writes while every row is checked. A
  safer approach is to resort to check constraint to perform this operation.
- **Keeping non-unique indexes to three columns or less**: Adding a non-unique
  index with more than three columns rarely improves performance. Instead, start
  an index with columns that narrow down the results the most.

There are more concepts related to strong migrations in the context of the
Postgresql database. You can refer to the official
[docs](https://github.com/ankane/strong_migrations#checks) to learn more about
it.

### Backfilling data

We already saw that Active Record creates a transaction around each migration.
So one should avoid backfilling, like using the `update` command, in the same
transaction that alters a table since it keeps the table locked for the duration
of the backfill. If necessary you can use `disable_ddl_transaction!` within the
migration to prevent it from being wrapped by a transaction.

### Creating a table with the force option

It is strongly advised not to create tables with the `force` option since it can
drop an existing table. If you intend to drop an existing table, run
`drop_table` first.

In summary, we saw why strong migrations are important and how you can replace
potentially dangerous migrations with their corresponding checks. You can read
more about the checks that the gem `strong_migrations` offers in their official
[docs](https://github.com/ankane/strong_migrations).

## References

- https://github.com/ankane/strong_migrations
- https://medium.com/paypal-tech/postgresql-at-scale-database-schema-changes-without-downtime-20d3749ed680
