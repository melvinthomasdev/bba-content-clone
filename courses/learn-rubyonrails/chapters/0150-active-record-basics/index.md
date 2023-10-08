## Object Relational Mapping (ORM)

Let's say that we have a `tasks` table in the database and we have to get a list
of all active tasks. If we are using `node.js` or other similar technology then
we would need to write SQL something similar to this:

```ruby
select * from tasks where status = "active"
```

In the Rails world we have more options. We can still write that SQL but most
likely we will write code like this:

```ruby
> Task.where(status: "active")
```

As we can see this is closer to the English language and it's easier to follow
and it's easier to write.

Here we are connecting the table `tasks` to the model `Task`. This technique of
connecting the objects of an application to tables in a relational database
management system is called Object Relational Mapping or in short ORM.

ORM makes our code clean, short, and expressive. It protects us from SQL
injection attacks. It also helps to reduce overall development time because it
lowers common SQL anti-patterns and the bugs it might introduce.

The best part of ORM is that most of the frameworks that support it are
database-independent. i.e. we can use SQLite as the development database and
PostgreSQL as the production database with the same code. We don't need to worry
about the differences in SQL syntax between these engines.

But like every other thing on earth, ORM has got some disadvantages too. It is
comparatively slower than native SQL when the number of round-trips with the SQL
server is a bottleneck. Also, methods provided by the ORM framework won't be
enough to fully replace complex SQL queries.

But the above mentioned disadvantages are negligible comparing to the advantages
it has in most cases. Writing raw SQL queries should be only be the last resort
and that too only when you can't perform the same operation using ORM.

## What is Active Record?

Active Record is sub-system of Rails that is responsible for representing
business data, logic and the dealings with the database.

`ActiveRecord::Base` is a Rails class that contains several helper methods that
facilitates the creation and management of objects from databases. This class
encapsulates all the low-level stuff and helps us to deal with data as if they
were plain Ruby objects.

The classes that inherit `ActiveRecord::Base` directly or indirectly are called
"models". In other words, `model` is a simple Ruby class that is used to
represent data in the database table.

Each column in the table corresponds to a field in the `model` and each row
represents an instance of the `model`.

By convention, every `model` class inherits a common superclass defined by us
named `ApplicationRecord`. We add configurations that are globally required for
all models in our project inside the `ApplicationRecord` class. Also,
`ActiveRecord::Base` will be the superclass of `ApplicationRecord`.

This inheritance enables us to use all methods defined in `ActiveRecord::Base`
as well as `ApplicationRecord` in all our models.

We will learn more about a model and its mapping with database, in the upcoming
chapters.

## Naming conventions

By default, Active Record uses naming conventions to map between "models" and
database tables. Rails pluralizes the class name for finding out the table it
should be mapped with. i.e. class `Book` will be mapped to `books` table.

A model represents a single book, whereas a database table consists of records
of several books. That is the reason why model names are singular and table
names are plural.

Rails uses
[Inflector](https://api.rubyonrails.org/classes/ActiveSupport/Inflector.html) to
pluralize the class names. It is a clever mechanism that even pluralizes
`Person` to `People`.

When there is more than one word in the class name, the camel case is converted
to snake case (words separated by underscores). For example, model class
`ShippingAddress` will be mapped to table `shipping_addresses`.

## Overriding table names

In real life, we might end up in situations where we need to map the model to a
table with a non-matching name.
Typically, this will happen when a database is shared by two applications. Both
the applications would prefix the names of their tables with some keyword to
avoid collisions. But we don't need that prefix in the name of our models.

If the table name of the `Task` model is `app_tasks`, we will specify it in our
model definition like this:

```ruby
class Task < ApplicationRecord
  self.table_name = "app_tasks"
end
```

We will be learning more about model definitions in the next chapter.

## Schema conventions

Active Record uses some conventions in column names too. These conventions are
used to identify the purpose of those columns.

### Foreign keys

Foreign keys are used to connect one table to another. For example, in an
e-commerce application, every order is associated with a user. Therefore
`orders` table will have a column `user_id` which is the `id` of the user in the
`users` table.

The column holding foreign key should be named using the
`singularized_table_name_id` format. In our case, it will be `user_id`. This
helps Rails connect between the `Order` model and `User` model in an ORM way.

### Primary keys

Primary keys are used to uniquely identify rows in a table. Primary keys will be
unique as well as non-null in most database engines. Since they are
automatically indexed, querying using primary keys is super-fast.

By default, Active Record will use an integer column named `id` as the table's
primary key. This will be automatically created when using Active Record
Migrations for creating tables.

### Special columns

If the column name is `created_at` or `updated_at` then it has a special
significance for Active Record.

Active Record will try to automatically populate `created_at` when that record
is created. Similarly when a record is updated then Active Record will try to
automatically update the `updated_at` column.

But this is not the case all the time. There are some cases like `upsertion`,
where Active Record won't automatically populate a value for these special
columns.

In such situations we can add a migration to add default values for these
columns. For example:

```ruby
class AddDefaultTimestampValuesOnTableName < ActiveRecord::Migration[7.0]
  def change
    change_column_default :table_name, :created_at, from: nil, to: -> { "CURRENT_TIMESTAMP" }
    change_column_default :table_name, :updated_at, from: nil, to: -> { "CURRENT_TIMESTAMP" }
  end
end
```

The official Rails guide on Active Record has a section on
[Convention over Configuration](https://guides.rubyonrails.org/active_record_basics.html#convention-over-configuration-in-active-record).
Please read that article.

We haven't made any changes in our project. So there is nothing to commit in this chapter.