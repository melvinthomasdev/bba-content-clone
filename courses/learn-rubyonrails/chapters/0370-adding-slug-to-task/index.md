So far, we have added the ability to display the list of tasks in the front-end
side. Next task would be clicking on one of the tasks and showing more details
about that task.

To show more details about a task, the application needs to fetch these details
from the database.

The question is how would the database know which task details are being
requested for. The most common solution to this problem is having a URL which
looks like this `http:localhost:3000/tasks/1`. This will get the job done, but
it exposes the primary key of the task to anyone who views the network request
or the URL. Here the value "1" in URL denotes the "id" of the task.

Some details, like how many records we have in our database for a particular
entity or what is the human readable ID of an entity in database, etc, shouldn't
be exposed to the public. In the above case, since we are using the `id` of a
task in the URL, anyone who has access to the URL will be able to figure out the
confidential information.

To solve this problem we need to add a unique identifier to each task and it can
be used to query details of a particular task via HTTP requests.

These unique identifiers are typically called "slug". In this chapter we will
learn how to add a slug for each of the tasks.

## What is a slug?

A slug is the part of a URL that identifies a page in human-readable keywords.

A well-defined slug can also help with SEO(search engine optimization).

An URL like `https://example.com/articles/357` is not very SEO friendly. However
if the URL looks like
`https://example.com/articles/deploying-nextjs-application-to-netlify`, then
it's very SEO friendly.

Rails, by default, uses integer based IDs in URLs to access resources. For
example Rails would create `/tasks/1` out of the box.

But that's not quite what we want!

## Generating a slug to use in the URL

The slug generation process depends on the business logic of the project. For
instance, the slugs could be automatically created whenever a new task is added.
Or the admins might need to add it manually.

In any case, the slug needs to be stored in the database along with the other
attributes.

Let's generate a migration to add slug attribute in our tasks table:

```bash
bundle exec rails generate migration AddSlugToTask
```

Add the following lines to the generated migration file:

```ruby
class AddSlugToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :slug, :string
  end
end
```

It will add a column named `slug` in our tasks table once we apply this
migration.

Run the following command to apply the migration:

```bash
bundle exec rails db:migrate
```

## Unique indexes and why we use them

An index is a database structure which stores the values of a column in a
specific order. It contains keys or records built from a column of the
corresponding table.

When you query a record, the database goes to that index first and finds a
reference of the record and then retrieves the corresponding table records.

It is relatively quicker to retrieve an index from the database than to retrieve
a record since indexes are ordered. This can speed up the query process.

While it stands to reason to use an index for speeding up read operations, it
has its downside as well. Unnecessary usage of the index can slow down write
operations like `insert` and `update`. Additionally, if a column, whose values
change frequently, is used for forming a clustered index, then it can further
slow down operations. This is because the records would have to be reordered
after each update of the column value. Columns that store large data are also
not ideal for adding index since they can be highly inefficient.

Now that we have seen what an index does, let us see how an index is different
from a unique index. A unique index is a type of index that ensures that the
indexed column contains only distinct values. This is useful for ensuring that
the data in the table remains consistent and correct, as it prevents duplicate
values from being entered into the table.

One key difference between an index and a unique index is that a unique index
prevents duplicate values from being entered into the indexed column, whereas a
regular index does not. This means that a unique index can be thought of as a
type of constraint that helps to maintain the integrity of the data in a table.

So if we want to enforce data integrity constraints while optimizing the
performance of read operations, a unique index would be the right choice.

Since a slug is a unique identifier for a task it makes sense to add a unique
index for the slug column. By default, non-distinct values are allowed for the
columns used for indexing. So to enforce unique constraints we need to
additionally pass options specifying `unique: true`.

Before we do so, let's consider a hypothetical case where slugs are not unique.
We mean hypothetical because in a database with proper constraints, such records
will not exist.

Let's use the Rails console to create a new task with a slug:

```bash
irb(main):001:0> Task.create(title: "Buy groceries", slug: "buy-groceries")
```

Running the above command will give the following output:

```bash
=> #<Task id: 1, title: "Buy groceries", created_at: "2021-07-01 00:37:11", updated_at: "2021-07-01 00:37:11", slug: "buy-groceries">
```

Let's create another task with the same slug as the last task:

```bash
irb(main):002:0> Task.create(title: "Pay phone bill", slug: "buy-groceries")
```

Running the above command will give the following output:

```bash
=> #<Task id: 2, title: "Pay phone bill", created_at: "2021-07-01 00:49:37", updated_at: "2021-07-01 00:49:37", slug: "buy-groceries">
```

We have successfully created two different tasks in our database with the same
slug. But slugs are supposed to be unique since each slug is meant to be a
unique identifier for a task.

Having duplicate slugs defies the whole purpose of having a slug and that is why
we should have constraints in our application to prevent such records from
existing in our database.

Let's fix this by adding the following line into the Task model:

```ruby {9}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true
end
```

The `uniqueness` validation allows us to make sure that `slug` attribute's value
is unique before it gets saved.

## Race conditions

Let's see if adding a `uniqueness` validation in the model is good enough.
Consider an application with a `User` model. `User` model consists of an email
attribute which is supposed to be unique. Hence, a `uniqueness` validation is
present for the email attribute inside the model.

Now, two users, Oliver and Eve, are trying to signup for the application at the
same time using the same email. This is a very likely scenario in a large scale
system with millions of users.

When the signup request from Oliver arrives, uniqueness helper method will
validate that the attribute's value is unique only right before the object gets
saved.

It first queries the table to fetch any records that have the same attribute
value for which an `uniqueness` validation is present, using the `SELECT`
statement, and then attempts to insert a row if no matching records are found.
This is also known as `check and then act`.

This however, creates a timing gap between the `SELECT` and the `INSERT`
statements that can cause problems.

The problem will arise when in between the duration of the uniqueness check for
Oliver's request and record creation, Eve makes a signup request with the same
email.

If the processing time of both requests overlap, then the `SELECT` statement
would return null for Eve's request, meaning no records found, and based on
that, try to perform `INSERT` operation, without realising there already exists
a record with same value.

In the end, we will end up with two rows having the same value in database, thus
failing the uniqueness validation.

This is called a `Race condition`.

A `race condition` is an undesirable situation that occurs when a device or
system attempts to perform two or more operations at the same time, causing
negative outcomes as opposed to the case when these processes are executed
synchronously.

## Handling race conditions

From the previous example we can conclude that validation at Rails level is not
enough to ensure database integrity. Our application's task API is still prone
to `race condition` even after we have added `validates :slug, uniqueness: true`
in the Task model.

To prevent this, we need to add a unique constraint at the database level. Once
a unique constraint is added, database automatically creates a unique index to
enforce the uniqueness requirement.

When a database transaction is initiated, database examines the existing data
for columns with a unique constraint in their respective indices to make sure
all values are unique. If the values are not unique then database will return an
error message.

Therefore, after adding a unique constraint, we could monitor for failure
scenarios by catching the `ActiveRecord::RecordNotUnique` exception and send
back our custom error message. This strategy works as a very strong defence
against `race conditions`.

## Adding a unique constraint in database

Let's generate a migration to make `slug` unique at the database level.

```bash
bundle exec rails generate migration AddUniqueIndexForSlug
```

Add the following lines of code to the generated migration file:

```ruby
class AddUniqueIndexForSlug < ActiveRecord::Migration[7.0]
  def change
    add_index :tasks, :slug, unique: true
  end
end
```

Adding a unique constraint on database level will also `handle race conditions`.
We will be discussing about it in the
[handling race conditions section](#handling-race-conditions).

Do you think running the above migration will raise any errors? Take a moment to
think it through from the perspective of the current state of your database.

Let's apply the migration and see what happens:

```bash
bundle exec rails db:migrate
```

Running the above command will throw the following error:

```bash
== 20210701005815 AddUniqueIndexForSlug: migrating ============================
-- add_index(:tasks, :slug, {:unique=>true})
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

SQLite3::ConstraintException: UNIQUE constraint failed: tasks.slug

Caused by:
ActiveRecord::RecordNotUnique: SQLite3::ConstraintException: UNIQUE constraint failed: tasks.slug
```

Error occurred due to the fact that our database contains two different tasks
with the same slug.

It is evident from the example that for a unique index to exist, the values of
slugs should also be unique and the migration above will ensure the same.

To conclude, the above migration could not be applied as it would have created
an inconsistency between the database constraints and the records present.

To fix this, we should delete the records that are causing this inconsistency.

To avoid duplicate slugs and slug inconsistencies, we can delete all the tasks
from our database.

Run the following command in the Rails console:

```bash
irb(main):003:0> Task.delete_all
```

Here we have used the `delete_all` method. But there are other methods like
`destroy_all` which would have also got this job done.

We will be discussing more about these methods in the
[destroy vs delete section](/learn-rubyonrails/adding-comments-to-tasks#delete-vs-destroy-methods).

We have deleted the records that were causing the above error, let's run the
following command to apply the migration:

```bash
bundle exec rails db:migrate
```

And it will show the following output:

```text
== 20210701005815 AddUniqueIndexForSlug: migrating ============================
-- add_index(:tasks, :slug, {:unique=>true})
   -> 0.0031s
== 20210701005815 AddUniqueIndexForSlug: migrated (0.0032s) ===================
```

Above migration will add a unique index containing ordered values from the
`slug` column in our `tasks` table.

Now even if two or more requests tries to `INSERT` the same value of `slug` in
the `Task` table, it will throw `ActiveRecord::RecordNotUnique` exception. We
can catch that exception and handle it accordingly.

It is important to note that, handling `ActiveRecord::RecordNotUnique` exception
will be different for emails and slugs.

For attributes whose value is provided by the user, like an email field, we
should notify the user that the value entered is not unique and prompt them to
enter a new unique value.

Whereas for an attribute like slug, where the value is generated by application,
we need to handle the exception and generate a unique value.

We also need to change routes to make use of `slug` instead of `id` on task
resource route. By default, Rails uses the `:id` identifier to denote the
dynamic routes for a resource. For example, by default for a route with the
pattern `/tasks/:slug`, the value of slug will be available to the controller
using `params[:id]`, which can cause confusion as we already have an `id` field
in the Task model and since `slug` is actually not the `id` of a table.

To avoid this confusion, Rails lets us override the default name by using
`param` like this:

```ruby
resources: tasks, param: :identifier_name
```

After we override the param identifier name, we can use it in our controller
action like this:

```ruby
def show
  @task = Task.find_by(identifier_name: params[:identifier_name])
end
```

Open `config/routes.rb` and make the necessary change:

```ruby {2}
Rails.application.routes.draw do
  resources :tasks, only: :index, param: :slug
end
```

Now the value for `slug` will be available to our controller actions in
`params[:slug]`.

## Adding a null constraint for slug

Let us take another hypothetical example of a task which doesn't have any value
in its `slug` column.

In Rails console, run the following command to create such a task.

```bash
task = Task.create(title: "Dummy task")
```

Running the above command will give the following output:

```bash
=> #<Task id: 1, title: "Dummy task", created_at: "2021-07-01 00:50:34", updated_at: "2021-07-01 00:50:34, slug: "nil">
```

We can see from the output of task creation command that the value of `slug` in
newly created task record is `nil`.

This isn't correct however. Having a null value in the `slug` column again
defeats the purpose of having a slug.

We should make sure that the value of `slug` shouldn't be null. Let's create
another migration to make sure slugs are not nullable:

```bash
bundle exec rails generate migration MakeSlugNotNullable
```

Add the following lines of code to the generated migration file:

```ruby
class MakeSlugNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :slug, false
  end
end
```

Let's apply the migration now, to migrate the changes to database:

```bash
bundle exec rails db:migrate
```

Running the above migration will throw an error similar to the one in the
following output:

```bash
== 20210701012247 MakeSlugNotNullable: migrating ==============================
-- change_column_null(:tasks, :slug, false)
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

SQLite3::ConstraintException: NOT NULL constraint failed: tasks.slug

Caused by:
ActiveRecord::NotNullViolation: SQLite3::ConstraintException: NOT NULL constraint failed: tasks.slug
```

An error has occurred because we have task records in our database which don't
have any value in the slug column.

Here we are trying to apply a migration that will constraint the `slug` column
from having a `null` value. If we want to successfully apply this migration,
then there shouldn't be any records in our database which has a null slug
column.

But the current state of our database is not in a favorable situation for
applying this migration since we already have a record with a null slug column.

We can fix this by applying our migration after deleting all records in tasks
table where the value of `slug` is null. But this isn't a good solution in an
existing database which cannot be deleted, such as a production database.

We can also fix this by adding a migration to add slug for the existing tasks.

Migration to generate slug for the existing records in the database should be
applied before the migration that changes column null for `slug`.

In this way we can also prevent the `ConstraintException` we encountered when we
ran our migration.

Hence we should delete the `MakeSlugNotNullable` migration for now. We will add
it once we have added slugs to the existing tasks in the database.

Run the following command to delete the migration:

```bash
bundle exec rails destroy migration MakeSlugNotNullable
```

Before we move on to creating a new migration, we need a method which we can
call in our migration to query task records and update their slugs.

Add the following lines of code to the `Task` model:

```ruby {11-21}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true

  private

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)
        itr += 1
      end
    end
end
```

We have created a private method called `set_slug` which we can call for each
task and set it's slug.

`set_slug` method is setting slug attribute as a parameterized version of the
title. When doing so, if the same slug already exists in the database, we use an
iterator and append it to the end of the slug, and loop until we generate an
unique slug.

`parameterize` is part of `ActiveSupport`, which replaces special characters in
a string so that it may be used as part of a 'pretty' URL. To read more about it
you can refer to the
[official documentation](https://guides.rubyonrails.org/active_support_core_extensions.html#parameterize).

Let's consider two examples to get a better understanding of how `set-slug`
method is working.

### Example 1

Oliver creates the task with title `buy milk`. We generate a slug `buy-milk` and
store it into the task.

### Example 2

Oliver creates another task with title `buy cheese`. But let's assume that the
slug named `buy-cheese` already exists.

Thus we use an iterator starting from 2 and append it to the slug. Here the
unique slug would be something like `buy-cheese-2`.

If you are wondering what is the `unless` keyword, it is the exact opposite of
an `if` statement. It's same as saying `if !condition`.

Now that we have added a method we can call inside our migration to set the
slug, we can go ahead and create a migration to seed our database.

Run the following command to generate migration:

```bash
bundle exec rails generate migration SeedSlugValueForExistingTasks
```

Add the following lines of code to the generated migration file:

```ruby
class SeedSlugValueForExistingTasks < ActiveRecord::Migration[7.0]
  def up
    Task.find_each do |task|
      task.send(:set_slug)
      task.save!(validate: false)
    end
  end

  def down
    Task.find_each do |task|
      task.slug = nil
      task.save!(validate: false)
    end
  end
end
```

Notice that we have also used a `down` method along with the `up` method in the
`SeedSlugValueForExistingTasks` migration.

We have done so because the changes in `up` are the forward changes we want to
make in our database when we apply the migration, whereas the changes in `down`
are the changes we want to take place when we revert or rollback the migration.

This ensures that upon rollback our database will go back to the state it was
previously in before we applied the migration.

In both the methods, we are querying a list of tasks from the database and
iterating over them to call the `set_slug` method on each task to set a unique
slug.

## Raw SQL query data migrations

The same `down` operation could be done with a single raw SQL query also.

The following snippet is just for illustration, do not replace the previous
code.

```ruby
def down
  execute "UPDATE tasks SET slug = NULL"
end
```

This is an elegant way to get things done.

Compared to `ActiveRecord` queries, raw SQL queries use less memory for the
whole operation, the reason is that `ActiveRecord` queries such as `find_each`
loads data in batches into the memory.

You could argue that reducing the batch size could fix this issue. In case of
`ActiveRecord` queries, execution time and memory consumption is inversely
proportional to each other, so reducing batch size means increased execution
time.

Don't get too excited and start using raw SQL everywhere.

Using raw SQL in the codebase is highly discouraged. Mostly due to compatibility
issues with different databases and the Rails convention, but there's more. If
you are curious to know more, then read the
[Rails migrations in depth](rails-migrations-in-depth) chapter which comes later
in this book.

Also keep in mind, raw SQL queries don't trigger any callbacks. So things might
not work as expected, if you aren't careful.

Running `ActiveRecord` queries inside migrations has its downside too. Sometimes
migrations fail due to stale `ActiveRecord` cache, but it's not a big deal, a
simple `reset_column_information` statement will fix it. We'll discuss more
about this in the [Setting up Rake tasks](setting-up-rake-tasks) chapter.

There are a number of ways through which we can query records from our database.

We could have used `Task.all` to fetch all task records from the database but
that would have been very inefficient as `all` method tries to instantiate all
the objects at once.

In our case, using `find_each` method allows us to query records in batches,
thereby increasing the efficiency.

Default batch_size is 1000 but that can be changed by specifying the
`batch_size` in the following manner:

```bash
Task.find_each(batch_size: 50)
```

Above query will fetch records in batches of 50.

Another important thing to note here is the use of `send` method. Calling `send`
invokes any method identified by a symbol, passing it any arguments specified.

Since `set_slug` is a private method in our `Task` model, it is not accessible
to the `task` objects we are calling the method on.

Hence we have used the `send` method to call the private `set_slug` method.

You shouldn't use the `send` method unless it is really required. Using `send`
might be a good choice if you have to call a `private` or `protected` method.

Apply the migration using the following command:

```bash
bundle exec rails db:migrate
```

Let us check if seeding the database using a migration worked. To do so, run the
following command:

```bash
Task.find_by(title: "Dummy task")
```

Running the above command should give us the following output:

```bash
#<Task id: 1, title: "Dummy task", created_at: "2021-07-01 00:50:34", updated_at: "2021-07-01 00:50:34", slug: "dummy-task">
```

We can see from the output that we have successfully seeded the slug column with
valid values in existing task records.

Now we can generate a migration and apply it to make slugs not nullable:

```bash
bundle exec rails generate migration MakeSlugNotNullable
```

Add the following lines of code to the generated migration file:

```ruby
class MakeSlugNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :slug, false
  end
end
```

`change_column_null` sets or removes the `NOT NULL` constraint on a column.

It takes three arguments. First argument is the table name, second argument is
the name of the column we want to apply the constraint to and the last value is
a `boolean` value.

Passing `false` in the above migration will set the database constraint. In
simpler words, it won't allow the value in slug column to be null.

Run the following command to migrate changes to database:

```bash
bundle exec rails db:migrate
```

Now that we have applied all slug related migrations, let's add logic to create
this slug automatically upon creation of a new task.

## Creating a unique slug upon task creation

Let's create the `slug` automatically whenever a user creates a new `Task`. We
will use `before_create` callback to set `slug` attribute.

Why specifically the `before_create` callback?

The main reason for using the `before_create` callback is because we are only
setting the `slug` value once and that is during the creation of a new task.
Based on this use case, no other `ActiveRecord` callback would suffice over
here.

### Callback selection

Let's take a moment to truly understand why we chose the `before_create`
callback in this context.

The first callback that might sound appealing to most developers is the
`before_save` callback. But we shouldn't use `before_save` over here since it
will be invoked for all updates, rather than just the first time creation of
task.

`after_save` is another common callback for both create and update scenarios.
But it's not practical to use it in our context, since it gets invoked while
updating too and also we have to `save` the record once again. When we `save` it
like that, it can end up in an infinite loop unless we conditionally exit.

But why not just use the `after_commit` callback then? This callback should only
be used when we queue a background job or when telling another process about a
change that we made. Update of slug doesn't need to be announced to any other
processes.

`before_validation` and `after_validation` are other callbacks that we might
have in mind. But both of these callbacks should not be used as they will be
invoked every time before any `INSERT` or `UPDATE` operation to the database.

Thus `before_create` is the right choice of a callback over here.

Now let's add the `before_create` callback into our `Task` model:

```ruby {11}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true

  before_create :set_slug

  private

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)
        itr += 1
      end
    end
end
```

`before_create` callback will invoke the `set_slug` method once for each task
before it's creation.

## Making slug immutable

Although we set `slug` attribute to a parameterized version of the `title`, we
don't need to ensure that the `slug` gets updated during update of the `title`
corresponding to that Task. We need to keep `slug` immutable, meaning once set,
it shouldn't ever change.

To make it immutable, we need to add a custom validation like this:

```ruby {10,26-30}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true
  validate :slug_not_changed

  before_create :set_slug

  private

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)
        itr += 1
      end
    end

    def slug_not_changed
      if slug_changed? && self.persisted?
        errors.add(:slug, 'is immutable!')
      end
    end
end
```

The `slug_not_changed` method is checking if the slug has changed and if it has
changed then we are adding a validation error to the slug attribute.

We make use of `column_name_changed?` attribute method provided by
`ActiveModel::Dirty` module. It provides a way to track changes in our object in
the same way as `Active Record` does. In simpler terms, if we need to know if a
particular database column has changed in database level, then we can make use
of these methods.

`self` is a Ruby keyword that gives you access to the current object. Here, it
will be the current task.

`persisted?` is a Ruby method, part of `ActiveRecord::Persistence`, which
returns true if the record is persisted, i.e. it's not a new record and it was
not destroyed, and otherwise returns false.

So, here `slug_changed? && self.persisted?` is ensuring that slug has changed as
well as persisted.

`errors` is an instance of `ActiveModel::Errors`, which provides error related
functionalities, which we can include in our object for handling error messages
and interacting with `ActionView::Helpers`.

`add` is a Ruby method, part of `ActiveModel::Errors` class, which adds a new
error of `type` on a particular `attribute`. More than one error can be added to
the same `attribute`.

Here `errors.add(:slug, 'is immutable!')` adds an error message `is immutable!`
on the `slug` attribute.

The official Rails guide has a section on
[ActiveModel::Dirty](https://api.rubyonrails.org/classes/ActiveModel/Dirty.html),
[ActiveRecord::Persistence](https://api.rubyonrails.org/classes/ActiveRecord/Persistence.html)
and
[ActiveModel::Errors](https://api.rubyonrails.org/v7.0.5/classes/ActiveModel/Errors.html).
Please read the official documentation if you want to dive deeper into these
concepts.

## changed? vs previously_changed?

We already saw the usage of `*_changed?` method in the previous section. However
there are a few things you should consider.

`*_changed?` returns `true` only if the associated model has unsaved changes,
and `false` otherwise. It can be called with the attribute name to check if a
specific attribute has changed, and can also be called with the `:from` and
`:to` keyword arguments to check if a specific attribute has changed from one
value to another. Let's say we have a `User` model with a `name` attribute.
Below is an example that demonstrates the usage of `*_changed?` method.

```
user = User.new(name:  "John")
user.name_changed? # => true
user.name_changed?(from: nil , to: "John") # => true

user.name = "Jane"
user.name_changed? # => true
user.name_changed?(from: "John" , to: "Jane") # => true

user.save
user.name_changed? # => false
```

Notice that after saving `user.name_changed?` returns false.

We also have another method named `*_previously_changed?` which returns `true`
if the associated model has saved changes, and `false` otherwise. It can be
called with the attribute name to check if a specific attribute has been changed
and saved, and can also be called with the `:from` and `:to` keyword arguments
to check if a specific attribute has been changed from one value to another and
saved. Let's see this method in the light of `User` model.

```
user = User.new(name:  "Oliver")
user.name = "Jane"
user.name_changed? # => true
user.name_previously_changed? # => false

user.save
user.name_changed? # => false
user.name_previously_changed? # => true
user.name_previously_changed?(from: "Oliver" , to: "Jane") # => true
```

## Moving response messages to i18n en. locales

`i18n` is "Ruby internationalization and localization solution". It provides
support for English and similar languages by default. To use other languages, we
can set it in our `config/application.rb`.

For eg, in the previous chapter, we manually hard coded and returned a `json`
response with the `notice` key as "Task was successfully created". So what if we
needed the same response to be used multiple times in our app?

Instead of hardcoding this string response message each time, we can use `en`
locales to accommodate our string messages and reuse them the way we access
variables.

This allows for modularizing and reusing the messages.

Now, open the `en.yml` file in `config/locales` and add the following code:

```yaml
en:
  task:
    slug:
      immutable: "is immutable!"
```

Here, we have created our data in a JSON like format called YAML. It's another
markup language (Yet Another Markup Language).

Whenever `task.slug.immutable` is translated, it refers to the string "is
immutable!".

Now we can access it in our `tasks_controller` by using `t()`. `t()` is an alias
for translate, which is a
[TranslationHelper](https://api.rubyonrails.org/classes/ActionView/Helpers/TranslationHelper.html#method-i-t).

In every controller, we can use `t()` method without including any additional
modules since
[AbstractController::Translation](https://api.rubyonrails.org/v7.0.5/classes/AbstractController/Translation.html)
is already included in
[ActionController::Base](https://api.rubyonrails.org/classes/ActionController/Base.html).

As you can see, `ApplicationController` (in
`app/controllers/application_controller.rb`), inherits from
`ActionController::Base`.

`ApplicationController` is the superclass of all of our controller classes, and
thus all of our controllers can access the methods defined in
`ActionController::Base` including the `t()` we have discussed earlier.

Unlike controllers, instances of `ApplicationRecord` (or more specifically,
models) don't have reference to `t()` methods out of the box. We need to
manually include the module
[ActionView::Helpers::TranslationHelper](https://api.rubyonrails.org/v7.0.5/classes/ActionView/Helpers/TranslationHelper.html)
to use `t()` in our models.

Instead of including `ActionView::Helpers::TranslationHelper` in every model,
let us include it in their common superclass `ApplicationRecord`.

Open `app/models/application_record.rb` and add the following line to it:

```ruby {2}
class ApplicationRecord < ActiveRecord::Base
  include ActionView::Helpers::TranslationHelper
  primary_abstract_class
end
```

Now, let's replace our hardcoded error message with `t()` method call:

```ruby {28}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  VALID_TITLE_REGEX = /\A.*[a-zA-Z0-9].*\z/i

  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }
  validates :slug, uniqueness: true
  validate :slug_not_changed

  before_create :set_slug

  private

    def set_slug
      itr = 1
      loop do
        title_slug = title.parameterize
        slug_candidate = itr > 1 ? "#{title_slug}-#{itr}" : title_slug
        break self.slug = slug_candidate unless Task.exists?(slug: slug_candidate)
        itr += 1
      end
    end

    def slug_not_changed
      if slug_changed? && self.persisted?
        errors.add(:slug, t('task.slug.immutable'))
      end
    end
end
```

Phew! That was a lot of good content. But still we can add some finesse to the
overall process, which we will do in the next chapter.

Now, let's commit these changes:

```bash
git add -A
git commit -m "Added slug to task"
```
