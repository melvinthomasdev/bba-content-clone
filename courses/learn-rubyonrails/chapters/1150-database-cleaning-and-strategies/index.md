## When to clean the database?

Database cleaning is often required during application development and testing.
During development you might need to clean the database and seed it back with
sample data because the data might have gone corrupt or while testing you want
to clean your database after each test, so that the next test can start from a
clean slate.

Keep in mind that you should never clean your database in production. Imagine
the catastrophe that would occur if someone at Facebook ran a command by mistake
that cleaned their entire database or even some part of it.

There are various strategies that you can employ to clean the database. In the
next section we will take a look at these strategies.

## Database cleaning strategies

There are three commonly used database cleaning strategies namely `transaction`,
`truncation` and `deletion` strategies. Let's take a brief look at each of these
strategies:

1. `transaction` strategy - This strategy essentially means that the database
   transactions are rolled back. This means using SQL `BEGIN TRANSACTION`
   statement coupled with `ROLLBACK` to roll back a sequence of previous
   database operations. This strategy is the fastest since changes need not be
   directly committed to the Database. This strategy should be used in the
   `test` environment.

2. `truncation` strategy - The `truncation` strategy cleans the database by
   emptying the tables entirely without deleting the table structure itself or
   deleting records individually. It uses the SQL `TRUNCATE TABLE` statement. It
   locks the entire table which prevents other transactions from going through
   while truncation is in process. This should be used in the `development`
   environment.

3. `deletion` strategy - This means the database tables are cleaned using the
   SQL `DELETE FROM` statement. It works by deleting the records row-wise. This
   is usually slower than truncation and transaction strategies.

## Database cleaner gem

At Bigbinary we use the `database_cleaner` gem for cleaning the database.
`database_cleaner` is a set of gems containing strategies for cleaning your
database in Ruby.

You can install the `database_cleaner` gem in your project just like any other
gem by adding it to the `Gemfile` and running the `bundle install` command.

It supports all three database cleaning strategies that we discussed in the
previous section. For example, once this gem is installed, you can use it to
clean your database using the `transaction` strategy like so:

```ruby
def clean_database
  DatabaseCleaner.clean_with :transaction
end
```

In the above example, when `clean_database` method gets invoked, it will call
the `DatabaseCleaner` and employ the `transaction` strategy for cleaning the
database.

**Warning:** When you invoke this `clean_database` method, it will actually
clean the database without waiting for any confirmation.

You can also specify the database cleaning strategy at the top of you module and
then call the `clean` method on `DatabaseCleaner` like so:

```ruby
Database_cleaner.strategy = :transaction

def clean_database
  DatabaseCleaner.clean
end
```

The `database_cleaner` gem also provides various customization options. For
example, if you are using the `truncation` strategy to clean your database, you
can provide the table names to be truncated as options like so:

```ruby
def clean_database
  DatabaseCleaner.clean_with :truncation, only: %w[tasks]
end
```

In the above example, `DatabaseCleaner` will only truncate the `tasks` table.

For more information on the `database_cleaner` gem and how to use it
effectively, you can refer to its
[official documentation](https://github.com/DatabaseCleaner/database_cleaner#database-cleaner).

## Cleaning database in production

Strictly refrain from doing any database cleaning in the production environment
unless and until your tech lead has given explicit permission to do so.

There can be valid cases in the production environment where we need to clean
the existing data. An example is maintaining a fresh state of the database at
the end of the day. For doing that we most probably will have to clean the
database and seed default data.

In such cases too our `database_cleaner` gem comes in handy. But it has some
safeguards which prevent it from running in production. We have to explicitly
allow it to clean in production environment. To do so, set the following as
config variables in Heroku, from `Settings > Config Vars`

```ruby
DATABASE_CLEANER_ALLOW_PRODUCTION=true
DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL=true
```

If the `DATABASE_CLEANER_ALLOW_PRODUCTION` variable is set to true, then it
allows the `database_cleaner` to clean the database in production and the
`DATABASE_CLEANER_ALLOW_REMOTE_DATABASE_URL` variable when set to true, allows
`database_cleaner` gem to connect with the remote `PostgreSQL` database.

For more information of safeguards that you can use with the `database_cleaner`
gem, please refer to the
[official documentation](https://github.com/DatabaseCleaner/database_cleaner#safeguards).

**This is an in-depth chapter and hence you do not need to commit any of these
changes.**
