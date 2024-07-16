## Features

In this chapter, we are going to create some users to whom we can assign our
tasks. Here is a list of things we need in this feature:

- We need a new entity called "User". Every user must have a valid display name
  that doesn't exceed 35 characters.

- We won't be building UI for creating or editing user details. We can deal with
  that later. For now, we can add a few users using Rails console.

## Technical design

Let us break down the requirement into smaller sub-tasks and explain our way of
approach in a bit more technical way:

- We need to create a new model `User`. We need a single column, `name`. Columns
  like `created_at` and `updated_at` are by default part of every single table.

- We will be validating the field `name` for `presence` and `maximum` `length`.

- We will add a new column in our tasks table called `assigned_user_id` to
  reference the user to whom this task is assigned.

## Creating migration

Let's generate a migration so that we have a table named `users`:

```bash
bundle exec rails generate migration CreateUser
```

It will create the following file:

```text
Running via Spring preloader in process 30090
      invoke  active_record
      create    db/migrate/20190209145206_create_user.rb
```

The generated migration file should look like this:

```ruby
class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
    end
  end
end
```

Let's add `name` field with type `string` into the migration file:

```ruby {4,5}
class CreateUser < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end

```

Execute migration files:

```bash
bundle exec rails db:migrate
```

## Adding a User model

Let's create a `User` model:

```bash
touch app/models/user.rb
```

As discussed earlier, we will be validating `name` for `presence` and
`maximum length`. Let us first declare a constant for the maximum length in our
User model and use that constant in the length validation.

Note that, the value for maximum length in this case is in accordance with the
[W3C standards](https://www.w3.org/International/questions/qa-personal-names)
for maximum length of a name. As a matter of fact, all values for maximum
lengths used in the model validations in this book are in line with the
standards laid down by W3C.

Update the following lines within the `user.rb` file:

```ruby{2,4}
class User < ApplicationRecord
  MAX_NAME_LENGTH = 255

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
```

## Adding users

We need to have some users in our database to assign them tasks.

To create these users, launch Rails console:

```bash
bundle exec rails console
```

Now let's create two users:

```ruby
User.create!(name: 'Oliver Smith')
User.create!(name: 'Sam Smith')
```

## Connecting User and Task

Now we have created the `User` model but there is no relationship between `User`
and `Task` models as of now.

To identify to whom a task is assigned we need to create a new column in the
`tasks` table. We will call this column `assigned_user_id` since it will store
user id of the person to whom the task is assigned.

Let's create a migration to add column `assigned_user_id` to the `tasks` table:

```bash
bundle exec rails generate migration AddAssignedUserIdToTasks assigned_user_id:integer
```

Change the content of the migration script to this:

```ruby
class AddAssignedUserIdToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :assigned_user_id, :integer
  end
end
```

The code for the `change` method will be auto-populated when we run the above
command. Reason being, the name of our migration is `AddAssignedUserIdToTask`,
which is of the form `add_column_name_to_table_name column_name:type`.

Rails will infer the column name and table name from the migration name itself
and generate the code for that, even respecting that types passed in.

Cool right? That's one among the many Rails magic that you will be seeing
throughout this book!

Now, we'll add a foreign key constraint to the tasks table. This will let the
database know that the `assigned_user_id` column is related to the `id` column
of the `users` table.

Adding a foreign key constraint will also ensure that an error is raised when
`assigned_user_id` is updated with a value that is not present in the `id`
column of the `users` table. This makes the application fail-fast against
corrupted relations between records.

Run this command to generate migration script:

```bash
bundle exec rails g migration AddForeignKeyToTask
```

Add following line to migrated file:

```ruby
class AddForeignKeyToTask < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :tasks, :users, column: :assigned_user_id
  end
end
```

The syntax for `add_foreign_key` is as following.

`add_foreign_key(from_table, to_table, options = {})` where `from_table` is the
table with the key column, `to_table` contains the referenced primary key. The
third parameter is a hash of options. We can use this field to supply additional
configurations to the constraint definition.

In this case, we can supply the name of the referencing column (specifically,
`user_id`).

Execute migration files:

```bash
bundle exec rails db:migrate
```

In the next chapter we will learn about associations and add appropriate
associations in User and task model to establish a relationship between them.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added a user model"
```
