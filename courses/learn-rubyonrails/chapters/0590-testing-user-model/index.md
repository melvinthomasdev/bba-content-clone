## Why write tests?

Testing is an important aspect of software development life cycle. When our
application grows in size, we are likely to refactor a lot of code. Writing
tests helps ensure that changes made to the code do not break the desired
functionality.

Tests also help us understand the functionalities of the project. For example,
let's say that there were 3 developers working on a project. All of a sudden due
to urgent requirements, a developer had to move into another project and a new
developer replaced that position.

Then one of the easiest and thorough ways of understanding the codebase, is by
reading the test cases corresponding to each entity.

Rails provides a very easy way of writing tests.

## Test setup

When a new Rails application is created using `rails new` command, Rails
automatically creates a directory called `test`.

The following is an example of the structure of the `test` directory:

```
$ cd test
$ tree
.
├── carriers
├── channels
│   └── application_cable
│       └── connection_test.rb
├── controllers
│   └── tasks_controller_test.rb
├── helpers
├── integration
├── jobs
├── mailers
├── models
├── system
├── services
└── test_helper.rb
```

Most of the directory names suggest what kind of tests it can contain.

Integration tests are responsible to test interactions between controllers while
system tests are responsible to test the app as per user's experience on a
browser and includes testing JavaScript code.

In this book we won't be covering system tests. Rather we give more precedence
to `model`, `controller`, `job`, `carrier`, and `service` tests.

The `test_helper.rb` file holds the configuration for all the tests. This file
will be loaded in all the test files to load the test configurations.

## The setup method

Every test runs independently of each other. The data we create in one of the
tests won't be affecting the next one. So we will have to create new data every
time we run a new test.

This is where the `setup` method comes in handy. Rails will run this method
automatically before every test. So, we can use this method to run common tasks
like setting up data, loading configuration data, etc.

Create a new file `test/models/user_test.rb` and populate it with the following
content:

```ruby
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Sam Smith",
                     email: "sam@example.com",
                     password: "welcome",
                     password_confirmation: "welcome")
  end

  # embed new test cases here...
end
```

## Adding tests for User model

All the following test cases are self-explanatory, in the sense, reading the
test case name itself will give you an idea about what we are testing.

Method names for test cases must start with `test_` for them to be executed
while running the tests. It is so because a test class is like any other Ruby
class and it can have methods other than the test cases.

It doesn't make sense to invoke all methods inside a test class rather only test
cases should be executed. Hence to differentiate between test cases and other
methods, you should prefix the test cases with `test`.

Doing so will allow Rails to run only test cases and skip other methods inside a
test class while running the tests.

The following test cases should be added after the `setup` method in
`test/models/user_test.rb`.

First, we can add a validation test case for ensuring presence of `name` when
creating a user:

```ruby
def test_user_should_not_be_valid_and_saved_without_name
  @user.name = ''
  assert_not @user.valid?
  assert_includes @user.errors.full_messages, "Name can't be blank"
end
```

We can also write a test to validate length of the value assigned to `name`
field:

```ruby
def test_name_should_be_of_valid_length
  @user.name = "a" * (User::MAX_NAME_LENGTH + 1)
  assert @user.invalid?
end
```

Let's add validations ensuring that the `email` field works as intended:

```ruby
def test_user_should_not_be_valid_and_saved_without_email
  @user.email = ""
  assert_not @user.valid?

  @user.save
  assert_includes @user.errors.full_messages, "Email can't be blank", "Email is invalid"
end

def test_user_should_not_be_valid_and_saved_if_email_not_unique
  @user.save!

  test_user = @user.dup
  assert_not test_user.valid?

  assert_includes test_user.errors.full_messages, "Email has already been taken"
end

def test_reject_email_of_invalid_length
  @user.email = ("a" * User::MAX_EMAIL_LENGTH) + "@test.com"
  assert @user.invalid?
end

def test_validation_should_accept_valid_addresses
  valid_emails = %w[user@example.com USER@example.COM US-ER@example.org
    first.last@example.in user+one@example.ac.in]

  valid_emails.each do |email|
    @user.email = email
    assert @user.valid?
  end
end

def test_validation_should_reject_invalid_addresses
  invalid_emails = %w[user@example,com user_at_example.org user.name@example.
    @sam-sam.com sam@sam+exam.com fishy+#.com]

  invalid_emails.each do |email|
    @user.email = email
    assert @user.invalid?
  end
end

def test_email_should_be_saved_in_lowercase
  uppercase_email = "SAM@EMAIL.COM"
  @user.email = uppercase_email
  @user.save!
  assert_equal uppercase_email.downcase, @user.email
end
```

We have also written tests to validate our `email` uniqueness,length and format
when creating a new user. Here email has to be unique since we use it to
uniquely identify a user.

Testing valid email format with multiple valid and invalid emails helps us to
cover the edge cases. It's always a good practice to test with multiple values.

Consider if the regular expression we employed to validate emails allowed
certain type of emails like `@sam-sam.com`. This essentially renders the trouble
of saving the email in our database futile as we have no potential use for it.
So it is imperative to generalize our test cases as much as possible by
validating them against **multiple diversified test data**. This assures there
are no loopholes in our tests.

Now let's add some more tests to validate `password` field:

```ruby
def test_user_should_not_be_saved_without_password
  @user.password = nil
  assert_not @user.valid?
  assert_includes @user.errors.full_messages, "Password can't be blank"
end

def test_user_should_not_be_saved_without_password_confirmation
  @user.password_confirmation = nil
  assert_not @user.valid?
  assert_includes @user.errors.full_messages, "Password confirmation can't be blank"
end

def test_user_should_have_matching_password_and_password_confirmation
  @user.password_confirmation = "#{@user.password}-random"
  assert_not @user.valid?
  assert_includes @user.errors.full_messages, "Password confirmation doesn't match Password"
end

def test_users_should_have_unique_auth_token
  @user.save!
  second_user = User.create!(name: "Olive Sans", email: "olive@example.com",
    password: "welcome", password_confirmation: "welcome")

  assert_not_same @user.authentication_token, second_user.authentication_token
end
```

First two test cases validates that the `password` and `password_confirmation`
fields can't be blank. Here we've also tested that `password` &
`password_confirmation` has to be the same while creating a user.

The unique `authentication_token` is stored for every user while creating a new
user. Last test case validates that a newly created user must have a unique
`authentication_token`.

We will be adding more test cases for the `User` model in
[Deep diving into unit testing chapter](/learn-rubyonrails/deep-diving-into-unit-testing#testing-task-deletion-and-assignment-on-user-deletion).

## Running tests

Finally, to run these tests, execute the command:

```bash
bundle exec rails test test/models/user_test.rb
```

It's recommended to pass in the `-v` flag so that the output will have higher
verbosity and thus will be more clearer:

```bash
bundle exec rails test -v test/models/user_test.rb
```

## Test file naming

You might have noticed we named the file for our User model's tests as
`user_test.rb` instead of simply naming it `user.rb`. This is not just for
convention's sake.

It has to do with how the `bundle exec rails t` command works. If we run this
command without specifying a filepath then Rails will run all test files. This
comes in very handy in making sure all tests are being passed before deploying
new commits.

The way `bundle exec rails t` identifies test files is by looking in the `test`
folder for files that have a `_test` suffix.

So all test files should have a `_test` suffix in their filename. Otherwise they
will not be included by Rails when running the `bundle exec rails t` command and
hence will not be run.

For example, if we were to rename `user_test.rb` to `user.rb` and run the
following command:

```bash
bundle exec rails t -v
```

We would get the following output:

<image alt="Test file naming without suffix">test-file-naming-suffix.png</image>

You can see that the command outputs 0 runs even though we have a test file
present. This is why it is important to suffix our test file's name with
`_test`.

Make sure to change your filename back to `user_test.rb`.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added tests for User model"
```
