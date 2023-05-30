## What is Rake and why do we need it?

In the previous chapter, we manually created some demo users for reviewing and
testing the changes we have made. What if we need to share the code with someone
else and they need to review it too? For example, a peer trying to review your
application.

We need some way to automate setting up the project with all required
configurations and necessary data for testing.

Can't we use migration scripts for creating necessary data? No! We can't.

Why? Because the test data shouldn't be created on our production server when we
deploy the application.

When we deploy applications, all migrations are automatically run as part of our
pipeline.

In the case of our previous chapter, these test users are purely for setting up
the staging environment.

We can solve this problem using **Rake** tasks.

**Rake** stands for Ruby Make. It's a standalone Ruby utility that "replaces the
Unix utility 'make', and uses a `Rakefile` and `.rake` files to build up a list
of tasks".

Basically, it is a task runner for Ruby. Rails uses Rake Proxy to delegate some
of its tasks to Rake.

We have used `rails db:migrate` in the previous chapters. When
`rails db:migrate` is run, what happens internally is that Rails checks if
`db:migrate` is supported natively. In this case `db:migrate` is not natively
supported by Rails, so Rails delegates the execution to Rake via Rake Proxy.

## Setting up Rake tasks

We can also write our custom Rake tasks in Rails environment by creating files
with `.rake` extension in `./lib/tasks`.

Often when creating a new project, we need to setup some defaults, like say
populating the user database with default users etc. For such cases we can write
those tasks in `./lib/tasks/setup.rake`. Let's add the code below in our
`setup.rake`:

```ruby
task :populate_with_sample_data do
  puts 'Seeding with sample data...'
  User.create!(
    name: 'Oliver',
    email: 'oliver@example.com',
    password: 'welcome',
    password_confirmation: 'welcome'
  )
  puts 'Done! Now you can login with "oliver@example.com" using password "welcome"'
end
```

It's a common practice after cloning a repository for the first time, to run
`./bin/setup`, to automatically fetch all the libraries, create db, seed data
etc. Therefore it makes sense to invoke our `setup.rake` from `./bin/setup`
since it also plays a role in bootstrapping the project.

Remove the following lines, including the comments, from the `./bin/setup` under
`APP_ROOT` block:

```ruby
puts "\n== Preparing database =="
system! "bin/rails db:prepare"
```

Then add the highlighted lines to `./bin/setup` file:

```rb {4,14}
FileUtils.chdir APP_ROOT do
  # rest of the code

  puts "\n== Executing yarn =="
  system!("bin/yarn")

  puts "\n== Executing rake setup =="
  system! "bundle exec rake setup"

  puts "\n== Removing old logs and temp files =="
  system! "bin/rails log:clear tmp:clear"

  # rest of the code
end
```

Note that, if you run `./bin/setup`, then most probably all your DB data will be
wiped off and new seed data will be added.

It's recommended to run this setup, only for the first time that we clone a
repo.

There are valid cases when we need to rerun this setup.

Example:

Let's say as a team we decided we need to modify a migration file. We shouldn't
modify a migration in the first place. But let's say it happened.

Then one of the easiest ways to rerun the updated migration is by running this
setup. Or you can rollback the migrations and manually commit it once again.

## Executing the Rake task

Run this command to execute our Rake task:

```bash
bundle exec rake populate_with_sample_data
```

You will get an error saying something like:

```text
Seeding with sample data...
rake aborted!
NameError: uninitialized constant User
....
```

This is because the Rake has no way of knowing the models and classes we have
defined in our Rails environment. It isn't able to find a reference to our
`User` without loading Rails environment.

To fix this problem, we need to add our Rails environment into the Rake task.
Update `setup.rake` with the below code:

```ruby {1}
task populate_with_sample_data: :environment do
  puts 'Seeding with sample data...'
  User.create!(
    name: 'Oliver',
    email: 'oliver@example.com',
    password: 'welcome',
    password_confirmation: 'welcome'
  )
  puts 'Done! Now you can login with "oliver@example.com" using password "welcome"'
end
```

Now, we can run the command again:

```bash
bundle exec rake populate_with_sample_data
```

You can see our previous error has disappeared. You might see another error that
might look like this:

```text
Seeding with sample data...
rake aborted!
ActiveRecord::RecordInvalid: Validation failed: Email has already been taken
....
```

This is perfectly fine and our Rake task is running as expected. We see this
error because we already have some demo users in our table with the same
`email`. Adding a new `User` with the same `email` would violate the unique
constraint we have enforced on our database.

If you get the email validation error, then it means that you can safely move
forward to the next section.

If you want to see the validation pass, then change the emails of the sample
users in the Rake setup file and run the command once again.

## Finalizing the Rake setup

Let us add another task, that destructively recreates the database. This will
avoid problems like the one we have encountered in the previous section, which
is caused by already existing data.

One more key thing to take care is to ensure that we don't drop the database in
production environment. We will be uploading this file to production and staging
environment.

But we will be running the rake task only in the staging environment. The reason
is that `staging` environment is where we test out stuff and thus it acts as a
simulated production environment. While testing it's useful for us to have some
defaults like the default user logins.

Update the `setup.rake` file with the following lines of code:

```ruby
desc 'drops the db, creates db, migrates db and populates sample data'
task setup: [:environment, 'db:drop', 'db:create', 'db:migrate'] do
  Rake::Task['populate_with_sample_data'].invoke if Rails.env.development?
end

task populate_with_sample_data: [:environment] do
  if Rails.env.production?
    puts "Skipping deleting and populating sample data in production"
  else
    create_sample_data!
    puts "sample data has been added."
  end
end

def create_sample_data!
  puts 'Seeding with sample data...'
  create_user! email: 'oliver@example.com', name: 'Oliver'
  create_user! email: 'sam@example.com', name: 'Sam'
  puts 'Done! Now you can login with either "oliver@example.com" or "sam@example.com", using password "welcome"'
end

def create_user!(options = {})
  user_attributes = { password: 'welcome', password_confirmation: 'welcome' }
  attributes = user_attributes.merge options
  User.create! attributes
end
```

Running this Rake task will drop our database and recreate it from scratch with
the demo data.

If you need to preserve your old data, backup the database file
`db/development.sqlite3` and `db/test.sqlite3`. But if you're using PostgreSQL,
then this trick won't work. You'd have to dump the DB manually and reuse it.

Run this command to execute our Rake setup:

```bash
bundle exec rake setup
```

The above command should output something similar in the console:

```text
Dropped database 'db/development.sqlite3'
Dropped database 'db/test.sqlite3'
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
== 20210104080645 CreateTasks: migrating ======================================
-- create_table(:tasks)
   -> 0.0014s
== 20210104080645 CreateTasks: migrated (0.0015s) =============================

== 20210106115906 MakeTitleNotNullable: migrating =============================
-- change_column_null(:tasks, :title, false)
   -> 0.0086s
== 20210106115906 MakeTitleNotNullable: migrated (0.0086s) ====================

== 20210108115051 CreateUser: migrating =======================================
-- create_table(:users)
   -> 0.0014s
== 20210108115051 CreateUser: migrated (0.0015s) ==============================
....
Seeding with sample data...
Done! Now you can login with either "oliver@example.com" or "sam@example.com", using password "welcome"
```

The Rails server should be restarted so that the latest data will be loaded.

## Importance of ./bin/setup file

The `./bin/setup` file helps in setting up the project for development env in
one go. When we are setting up a new project in the machine then a lot of steps
like creating a database, performing migrations, seeding the database,
installing dependencies, etc. need to be taken care of. We define all these
processes in the `bin/setup` file and now we just need to execute the
`bin/setup` file to setup the project's base.

The `bin/setup` file performs the following operations:

- Install all the dependencies

- Create the `database.yml` file, if not already exists

- Execute the rake `setup` task which creates the db, migrates all the
  migrations, and populates the sample data.

- Clear the logs and the temp files

- Restart the Rails server

We can add more operations in the setup file if needed to setup the project.

At BigBinary, the base of all projects should get setup if we run `./bin/setup`
file. The developer should not be forced to manually perform migrations or add
seed data while setting up the development env. All they have to do is run
`./bin/setup` file.

## Dealing with stale Active Record cache

Consider a scenario where a new column or a table is created using a migration
and right after the new column or table is populated with some seed data. When
the migration runs to add the seed data, Rails will throw an exception that the
new column or the table doesn't exist. This is because Rails will use the schema
from the Active Record cache which does not get updated before all the
migrations finish running.

```ruby
class CreateJobLevels < ActiveRecord::Migration
  def up
    create_table :job_levels do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end

    %w{assistant executive manager director}.each do |type|
      JobLevel.create(name: type)
    end
  end

  def down
    drop_table :job_levels
  end
end
```

In the above example, Rails will throw an exception when new records are created
in the `JobLevels` table because when Rails tries to create the records, it will
use the stale Active Record data which doesn't contain the `JobLevel` table.

This issue can also occur when migrations are run during a chained task. For
example, when running something like `./bin/setup` or `rails db:migrate db:seed`
the schema is cached and sometimes the newly added columns or tables are not
reflected in the cached schema.

According to the
[official Rails guide](https://api.rubyonrails.org/classes/ActiveRecord/Migration.html#:~:text=Using%20a%20model%20after%20changing%20its%20table),
we should invoke `reset_column_information` method to reset all the cached
information about columns, which will cause them to be reloaded on the next
request.

You can invoke the `reset_column_information` method in the `up` method of the
migration where a new column or a new table is created and simultaneously data
is being added to that column. This will ensure that the latest schema is loaded
before the request to add data to the new column is processed and any errors due
to stale Active Record cache can be avoided.

The example above can be fixed like so:

```ruby {10}
class CreateJobLevels < ActiveRecord::Migration
  def up
    create_table :job_levels do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end

    reset_column_information

    %w{assistant executive manager director}.each do |type|
      JobLevel.create(name: type)
    end
  end

  def down
    drop_table :job_levels
  end
end
```

Note that the `CreateJobLevels` migration is only illustrated to explain the use
case of `resets_column_information` method. Please do not add this migration to
the Granite application.

The schema cache can also be cleared by running the
`rails db:schema:cache:clear` or `rails db:schema:cache:dump` command from the
console. But in a production environment it would not be feasible to do so
because you cannot pause the migrations to update the cache before the next
request is processed. Hence using the `reset_column_information` method is the
right way to fix this issue.

We have successfully setup the Rake tasks for this project.

## How to add TODO comments?

At BigBinary, we write code in a self-explanatory way. This means the code is
more or less like reading an English sentence. Thus it would be self-explanatory
if the sentence makes sense. That's why we don't use comments for explaining the
code. More than that comments don't scale. If we add a detailed comment pointing
out how a utility function works and how it can impact other functions based on
top of it, then once there is a change to this utility function, we would have
to take the effort to change all the comments which utilize this function. Thus
it doesn't make sense to add comments to explain the working of the code, unless
and until there's no other way to convey the same.

But there are cases where comments make sense. Example: We can add some comments
for the work that needs to be worked upon in the future. Such comments should be
prefixed with the `TODO:` keyword. This helps in easily jumping into the
comments that need to be fixed.

For example:

```ruby
# Wrong
# Update rake task to populate articles

# Correct
# TODO: Update rake task to populate articles
```

There are many ways for navigating through `TODO:` comments like the
`rake notes` task as mentioned in this
[thread](https://stackoverflow.com/questions/1693818/todo-in-rails). This
command will return the list of all `TODO` comments from the Ruby files. We can
easily navigate to each of the `TODO` comments from our text editors too. In
VSCode we can install the
[Todo Tree](https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree)
extension to jump through the `TODO` comments.

Let's commit the changes:

```bash
git add -A
git commit -m "Added rake tasks"
```
