## What is a bundler?

Bundler is a dependency management tool for Ruby which is available as a gem
that can be installed through the `RubyGems` package manager which comes
built-in using the following command:

```bash
gem install bundler
```

Bundler reads the Gemfile for the list of gems and ensures that the gems you
need are present in development, staging, and production. It also fetches the
metadata from the source provided, resolves the dependencies of each gem,
installs them and then requires them while booting.

Without bundler, we would have to handle the installation and manage the
dependencies manually.

Let's take a brief look at how Bundler works with `Gemfile` and `Gemfile.lock`
for dependency management.

## Don't use sudo bundle install

In any system, using `sudo` to install 3rd party packages or apps is not a good
idea from a security perspective. When we are installing 3rd party packages
those packages have the ability to run some scripts. If we install a package
with `sudo` then we are giving the admin permission to the external package and
now this external package can run any malicious scripts on your machine.

It can also mess up the permissions for the system. While installing the package
it can update the machine's settings or permissions just to install the given
package. This can lead us to endless permission issues afterward.

The same is the case with `npm` installations. We should not use sudo while
installing a package with `npm`. So if we give sudo privileges while installing
a 3rd party package, then it's a security issue and it's a hacky solution. We
should dig deeper and fix the underlying issue rather using `sudo` in the
commands.

If you have already used the `sudo bundle install` and now facing permission
issues, then as a possible solution, you can fully uninstall `ruby` and its
dependencies and then install `ruby` using `rbenv` again as mentioned in
[this section](/learn-rubyonrails/installing-ruby-on-rails#install-rbenv).
Now change the directory to the project with `Gemfile` and run `bundle install`.
Now ideally it should be finding the `Gemfile` and install the gems
automatically under the currently logged in user's scope.

## Gemfile and Gemfile.lock

`Gemfile` is a Ruby file which contains a list of gem dependencies of a project.
When you install the gems using the command `bundle install`, bundler looks for
the Gemfile at either the directory mentioned by the environment variable
`BUNDLE_GEMFILE` or at the root of the project directory.

Bundler then makes use of `RubyGems` to install the gems listed on the Gemfile
along with their dependencies and it creates a file called `Gemfile.lock` with
the list of the gems installed along with their respective versions.

When you run `bundle install` the next time, bundler will read the
`Gemfile.lock` and use `RubyGems` to install the exact versions of the gems
specified in `Gemfile.lock`.

`Gemfile.lock` gets updated every time you install, update or remove a gem from
the list of dependencies of your project.

## bundle exec command

In this section we will learn why it is preferred to prefix commands with
`bundle exec` while running them.

Sometimes `RubyGems` generates executables after installing a gem. Examples of
these gems include rails, rake, rspec, etc.

Now, consider a scenario where multiple versions of the same gem are installed.
In such a case multiple versions of executables are present for the same gem.

Let us take the example of `rake` gem. Suppose your project's Gemfile contains
v10.4.0 of the `rake` gem whereas v10.4.2 of the same is installed on your
system.

If you were to run the `rake` command in this case, you would get an error, like
so:

```bash
rake db:migrate
rake aborted!
Gem::LoadError: You have already activated rake 10.4.2, but your Gemfile requires rake 10.4.0. Prepending `bundle exec` to your command may solve this.
```

When `rake` gets called in the above example, there is nothing to ensure that
the right version of `rake` gets activated. In fact, `RubyGems` will simply
activate the latest `rake` version even if your project depends on an older
version.

If something like this happens, you shouldn't remove the incompatible
system-wide `rake` gem to solve this issue. It will lead to other errors in case
other projects or tools are dependent on that version.

Additionally, there is no guarantee that simply updating the `rake` version in
your project will fix this issue. Other gems in your project may not be
compatible with the updated version.

The solution to this is to use the `bundle exec` command. `bundle exec` allows
us to run an executable script in the specific context of the project's bundle.

For example, the error encountered in the above example can be fixed using the
following command:

```ruby
bundle exec rake db:migrate
```

Upon running the above command, `bundle exec` will run the executable script for
`rake` version specified in project's Gemfile thus avoiding any conflicts with
other versions of `rake` installed system-wide.

There is however an exception in case of the `rails` command. The reason being,
`rails` command first loads up the bundler and bundler checks `Gemfile.lock` for
the correct version of command to execute. So if you look into
`config/application.rb`, then you will be able to see the line
`Bundler.require(*Rails.groups)`, which does the magic and avoids dependency of
prefixing the `rails` command with `bundle exec`.

So it's safe to say running `bundle exec rails` and simply `rails` is similar.
But this is only specific to the `rails` command.

Let us see another scenario where `bundle exec` can be useful. Consider you are
about to undertake a project that uses Ruby version 3.1.3. Let us say you need
to use a gem called `foreman` to manage proc-files in your project. After a bit
of inspection, you learn that the `foreman` gem is already installed in your
system globally for a specific ruby version, say 3.2.2. So if you proceed to run
any foreman command, under the impression that `foreman` is available to use
system-wide, you will be greeted with an error, like so:

```bash
$ foreman start -f Procfile.dev.SSO
rbenv: foreman: command not found

The foreman command exists in these Ruby versions:
  3.2.2
```

When `foreman` was installed previously, it was for the specific Ruby version
3.2.2. This is essentially how `rbenv` works. So now when you use the gem for
Ruby version 3.1.3, it raises an error since `foreman` is not installed for
v3.1.3.

So a possible solution would be to install `foreman` for the current Ruby
version using `gem install foreman`. But you will have to do the same each time
you work on a new project with a different Ruby version.

A graceful solution to the above problem would be to prepend the `foreman`
command with `bundle exec` which in this case will turn out to be

```bash
bundle exec foreman start -f Procfile.dev.SSO
```

`bundle exec` isolates and uses `foreman` for the current Ruby version if it
already has been installed. Otherwise, it downloads `foreman` for the current
Ruby version and uses the same.

Running `bundle exec` and `Bundler.require` at the same time is not a problem.
Thus it's safe to use `bundle exec` with all commands, even when not needed as
long as there's a Gemfile in that directory, it won't activate the gems twice.
If there are any performance differences between the two invocations, then it's
negligible.

We advocate to use `bundle exec` at all times. It's a good practice and can save
your unnecessary overhead in the long run.

Note that, in this chapter we have used two distinct terms `bundle` and
`bundler`. Don't let this confuse you. `bundler` is a gem which whereas `bundle`
is a command.

Although in some places you may notice `bundler` being used as a command in
place of `bundle`. There is no difference and both `bundler` and `bundle` have
the same functionality when used in commands.

## Updating gems manually

Suppose you want to update a gem that you are using in your application to
another version, to do so you should use the following command:

```ruby
bundle update gem-name
```

For example, consider the following from Gemfile.lock in the Granite
application:

```ruby
rack (2.2.3)
  rack-proxy (0.7.0)
    rack
  rack-test (1.1.0)
    rack (>= 1.0, < 3)
```

It seems like the `rack` gem is being used by the Granite application directly
and also as a dependency by other gems. If you wish to update the `rack` gem
then you must only do so for the `rack` version which is being used by the
application. If you update the `rack` version for `rack-test` gem as well then
it can cause compatibility issues within `rack-test` gem's functionality.

Hence the correct way to update the `rack` gem would be like so:

```ruby
bundle update rack
```

## Rails generators

In Rails, generators are simply scripts that use templates to create boilerplate
code and improve your workflow saving you a quite a bit of time.

For example, when you create a new Rails application you are in fact using a
Rails generator.

In the next section we will take a look at how we can use generators to create
models, controllers etc.

## Rails generate command

Rails includes a lot of generators by default such as model generator,
controller generator etc.

You can get a list of all default as well as custom generators available in a
Rails project using the following command:

```bash
bundle exec rails generate

Usage: rails generate GENERATOR [args] [options]

General options:
  -h, [--help]     # Print generator's options and usage
  -p, [--pretend]  # Run but do not make any changes
  -f, [--force]    # Overwrite files that already exist
  -s, [--skip]     # Skip files that already exist
  -q, [--quiet]    # Suppress status output

Please choose a generator below.

Rails:
  application_record
  assets
  benchmark
  channel
  controller
  generator
  helper
  integration_test
  jbuilder
  job
  mailbox
  mailer
  migration
  model
  resource
  scaffold
  scaffold_controller
  system_test
  task

ActiveRecord:
  active_record:application_record

FactoryBot:
  factory_bot:model

Pundit:
  pundit:install
  pundit:policy

React:
  react:component
  react:install

Rspec:
  rspec:policy

Sidekiq:
  sidekiq:worker

TestUnit:
  test_unit:channel
  test_unit:generator
  test_unit:install
  test_unit:mailbox
  test_unit:plugin
  test_unit:policy
```

You can also use `g` as an alias for `generator` in the above command, like so:

```bash
bundle exec rails g
```

To get more information about what a generator can do, you can add `--help` or
`-h` to the generate command like so:

```bash
bundle exec rails generate generator_name --help
```

Make sure to replace generator_name in the above command with an appropriate
generator name.

In the next section we will see how we can use the generate command to generate
boilerplate code for migrations.

## Working with migration generators

Rails ships with a migration generator out of the box. Before using the
migration generator let's take a look at how to use it.

Run the following command to get more information on how to use the migration
generator:

```bash
bundle exec rails generate migration --help
```

Running the above command will fetch the following output:

```bash
Usage:
  rails generate migration NAME [field[:type][:index] field[:type][:index]] [options]

Options:
      [--skip-namespace], [--no-skip-namespace]              # Skip namespace (affects only isolated engines)
      [--skip-collision-check], [--no-skip-collision-check]  # Skip collision check
  -o, --orm=NAME                                             # ORM to be invoked
                                                             # Default: active_record

ActiveRecord options:
      [--timestamps], [--no-timestamps]      # Indicates when to generate timestamps
                                             # Default: true
      [--primary-key-type=PRIMARY_KEY_TYPE]  # The type for primary key
  --db, [--database=DATABASE]                # The database for your migration. By default, the current environment's primary database is used.

Runtime options:
  -f, [--force]                    # Overwrite files that already exist
  -p, [--pretend], [--no-pretend]  # Run but do not make any changes
  -q, [--quiet], [--no-quiet]      # Suppress status output
  -s, [--skip], [--no-skip]        # Skip files that already exist

Description:
    Generates a new database migration. Pass the migration name, either
    CamelCased or under_scored, and an optional list of attribute pairs as arguments.

    A migration class is generated in db/migrate prefixed by a timestamp of the current date and time.

    You can name your migration in either of these formats to generate add/remove
    column lines from supplied attributes: AddColumnsToTable or RemoveColumnsFromTable

Example:
    `bin/rails generate migration AddSslFlag`

    If the current date is May 14, 2008 and the current time 09:09:12, this creates the AddSslFlag migration
    db/migrate/20080514090912_add_ssl_flag.rb

    `bin/rails generate migration AddTitleBodyToPost title:string body:text published:boolean`

    This will create the AddTitleBodyToPost in db/migrate/20080514090912_add_title_body_to_post.rb with this in the Change migration:

      add_column :posts, :title, :string
      add_column :posts, :body, :text
      add_column :posts, :published, :boolean

Migration names containing JoinTable will generate join tables for use with
has_and_belongs_to_many associations.

Example:
    `bin/rails g migration CreateMediaJoinTable artists musics:uniq`

    will create the migration

    create_join_table :artists, :musics do |t|
      # t.index [:artist_id, :music_id]
      t.index [:music_id, :artist_id], unique: true
    end
```

According to the description of the migration generator, this command accepts a
migration name and an optional list of arguments. To understand this better
let's consider a hypothetical example of adding a `priority` column to the
`task` table which will accept integer values.

**Following command is only to present an example for generating a migration. Do
not run this command as it is not required for the Granite application.**

You can use the following command to generate the migration:

```bash
bundle exec rails generate migration AddPriorityToTask
```

Running the above command will generate the following migration:

```ruby
class AddPriorityToTask < ActiveRecord::Migration[7.0]
  def change
  end
end
```

The generated migration file contains the boilerplate code for a migration with
along with the `change` method.

Now it is up to you to add the relevant code which will add a new column to the
tasks table. We shall not be discussing that here. If you wish to understand how
that works you can refer to
[Rails migration](/learn-rubyonrails/rails-migration) and
[Rails migrations in depth](/learn-rubyonrails/rails-migrations-in-depth)
chapters.

If you recall, the description for migration generator also mentioned that the
command accepts arguments other than the migration name. We can pass the
attribute name and attribute type to the migration generator command in the form
of `add_column_name_to_table_name column_name:type` to pre-populate the change
method.

The following command will generate a migration with pre-populated `change`
method:

```bash
bundle exec rails d migration AddPriorityToTask priority:integer
```

The above command will generate the following migration file:

```ruby
class AddPriorityToTask < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :priority, :integer
  end
end
```

That was nice! Rails inferred the column name and table name from the migration
name itself and generated the code for that. Not just that, it even inferred the
column type from the command.

You can use other generators in a similar manner. For example, you can use the
controller generator to generate a controller and if you pass in the correct
arguments, Rails will pre-populate the generated controllers with actions.

Play around with the available generators to learn how they work and if you ever
get stuck, pass the `--help` flag to see how a particular generator works.

## Generating scaffold

So far we have seen how to use generators to generate a single migration or a
controller. Now, let us see how we can even generate multiple files using the
scaffold generator.

A scaffold in Rails is a full set of model, database migration for that model,
controller to manipulate it, views to view and manipulate the data, and a test
suite for each of the above.

The following command will generate a scaffold for a single resource called
`Task`:

```bash
bundle exec rails generate scaffold Task title:string
  invoke  active_record
    create    db/migrate/20210917025409_create_tasks.rb
    create    app/models/task.rb
    invoke    test_unit
    create      test/models/task_test.rb
    invoke  resource_route
     route    resources :tasks
    invoke  scaffold_controller
    create    app/controllers/tasks_controller.rb
    invoke    erb
    create      app/views/tasks
    create      app/views/tasks/index.html.erb
    create      app/views/tasks/edit.html.erb
    create      app/views/tasks/show.html.erb
    create      app/views/tasks/new.html.erb
    create      app/views/tasks/_form.html.erb
    invoke    resource_route
    invoke    test_unit
    create      test/controllers/tasks_controller_test.rb
    create      test/system/tasks_test.rb
    invoke    helper
    create      app/helpers/tasks_helper.rb
    invoke      test_unit
    invoke    jbuilder
    create      app/views/tasks/index.json.jbuilder
    create      app/views/tasks/show.json.jbuilder
    create      app/views/tasks/_tak.json.jbuilder
    invoke  assets
    invoke    scss
    create      app/assets/stylesheets/tasks.scss
    invoke  scss
    create    app/assets/stylesheets/scaffolds.scss
```

A scaffold generator can be used to speed up the development process.

It is worth mentioning the `-p` flag here. If you add this to the command it
will simply do a test run and show you what files will be generated without
actually generating them, like so:

```bash
bundle exec rails generate scaffold Task title:string -p
```

If everything looks good, run the command again without the `-p` flag.

Under the hood, scaffold generator invokes different generators separately to
generate the files. Since each generator has a single responsibility, they are
easy to reuse, avoiding code duplication.

For instance, the scaffold generator invokes the scaffold_controller generator,
which invokes erb, test_unit and helper generators.

This allows us to add/replace/remove any of those invocations. Let's see how we
can customize a scaffold generator as per our requirements.

Suppose we do not want to generate the `app/assets/stylesheets/scaffolds.scss`
and test fixture files when scaffolding a new resource. We can do so by updating
`config/application.rb` with the following lines of code:

```ruby
config.generators do |g|
  g.test_framework  :test_unit, fixture: false
  g.scaffold_stylesheet false
end
```

## Rails destroy command

Suppose you wish to undo the changes introduced by a generator. Manually going
through all the changes and undoing them will be very time consuming and you
might end up changing something you didn't intend do.

Rails comes with an easy solution for this. You can reverse the changes
introduced by a generator using the `destroy` command, like so:

```bash
bundle exec rails d scaffold Task title:string
```

You can also use the `destroy` command to delete certain files. You just need to
pass the relative path of the file to the command.

You can replace `destroy` with the alias `d` in the above command.

## Rails command line executable

In this chapter we have so far discussed the `generate` and `destroy` commands
in Rails. There are a few more commands that are absolutely critical to your
everyday usage of Rails.

Let's take a brief look at those commands.

1. **bundle exec rails new app_name**

This command generates a new Rails application. It creates the entire Rails
directory structure with all the code you need to run a simple application right
out of the box.

2. **bundle exec rails server**

This command launches a local development server named `Puma` which comes
bundled with Rails. You'll use this any time you want to access your application
through a web browser.

You can also replace `server` with the alias `s` to launch the server.

3. **bundle exec rails console**

The console command lets you interact with your Rails application from the
command line. It uses `IRB` under the hood.

You can also replace `console` with the alias `c` to invoke the console.

4. **bundle exec rails test**

This command lets you run the tests you have added in your Rails project. You
can either all the tests at once, like so:

```bash
bundle exec rails test -v
```

Or you can run tests from a specific test file by passing the relative path of
the test file to the above command, like so:

```bash
bundle exec rails test -v test/models/user_test.rb
```

You can also replace `test` with the alias `t` to run the tests.

Passing the `-v` flag in above command is completely optional. Doing so
generates an output with higher verbosity.

5. **bundle exec rails db:create**

When you create your Rails application for the first time, it will not have a
database yet. You will need to make sure the database is up and running before
implementing the CRUD features.

This command lets you create a database if it doesn't already exist.

6. **bundle exec rails db:migrate**

Every time you create a database migration that adds or deletes a row or a
column, creates a new table, you have to run this command for the changes to
reflect in your database.

7. **bundle exec rails routes**

This command will list all of your defined routes, giving you a good overview of
the URLs in your application.

## Creating a Rails app from a specific Rails commit

Suppose the latest Rails release was 10 days ago and you want to use the Rails
version from a commit different than the latest release. To do so you can update
the `rails` gem line within `Gemfile` like so:

```ruby
gem "rails", git: "git://github.com/rails/rails.git", ref: commit_id
```

Replace the `commit_id` with the commit id you wish to use. For example if the
commit id is `a8d088f`, then update the `gemfile` like so:

```ruby
gem "rails", git: "git://github.com/rails/rails.git", ref: "a8d088f"
```

You also have an option to pass the branch along with the commit id. If you do
not pass the branch name then the default branch would be `main`. If you don't
pass a commit id then the Rails version from latest commit in the `main` branch
will be used.

**This is an in-depth chapter and hence you do not need to commit any of these
changes.**
