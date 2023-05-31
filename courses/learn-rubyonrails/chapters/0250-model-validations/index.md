When we are creating a new task with a blank title, the application will create
a new task with no title. We don't want the title to be blank. We want the title
field to be filled before a task is created.

## Making title field a required field

We can edit the `Task` model to add a validation.

Navigate to `app/models/task.rb` and add the following code for validating the
title:

```ruby {2}
class Task < ApplicationRecord
  validates :title, presence: true
end
```

## Verifying validation

Before saving a record to the database, Rails runs validations on these Active
Record objects. If these validations produce any errors, Rails will not save the
object.

Let's fire up Rails console and let's create an instance of `Task` model using
the `new` method. We are going to use `reload!` in console for the folks who
already had the console open:

```ruby
$ bundle exec rails console

irb(main):011:0> reload!

irb(main):011:0> t1 = Task.new(title: "I am a task with title")
=> #<Task id: nil, title: "I am a task with title", created_at: nil, updated_at: nil>

irb(main):012:0> t2 = Task.new
=> #<Task id: nil, title: nil, created_at: nil, updated_at: nil>
```

Now we have two instances t1 and t2. t1 has a title. t2 has no title.

We can run validations using the built-in method `valid?`. Invoking `valid?` on
an Active Record object runs validations and returns `true` if there are no
errors and returns `false` if the record has any error:

```ruby
irb(main):013:0> t1.valid?
=> true

irb(main):014:0> t2.valid?
=> false
```

`valid?` returns `true` for `t1` and `false` for `t2`.

We can check for the errors associated with object `t2` using the
`errors.messages` method:

```ruby
irb(main):015:0> t2.errors.messages
=> {:title=>["can't be blank"]}
```

As we can see the object `t2` is not valid because we did not provide any title
and when we check the error messages we can see the reason for it.

## Caveats with validations at the Rails level

Let's execute a raw sql query and see what happens when we don't pass any value
for `title` field. Here we are directly trying to add a record in the database
and we are bypassing Active Record model.

```bash
irb> sql = "INSERT INTO TASKS (id, created_at, updated_at) VALUES (30, '2019-02-07 10:01:47', '2019-02-07 10:01:47')"
=> "INSERT INTO TASKS (id, created_at, updated_at) VALUES (30, '2019-02-07 10:01:47', '2019-02-07 10:01:47')"

irb> ActiveRecord::Base.connection.execute(sql)
   (23.3ms)  INSERT INTO TASKS (id, created_at, updated_at) VALUES (30, '2019-02-07 10:01:47', '2019-02-07 10:01:47')
=> []

==> Task.last
Task Load (0.2ms)  SELECT "tasks".* FROM "tasks" ORDER BY "tasks"."id" DESC LIMIT ?  [["LIMIT", 1]]
=> #<Task id: 30, title: nil, created_at: "2019-02-07 10:01:47", updated_at: "2019-02-07 10:01:47">
```

We are able to create a record without title. What it means is that just the
validation in the model is not enough. We also need to make title not nullable
at the database level.

Let's add title to all the existing tasks. If there are records with null values
for title then we can't make title not nullable at the database level:

```bash
$ bundle exec rails console

==> Task.update_all title: "my title"
UPDATE "tasks" SET "title" = ?  [["title", "my title"]]
```

## Adding migration to make title field NOT NULL

Let's add a constraint at the database level to not to allow `null` values for
title field. Let's generate a migration to make this change:

```bash
bundle exec rails g migration MakeTitleNotNullable
Running via Spring preloader in process 24660
      invoke  active_record
      create    db/migrate/20190211162942_make_title_not_nullable.rb
```

Now let's open this migration file and add the code to make `title` not
nullable:

```ruby {3}
class MakeTitleNotNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :tasks, :title, false
  end
end
```

Run the command `rails db:migrate` to apply the migration:

```bash
$ bundle exec rails db:migrate
== 20190211162942 MakeTitleNotNullable: migrating ===========================
-- change_column_null(:tasks, :title, false)
   -> 0.0044s
== 20190211162942 MakeTitleNotNullable: migrated (0.0045s) ==================

```

Open the file `db/schema.rb` under the `db` folder. We can see that now "title"
field has `null: false` statement.

## Verifying validation using console

Now fire up the console again using `rails c`. Let's try creating a new task the
same way we created before by inserting into the database directly:

```msg
#=> bundle exec rails console

irb(main):002:0> sql = "INSERT INTO TASKS (id, created_at, updated_at) VALUES (4, '2019-02-07 10:01:53', '2019-02-07 10:01:53');"
=> "INSERT INTO TASKS (id, created_at, updated_at) VALUES (4, '2019-02-07 10:01:53', '2019-02-07 10:01:53');"

irb(main):003:0> ActiveRecord::Base.connection.execute(sql)
   (0.7ms)  INSERT INTO TASKS (id, created_at, updated_at) VALUES (4, '2019-02-07 10:01:53', '2019-02-07 10:01:53');
Traceback (most recent call last):
        1: from (irb):3
ActiveRecord::NotNullViolation (SQLite3::ConstraintException: NOT NULL constraint failed: tasks.title: INSERT INTO TASKS (id, created_at, updated_at) VALUES (4, '2019-02-07 10:01:53', '2019-02-07 10:01:53');)
irb(main):004:0>
```

As expected, it throws a violation `NotNullViolation` which means our title
can't be nil.

## Adding length validation to title field

Similarly, we can also add length validation to the `title` field. To add length
validation we can use length validator method:

```ruby {2}
class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 125 }
end
```

This validation ensures that the length of the title would not exceed 125
characters.

We should always use constants to store values such as maximum lengths and use
the constant in our code instead of hardcoding the value each time. This is
because, if we need to update the maximum length for an attribute, we will only
need to update the value stored in the constant instead of updating the value
throughout the codebase.

Let's add a constant `MAX_TITLE_LENGTH` for the maximum length of the task title
in our Task model. We could define the constant in a global file like
`constants.rb` but as a convention, we want to keep all entities, like say
variables, methods, constants etc limited to the smallest possible scope. Since
we will only be using `MAX_TITLE_LENGTH` in the context of our Task model we can
define it under the scope of our Task class.

This also let's us define the constant as `MAX_TITLE_LENGTH` and not as
`MAX_TASK_TITLE_LENGTH` since the constant will be available under the `Task`
namespace avoiding confusion. The general idea of naming it without again adding
the keyword `TASK` is to avoid redundancy and keep naming clean.

Update the following line of code in `TaskModel`:

```ruby {2}
class Task < ApplicationRecord
  MAX_TITLE_LENGTH = 125
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
end
```

Let's commit these changes:

```bash
git add -A
git commit -m "Added constraint to make title not nullable"
```
