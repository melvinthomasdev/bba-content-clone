This chapter combined with the
[Configuring and connecting to a database chapter](/learn-rubyonrails/configuring-and-connecting-to-a-database)
will give you insights into how we can set up our Rails application to use
`PostgreSQL`.

We had already installed Postgres while deploying the application to Heroku in
[Deploying application on heroku chapter](/learn-rubyonrails/deploying-application-on-heroku#install-postgresql-in-the-system).

You don't need to make the following changes to the `granite` application since
we have already done a lot using `SQLite`.

All migrations shown in this chapter are only shown as an example. Do not make
these changes in the Granite application.

### Update Gemfile to use PostgreSQL

We had already added the `pg` gem for the `production` environment, like so:

```ruby {3}
gem 'jbuilder', '~> 2.7'

gem 'pg', :group => [:production]

gem 'bcrypt', '~> 3.1.13'
```

You can modify the `Gemfile` entry for `pg` and make it available for all
environments, like so:

```ruby {3}
gem 'jbuilder', '~> 2.7'

gem 'pg'

gem 'bcrypt', '~> 3.1.13'
```

Install the gem:

```bash
bundle install
```

## Using UUID as primary key

UUIDs are a popular alternative to auto-incremental integer primary keys. Using
UUIDs as the id in your Rails models instead of incrementing integers helps you
avoid collisions. The UUIDs are globally unique, meaning you can know that
different models cannot possibly have the same id.

With an incrementing integer id the size of your data can be inferred from the
outside i.e. id 5 is the fifth record created. With UUIDs no-one can guess the
size of your database tables, which might be information you are keen to keep
secret. You can get round this by generating ‘public ids’ or ‘slugs’ for exposed
URLs… but then, why not use a built-in tool?

Ruby on Rails has had the ability to use UUIDs as the id for Active Record
models since version 5.0.

For `PostgreSQL >= 9.4`, Active Record will now use `pgcrypto’s gen_random_uuid`
function whereas previously `uuid-ossp’s uuid_generate_v4` function was used.

However, we can not use the `gen_random_uuid` function directly. It will give an
error mentioning "function gen_random_uuid() does not exist". We first need to
enable the `pgcrypto` extension for the database.

Follow the next steps to enable the `pgcrypto` extension and add UUID primary
keys to your Rails 7.0.5 application.

### Add a migration

First you need to enable the `PostgreSQL pgcrypto extension` in a migration.
Lets start by creating a blank migration:

```bash
rails generate migration enable_pgcrypto_extension
```

Then change the file to enable the extension. It should look something like
this:

```ruby
class EnablePgcryptoExtension < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
  end
end
```

### Change the primary default type

When you generate models Active Record will use `Integer` as the type for id by
default. From Rails 5 you can change this behaviour by adding the following to
your `config/application.rb` file:

```ruby
config.generators do |g|
  g.orm :active_record, primary_key_type: :uuid
end
```

This changes the default column type for primary keys, configuring your
migration generator to set `id: :uuid` for new tables.

When you run `rails generate model post title:string` your migration file will
look something like this:

```ruby
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts, id: :uuid do |t|
      t.string :title

      t.timestamps
    end
  end
end
```

## Using citext

Text fields in Postgres are case-sensitive. We may encounter problems when we
use text fields to store E-Mails, as SamSmith@example.com and
samsmith@example.com will not be considered the same.

The best way to get around this is to define the `email` field with `citext`
type, which is available in the
[citext module](https://www.postgresql.org/docs/9.1/citext.html).

If you want to change an existing column to be of type `citext`, here is an
example Rails migration to achieve this:

```ruby
class ChangeEmailToCitext < ActiveRecord::Migration
  def change
    enable_extension("citext")

    change_column :users, :email, :citext
  end
end
```

Also, you can add an index to this column:

```ruby
class AddIndexToUsersEmail < ActiveRecord::Migration
  disable_ddl_transaction!

  def change
    add_index :users, :email, unique: true, algorithm: :concurrently
  end
end
```

One more key step required in transitioning to `PostgreSQL` is to setup the
database configuration as mentioned in the chapter named
["Configuring and connecting to a database"](/learn-rubyonrails/configuring-and-connecting-to-a-database#using-databaseyml).

We at BigBinary use the `devise` gem in most of our projects. The
[devise gem](https://github.com/heartcombo/devise) is a very popular
authentication gem in the Rails community.

The `devise` gem automatically lowercases the email field before storing it in
the database. Thus we won't have to add `citext` into our Gemfile if using
`devise`.

## PostgreSQL database directory

The database configuration file is in `config/database.yml`. The PostgreSQL
database itself however resides in a central location on your local machine.
Rails uses the information present in the `config/database.yml` file to connect
to the database. Once the connection is established, your data is stored in the
PostgreSQL database outside of your application.

To find the database directory, open the `psql` terminal and enter the following
command:

```bash
SHOW data_directory;
```

You can also open the Postgres.app application on your Mac then, click on
`Server settings`, and a dialog box will be opened, containing a bunch of
information along with the path to the data directory.

There is **nothing to commit** in this chapter since we do not intend to use
`PostgreSQL` in our `granite` application across all environments.
