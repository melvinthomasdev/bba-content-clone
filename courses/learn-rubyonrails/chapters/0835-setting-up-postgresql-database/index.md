## PostgreSQL database setup

We at BigBinary use [PostgreSQL](https://www.postgresql.org/) database on
Heroku.

When our application is deployed to Heroku, it will be running in `production`
mode.

We can install PostgreSQL by using Homebrew(preferred) or by using
`Postgres.app`. Go through the next sections to understand how to install and
use PostgreSQL.

### Install PostgreSQL using Homebrew

```bash
brew install postgresql
```

The `config/database.yml` file should look like this:

```yaml
<% branch_name = `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '') %>
<% repository_name = `git rev-parse --show-toplevel`.split('/').last.strip %>

default: &default
  adapter: postgresql
  encoding: unicode
  host: <%= ENV['PG_HOST'] %>
  pool: 5
  username: <%= ENV['PG_USER'] %>
  password: <%= ENV['PG_PASSWORD'] %>

development:
  <<: *default
  database: <%= "#{repository_name}_development" %>

test:
  <<: *default
  database: <%= "#{repository_name}_test" %>

heroku:
  <<: *default
  database: <%= "#{repository_name}_heroku" %>

staging:
  <<: *default
  database: <%= "#{repository_name}_staging" %>

production:
  <<: *default
  database: <%= "#{repository_name}_production" %>
```

The env variables in the config will be populated during runtime. If you prefer
to hardcode the values for `PG_USER` etc, then you can do that. The
`config/database.yml` should be ignored via `.gitignore`. It should never be
committed to your Git tree.

After installing PostgreSQL, you can check the version you are running by
executing:

```bash
postgres -V
```

Once the installation is complete we need to start PostgreSQL service to use
postgresql in our project:

```bash
brew services start postgresql
```

You can check if the PostgreSQL is working properly and accepting responses by
running the following command:

```bash
pg_isready
```

This should return an output similar to:

```bash
/tmp:5432 - accepting connections
```

Sometimes the above mentioned `postgres` installation method leads to a
`Library not loaded` error like this:

<image alt="Library not loaded error">postgres-lib-not-loaded-error.png</image>

The issue is that even after using command the `brew install postgres`, brew
might install a specific version like version 14. Then all the `postgres`
related libraries will be tracked under a directory named as `postgres@14`. But
when the `pg` gem is installed without passing in any config, it will always
look for the folder named as `postgres` without any versioning. And this
difference in folder name results in the `Library not loaded` error.

To fix this issue reinstall the `postgres` with the version, like this:

```bash
brew reinstall postgresql@14
```

This will inform the `pg` gem to look for `postgres@14` directory and the
`postgres` library will be loaded successfully.

### Handle services using brew

In macOS, services are the files ending with the `.plist` file extension. Let's
see what all services your mac has. Go to `~/Library/LaunchAgents` or
`/Library/LaunchAgents` and look for the files ending with `.plist`. All those
`.plist` files are the services installed on your mac.

`launchctl` is a tool used for managing services in macOS. `launchctl` loads and
unloads services that will start automatically at login.

We can load the services at the time of login with `launchctl` like this:

```bash
launchctl load $PATH_TO_LIST
```

We can also unload the services, like this:

```bash
launchctl unload $PATH_TO_LIST
```

So to run a service we need the `.plist` file location and the `launchctl`
commands to run it. But it's not possible to remember `.plist` file location.
Also, `launchctl` commands are complex and hard to remember. We can deal with
services without the knowledge of `.plist` file locations and the `launchctl`
commands using Homebrew. Homebrew provides an interface to handle services with
ease.

We can start a `postgresql` service with Homebrew, like this:

```bash
brew services start postgresql
```

The above mentioned command runs the postgresql's `.plist` file using the
`launchctl`.

If the system has multiple versions of `postgresql`, then we will have to
specify the version like this:

```bash
brew services start postgresql@14
```

We can check all the versions installed for `postgresql`, like this:

```bash
brew list --versions postgresql
```

We can restart the service, like this:

```bash
brew services restart postgresql@14
```

We can check all the currently loaded services like this:

```bash
brew services list
```

For more Homebrew commands refer
[this cheat sheet](https://devhints.io/homebrew) from `devhints.io`.

### Install PostgreSQL using Postgres app

If you are using a macOS and if you are not able to setup PostgreSQL via
Homebrew as mentioned in the above section, then
[Postgres.app](http://postgresapp.com) is another option.

The `config/database.yml` file for the `Postgres.app` should be like this:

```yaml
<% branch_name = `git symbolic-ref HEAD 2>/dev/null`.chomp.sub('refs/heads/', '') %>
<% repository_name = `git rev-parse --show-toplevel`.split('/').last.strip %>

# Check https://gist.github.com/neerajdotname/b9d53f8a234da9d8c007de5e3d98bc21 to see
# details about the restriction on database name

# If you prefer to have branch name in the database name then use following
# database: <%= "#{repository_name}_development_#{branch_name}"[0...63] %>

development:
  adapter: postgresql
  database: <%= "#{repository_name}_development"[0...63] %>
  host: localhost
  pool: 5

test:
  adapter: postgresql
  database: <%= "#{repository_name}_test"[0...63] %>
  host: localhost
  pool: 5
```

Please note that the `config/database.yml` file to be added after `brew install`
will be defined in the upcoming chapters and it is different from the one
defined for the `Postgres.app` installation.

Given that currently, we are using PostgreSQL only in the production
environment, we don't need to make any modifications to the
`config/database.yml` file. The `config/database.yml` file is anyways ignored by
Git. The use case of that file is only in local environments. We will learn more
about the same in the upcoming chapters.

## Update Gemfile to use PostgreSQL

Installing and configuring "PostgreSQL" on a personal laptop can be tricky. So
here is what we are going to do.

We will use the `sqlite3` gem for both the `development` and `test`
environments.

We will use the `pg` gem only in the `production` environment. In this way, we
do not have to install `PostgreSQL` on our laptop.

Modify `Gemfile` to use `sqlite3` only in the development and test environment.

Note that in the following code, we have added `group`. It allows us to specify
the environment in which we want to use a particular gem:

```ruby
gem 'sqlite3', '~> 1.4', :group => [:development, :test]
```

Now let's add the `pg` gem for `production`:

```ruby
gem 'pg', :group => [:production]
```

The `=>` representation is called the hash-rocket representation and this is an
older way of writing the newer JSON-style representation, which is
`group: [:production]`.

Install the gems:

```bash
bundle install
```
