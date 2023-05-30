There are two ways to connect to a database in a Rails application.

## Using only an environment variable

Ruby on Rails support environment variables out of the box. Sometimes, we can't
commit some configurations to a repository. In such cases we use environment
variables.

We can set `DATABASE_URL` environment variable to connect to a particular
database. In platforms like `heroku` and all, they provide us with the option to
explicitly set these env variables, within their dashboards itself. The
following is an example of how the database URL for connecting to a `postgresql`
adapter would look like:

```bash
ENV['DATABASE_URL'] # => "postgresql://localhost/granite_development?pool=5"
```

This method is not used in the development environment. Though this can be
useful in `production` and `heroku` environment. In development, we use
`config/database.yml`.

## Using database.yml

We can specify all the database connection details in `config/database.yml`
file. Using following snippet, a Rails application can connect to a Postgres
database:

```ruby
development:
  adapter: postgresql
  database: granite_development
  pool: 5
  username: postgres
  password: YourPostgresPassword
```

### Don't commit config/database.yml

We don't commit `config/database.yml` in a git repository. There are two reasons
for this.

1. We don't want to disclose database password information of the committer.
2. Every developer's database details can be different i.e. username and
   password. Every time we push the code, there will be a conflict in a file.

### If config/database.yml is missing

As mentioned `config/database.yml` is not pushed to the repository. So when we
clone a new repository, this file will be missing.

Generally, a Rails application will have a `config/database.yml.example` or a
`config/database.yml.postgresql` file.

We can copy the content of any of these files into a new file named
`config/database.yml`, so as make connection with `pg` gem:

```bash
cp config/database.yml.postgresql config/database.yml
```

If no example file is present, you can copy content from the
[example database.yml](https://gist.github.com/datt/e12fa0da294e7a8f3ac96abee346a098)
for your application's database.

## Config options

We can check selected database's connection config with
`ActiveRecord::Base.connection_config`. We might need to configure more options.
Now, let's try to understand some of the common database config options:

```ruby
host - Defaults to "localhost". This can also be a remote database URL.
port - Port number, Defaults to 5432 for postgres.
username - Username of the database.
password - Password for the database.
database - The name of the database.
encoding - (Optional) Sets the client encoding.
connect_timeout - The timeout to establish a new connection to the database before failing.
read_timeout - The time to receive data after connected.
pool - Maximum number of connections to database per application.
  Defaults to 5.
  e.g. 2 * 16 (puma) + 1 * 10 (sidekiq) = 42
  here, 2 - puma processes, each process has 16 threads
        1 - sidekiq process, each process has 10 threads
```

## Connection preference

In case, we use both `config/database.yml` and ENV['DATABASE_URL'] then
configuration will be merged together. Please refer
[Rails guides](https://gist.github.com/datt/e12fa0da294e7a8f3ac96abee346a098)
for the merge strategy.

There is **nothing to commit** in this chapter since we have intentionally
specified `config/database.yml` as untracked using the `.gitignore` file.
