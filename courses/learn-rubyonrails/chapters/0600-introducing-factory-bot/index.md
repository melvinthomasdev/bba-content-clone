## Issues with fixtures

By default, Rails creates a `test/fixtures` directory and recommends we use
fixtures for testing. Fixtures are simple and straightforward. The data that we
see in a fixture are directly loaded into the database. Models are not involved
in loading the fixture data into the database.

Since Active Record models do not need to be instantiated, no callbacks need to
be run loading fixture data into the database is super fast.

However since callbacks are not run the fixtures quickly get out of sync with
the business logic. Let's say that we have created a model called `Tax`. In the
beginning the social security number (SSN) was not a required field. So some
records in fixtures had nil values for SSN. Later SSN became a required field.
Now we need to update all the fixture records.

In the `Task` model in our application there is a callback to create `slug`.
Ideally fixtures should not have any slug value since the model will compute the
slug value when the record is created. However when fixtures are loaded then
models are not created. So if we do not have put slug value in the fixture then
the INSERT operation in the database will fail since the column `slug` is not
nullable. To solve this problem we have no choice but to put the slug value in
the fixtures. However if later we change the business logic of how the slug
value is computed then the slug values already in the database are now out of
sync with the business logic.

What we want is fixtures to be loaded using models so that all these problems go
away.

Maintaining relationships between the two different fixture records is hard.
Let's say that we have a `Tax` record for a `User`. Ensuring that these two
records are related to each other is cumbersome and not obvious.

Hence we prefer to use
[factory-bot](https://github.com/thoughtbot/factory_bot_rails) over fixtures.

## What is factory bot?

While writing tests in the previous chapters, we were hardcoding users in the
setup method. What if our `users` model is a bit more complex and we needed 10
different users for testing? It would be tedious to hardcode data for all of
them.

Things would get much more complicated if we have models with relations. Say,
for example, we have a new model `Comment` which `belongs_to` the `Task` model.
To create a new test comment, we will have to create a new task. Since tasks can
not exist without user, we will have to create a new user too. And on top of
that, we'd also have to manually take care of creating these in the proper
parent-child relationship order.

That is why we need fake data generators. They can help us in generating any
number of test records.

This will help us with focussing on the actual testing logic and not worry about
creating demo data. The only thing we need to do is to define what kind of data
each field accepts.

The fake data generator suggested by Rails is `fixtures`. However fixtures data
is directly loaded into the database. The process of loading the data using
fixtures does not run callbacks and this causes data to get out of sync.

In stead of `fixtures` we will be using
[factory_bot](https://github.com/thoughtbot/factory_bot).

`factory_bot` becomes much more powerful when it is coupled with `faker`.

## What is Faker?

[Faker](https://github.com/faker-ruby/faker) is a Ruby gem that can give us
real-looking test data for various cases.

Faker has a huge set of well-organized and well-documented test data. Invoking
faker's data retrieving method gives us any random value corresponding to that
set. For example:

- To generate the name of users, we can use the method
  [`Faker::Name.name`](https://github.com/faker-ruby/faker/blob/master/doc/default/name.md).
- For phone numbers, we can use
  [`Faker::PhoneNumber.phone_number`](https://github.com/faker-ruby/faker/blob/master/doc/default/phone_number.md).
- For email we can use
  [`Faker::Internet.email`](https://github.com/faker-ruby/faker/blob/master/doc/default/internet.md).
  We have only touched the surface of the gem. There are a lot of methods from
  `faker`, which you can read about in their
  [official documentation](https://www.rubydoc.info/gems/faker/Faker).

## Setting up factory bot and Faker

Now, let us start setting up these gems for our project.

Please note that the following two gems are added explicitly under the
`development` and `test` groups. Please ensure that you copy paste the following
code block as it's in-order to avoid dependency errors while say running tests,
etc.

First, we need to install the required gems. Open `Gemfile` and add the
following lines as it's to the end of this file:

```ruby
group :development, :test do
  # Rails integration for factory_bot, a replacement for fixtures
  gem 'factory_bot_rails'

  # For auto-generating demo data
  gem 'faker'
end
```

Now, install those gems by running this command:

```bash
bundle install
```

All of the test classes inherit from `ActiveSupport::TestCase`. So, if we
include the helper methods of factory-bot into `ActiveSupport::TestCase`, we
will be able to use them across all of them.

Open `test/test_helper.rb` and add the following line:

```ruby {8}
# ...previous code...
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  include ActionView::Helpers::TranslationHelper
  include FactoryBot::Syntax::Methods

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors) unless ENV['COVERAGE']

  # Add more helper methods to be used by all tests here...
end
# ...previous code...
```

Let us, now, rewrite our previous user model tests using factory-bot.

## Defining factories

First, we need to define what kind of data, each field should be populated with.
We can do this by creating a new factory definition for each model.

Let us begin by creating the required folder and files:

```bash
mkdir test/factories
touch test/factories/user.rb
```

Open `test/factories/user.rb` and populate it with the following content:

```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { 'welcome' }
    password_confirmation { 'welcome' }
  end
end
```

In the above code, we use `faker` to retrieve random `name` and `email` and then
we associate it with the corresponding fields in the `User` class. We are
hardcoding the password and its confirmation as `'welcome'` for our convenience.

Internally, whenever we request to generate a new user, these methods will be
invoked and their results will be assigned to `User`'s fields. That is, the
result of `Faker::Name.name` will be set as `name`, `'welcome'` will be assigned
to the `password` field, and so on.

As you can see, this factory definition is labeled as `:user`. So whenever we
need to generate a new user, we will be referencing this factory using the
symbol `:user`.

All our setup is now done. Now we can generate demo users in the test cases by
referencing this factory.

## Generating fake data

`create` and `build` are the methods from `FactoryBot::Syntax::Methods`, that we
can use to generate fake data.

As their name hints, the `create` method writes the demo data to DB and then
returns its reference whereas the `build` method generates the record as an
object in memory and then returns its reference. In other words, the `create`
method is similar to the `model.create!` and the `build` method is similar to
`model.new`.

Now, let us see it in action. Open the `test/models/user_test.rb` file and
replace its setup method with the following:

```ruby {4-6}
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = build(:user)
  end

  # ...previous code...
end
```

As discussed earlier, `build(:user)` will automatically create an instance of
`User` using the factory we have defined earlier.

We had hardcoded user data in the `test_users_should_have_unique_auth_token`
test case too. As you might have noticed, we are creating and saving a new user
into the DB there. So, there, we should use `create(:user)` instead of
`build(:user)`.

Update the test case with the following change:

```ruby {3}
def test_users_should_have_unique_auth_token
  @user.save!
  second_user = create(:user)

  assert_not_same @user.authentication_token,
    second_user.authentication_token
end
```

Our code looks much cleaner now.

All our tests should run smoothly as earlier. Try running them and see the
results:

```bash
bundle exec rails test -v test/models/user_test.rb
```

## Rails console in test env

We can start our Rails console in the test environment using the following
command:

```bash
bundle exec rails console -e test
```

The `FactoryBot` is locked for the test environment only. By using the Rails
console in the test environment we can work directly with `FactoryBot` and check
how factories are performing. We can debug our factories and tests using this
console. This way we don't have to run the test suite to check the working of
our factories.

Let's create a user using the factory:

```bash
Loading test environment
>> user = FactoryBot.create(:user)
```

We can also use this Rails console in sandbox mode so that all the changes will
be rolled back when we exit the console. We can open the Rails console in
sandbox mode like this:

```bash
bundle exec rails console -e test --sandbox
```

Let us commit the changes before we proceed to the next chapter:

```bash
git add -A
git commit -m "Integrated factory-bot and faker"
```
