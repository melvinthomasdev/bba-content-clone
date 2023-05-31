## What are we building?

Let's learn Rails by building a simple web application. Let's name it `granite`,
after a [type of rock](https://en.wikipedia.org/wiki/Granite).

The application will be a simple todos for a whole company of small size. The
application will have the following features.

- Users will be able to prioritize the tasks by starring them. These starred
  tasks will be shown first in the list.
- Users can toggle the task as pending or done.
- Task creators can delete/edit the task.
- Users can add comments to the tasks. These comments cannot be edited/deleted.

Our goal is to learn the process of writing a Ruby on Rails application with
React.js.

## Live application

[Here's](https://granite-production.neetoreviewapp.net/) the working demo of the
application.

Use the following credentials to login:

```text
email: oliver@example.com
password: welcome
```

If the above credentials don't work, then create a sign-up with a new user from
the UI and login with those new credentials.

## Setting up a new Rails application

Let's build a brand new Rails application. Rails offers us a command-line
utility to build a brand new Rails application.

Run this command to generate a new Rails application with a specific Rails
version:

```bash
rails _7.0.3.1_ new granite --skip-turbolinks
```

It will produce a long output and might take some time to complete. It is
downloading and setting up required files from the internet.

## Setting a specific Webpacker version

First, we need to run the `yarn install` command to generate the Yarn lockfile,
like so:

```bash
yarn install
```

Remove the `app/javascript` directory as it has some unwanted files. When we
install `webpacker` it will create the `app/javascript` folder with the required
files.

Remove the `app/javascript` folder with the following command:

```bash
rm -rf app/javascript
```

To install `webpacker`, add the `webpacker` gem towards the end of the file
named `Gemfile`, like so:

```rb
# For compiling and bundling JavaScript. Read more: https://github.com/rails/webpacker
gem "webpacker"
```

Run the following command from the terminal to install the newly added gem that
is `webpacker`:

```bash
bundle install
```

Now, we can set up the base for `webpacker` by running the following command
from the terminal:

```bash
bin/rails webpacker:install
```

Then, run the following command from the root of the project, in the terminal:

```bash
yarn remove @rails/webpacker webpack-dev-server webpack webpack-cli
yarn add @rails/webpacker@5.4.0
yarn add -D webpack-dev-server@3.11.2 --exact
```

If you're curious about why we use a specific version of `webpacker` module, you
can give
[this section](/learn-rubyonrails/webpacker-in-depth#webpacker-module-and-version-issues)
a read and come back. The `webpack-dev-server` package also needs to be a
specific version that can work in conjunction with this Webpacker version. Else
it will complain about installing `webpack-cli`.

## Update to stylesheet pack tag

The default Rails application ERB template file,
`app/views/layout/application.html.erb`, contains:

```erb
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
<%= javascript_importmap_tags %>
```

In that file, we need to replace `stylesheet_link_tag` with
`stylesheet_pack_tag` and `javascript_importmap_tags` with `javascript_pack_tag`
to attach CSS and JavaScript packs.

Thus update it like so:

```erb {1,2}
<%= stylesheet_pack_tag 'application' %>
<%= javascript_pack_tag 'application' %>
```

We will discuss in depth about why we need to do this replacement towards the
end of the book.

If you're very curious and don't mind the verbosity/complexity at this early
stage itself, then you can give
[this section](/learn-rubyonrails/webpacker-in-depth#significance-of-stylesheet-pack-tag)
a read to understand about Webpacker's CSS compilation in depth.

## Configuring default Ruby and Node.js versions

We can lock our application with a specific Ruby and Node.js version. This will
help us to isolate the dependencies of Ruby and Node.js modules used in the
application.

In our application, we will use Node.js version `16.5` and Ruby version `3.1.2`.

Run the following commands from the terminal:

```bash
echo "16.5" > .nvmrc > .node-version
echo "3.1.2" > .ruby-version
```

These files will be read by `rbenv` and `nvm` to auto-set the versions.

Now run the following commands from the terminal to ensure that our project is
currently using these specified versions:

```bash
rbenv install
nvm install
```

The above commands should ideally point out that the specified versions are
already installed and you can safely exit. If that's not the case, then please
go ahead with the installation of the required versions, using the same
commands.

### Fixing rexml gem issue

We are not going to use some of the auto-generated gems for testing. Thus let's
remove those unwanted gems, among which there are `selenium` based gems that may
cause `rexml` dependency issue.

Run the following command from the terminal:

```bash
bundle remove capybara selenium-webdriver webdrivers
```

The above command should've removed those unwanted gems from the `Gemfile`.

### Remove unwanted gems

Some gems come pre-installed in Rails 7 but are not required for our Granite
application like `importmap-rails`, `turbo-rails`, and `stimulus-rails`.

Remove the following lines, including the comments, from the `Gemfile`:

```ruby
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
```

Then update the `Gemfile.lock` file by running the following command:

```bash
bundle install
```

### Updating .gitignore file

We don't need all of the generated files to be version-controlled. To ignore
these unwanted files, we specify them in the `.gitignore` file. BigBinary has
specified a standard set of folders and files to be ignored by git in the
[Wheel repository](https://raw.githubusercontent.com/bigbinary/wheel/main/.gitignore).

Run the following command from the terminal, in the root of the project, to use
that config:

```bash
curl -o ".gitignore" "https://raw.githubusercontent.com/bigbinary/wheel/main/.gitignore"
```

Now the `.gitignore` file should be visible in your project's root.

## Removing fixtures

In a future chapter, we will see why we are removing fixtures. For now, let's
just go ahead and disable the fixtures.

To disable using fixtures open `test/test_helper.rb` and comment out the line
shown below.

```ruby
# fixtures :all
```

Execute the following lines on the terminal to delete the fixtures folder
completely:

```bash
rm -rf test/fixtures
```

### Ensure fixtures won't get generated

Rails provide several generator commands that help in generating boilerplate
code for models, controllers, migration scripts, etc. We will be using them
throughout the book.

But, with some of those generators, fixture files also get generated by default.
We won't need those fixture files.

Fortunately, we can customize Rails generators to disable the auto-generation of
fixtures for all the commands.

To do that, add the following lines in `config/application.rb`:

```ruby {10-12}}
require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module Granite
  class Application < Rails::Application
    # previous code if any

    config.generators do |g|
      g.test_framework :test_unit, fixture: false
    end
  end
end
```

For simple applications, we can always rely on using `ActiveRecord` queries to
create seed data for tests instead of fixtures. We will learn about them in the
upcoming chapters.

## Creating database

[SQlite3 database](https://www.sqlite.org/index.html) is the default database
for a newly created Rails application.

Run this command to create databases for our application:

```bash
bundle exec rails db:create
```

The output will look like this:

```text
Created database 'db/development.sqlite3'
Created database 'db/test.sqlite3'
```

## Starting the server

Now let's start the server. Run this command:

```bash
bundle exec rails server
```

The output would look like this:

```text
=> Booting Puma
=> Rails 7.0.4 application starting in development
=> Run `bin/rails server --help` for more startup options
Puma starting in single mode...
* Puma version: 5.6.5 (ruby 3.1.2-p20) ("Birdie's Version")
*  Min threads: 5
*  Max threads: 5
*  Environment: development
*          PID: 16385
* Listening on http://127.0.0.1:3000
* Listening on http://[::1]:3000
Use Ctrl-C to stop
```

Open the browser and visit [http://localhost:3000](http://localhost:3000). We
will see a page that would look like this:
<image>new-rails-project-landing-page.png</image>

## Verify Ruby and NodeJS versions

Before committing the files, let's verify whether our Ruby and Node.js versions
are the required versions or not, by running the following commands from the
terminal:

```bash
rbenv version # should be 3.1.2
nvm version # should be 16.5
```

Also from the root of the project run the following command to double-verify
that Ruby is set to the required version:

```bash
ruby -v # should be 3.1.2
```

Another final point of verification is the version line in the `Gemfile`, which
can be found at the root of the project. The following line with required
version should be present within the `Gemfile`:

```ruby
ruby "3.1.2"
```

If the Ruby version is not matching the `rbenv` set version, then it means that
there is a system-level Ruby version that is taking precedence. In that case,
you'd have to set the Ruby version globally as mentioned in the
[previous chapter](/learn-rubyonrails/installing-ruby-on-rails#installing-ruby-on-rails-on-macos).

Once verified, add this new application to git:

```bash
git add -A
git commit -m "Initial commit"
git rm -r --cached . # to reapply gitignore
git add -A
git commit -m "Applied gitignore"
```
