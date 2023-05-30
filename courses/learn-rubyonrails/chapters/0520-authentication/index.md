## Bcrypt gem

Authentication involves validating password provided by a user. For security
reasons passwords should be stored in an encrypted form rather than in the plain
text. In this way if the database is ever compromised, hacker would not be able
to get the actual password of the users since the database is keeping only the
encrypted password.

The [bcrypt gem](https://github.com/codahale/bcrypt-ruby) allows us to get hash
of the password in a secure manner.

Let's add this gem to our Gemfile:

```ruby
gem 'bcrypt', '~> 3.1.13'
```

```bash
bundle install
```

## Adding credentials fields to User model

Now let's add two fields to `User` model. First field will store email and the
second field will store password.

We will also put a unique index on column "email". When an index is declared
unique, multiple table rows with the same value are not allowed. Note that two
null values are not considered equal:

```bash
bundle exec rails g migration AddEmailAndPasswordDigestToUser
```

Open `db/migrate/add_email_and_password_digest_to_user.rb` file and add
following lines:

```ruby {3,4}
class AddEmailAndPasswordDigestToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false, index: { unique: true }
    add_column :users, :password_digest, :string, null: false
  end
end
```

The Active Record uniqueness validation does not guarantee uniqueness at the
database level. Here’s a scenario that explains why:

1. Sam signs up for the sample app, with address sam@example.com.
2. Sam accidentally clicks on “Submit” twice, sending two requests in quick
   succession.

The following sequence occurs: request 1 creates a user in memory that passes
validation, request 2 does the same, request 1’s user gets saved, request 2’s
user gets saved.

Result: two user records with the exact same email address, despite the
uniqueness validation If the above sequence seems implausible, believe me, it
isn’t. It can happen on any Rails website with significant traffic.

Luckily, the solution is straightforward to implement: we need to enforce
uniqueness at the database level as well as at the model level. Our method is to
create a database index on the email column, and then require that the index be
unique.

Now let's run the migration:

```bash
bundle exec rails db:migrate
```

Running the above migration would raise the following error:

```bash
SQLite3::ConstraintException: NOT NULL constraint failed: users.email
```

This is because in our database we already have users who do not have any email.
In this migration we are telling Rails to put a unique constraint on the email
column of users table. The database can't do that as long as we have records
with null email.

So let's remove all user's records. But as the tasks are associated with users
by a foreign key constraint we can't remove user's records directly. We first
have to remove the task's records and then delete the user records. Time to fire
up the Rails console:

```bash
$ bundle exec rails console
>> Task.delete_all
>> User.delete_all
```

Another reason for this error could be `fixtures` files added by the Rails model
generation command. Check if there are any fixtures files inside
`test/fixtures`. If yes then remove them by running the following command:

```bash
rm -rf test/fixtures/*
```

Now run the migration one more time:

```bash
bundle exec rails db:migrate
```

## Securing password

As we discussed earlier password should not be stored in the plain text in the
database. Rails provides
[has_secure_password](https://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)
to conveniently store password in an encrypted manner. Rails needs column
`password_digest` in the User model to do its job.

Add following line to `User` model:

```ruby {3}
class User < ApplicationRecord
  has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"
  has_secure_password

  validates :name, presence: true, length: { maximum: 35 }
end
```

`has_secure_password` line adds some convenience methods to the `User` class.
These methods help in storing password in an encrypted form and also
authenticate the plain text password with the stored encrypted password. From
the
[Rails source code](https://github.com/rails/rails/blob/b738f1930f3c82f51741ef7241c1fee691d7deb2/activemodel/lib/active_model/secure_password.rb#L91-L126)
we can see that `has_secure_password` adds methods like `password=`,
`password_confirmation` and `authenticate_password`.

PS: There's a `password` method too, but it's kept as an `attr_reader`.

## Adding credential validations

Let's add validations to our newly added fields, `email` and `password`:

```ruby {6-7}
class User < ApplicationRecord
  has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"
  has_secure_password

  validates :name, presence: true, length: { maximum: 35 }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :password_confirmation, presence: true, on: :create
end
```

`has_secure_password` auto-magically adds validations for presence of password
on create and also ensures confirmation of password (by default it's
`password_confirmation` attribute).

The `confirmation` validation creates a virtual attribute whose name is the name
of the field that has to be confirmed with and "\_confirmation" appended to it.
Here it'd become "password_confirmation". We need to ensure the presence of
confirmation field during creation.

We have added an `if` condition which will only validate the password length if
the password entered is not `nil`.

Don't let this confuse you. Rails will validate the password against all
validations such as `presence` and `confirmation` except for the `length`
validation if the password is nil. Hence if no password is entered, an error
will be thrown.

Note that, here we are validating the presence of `password_confirmation` field
only on ActiveRecord `create` method. The reason is that, currently we need the
password confirmation only when signing up for first time.

Before adding a validation for email, let's also declare a constant for the
maximum length of an email in our `user` model.

Add the following changes to the `user` model to validate the `email` field:

```ruby {2-3,8-11,15-21}
class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze
  MAX_EMAIL_LENGTH = 255

  has_many :assigned_tasks, foreign_key: :assigned_user_id, class_name: "Task"
  has_secure_password

  validates :name, presence: true, length: { maximum: 35 }
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: MAX_EMAIL_LENGTH },
                    format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }, if: -> { password.present? }
  validates :password_confirmation, presence: true, on: :create

  before_save :to_lowercase

  private

    def to_lowercase
      email.downcase!
    end
end
```

The `format` validator ensures the field has specified format, here,
`VALID_EMAIL_REGEX`. The `before_save` callback is called every time an object
is saved. Before saving, the `to_lowercase` method makes all characters of email
into lowercase.

## The freeze method in Ruby

At this point, you might be wondering why we are using the `freeze` method on
`VALID_EMAIL_REGEX` constant. To understand this we need to understand the
nature of constants in Ruby.

Contrary to what the name suggests, constants are mutable in Ruby. Writing a
variable name in all caps doesn't make it a constant in the way you may expect.
Thus altering them will not throw a `RuntimeError` exception, but only a
warning. Let's test this out. Open the Rails console by running the following
command:

```bash
bundle exec rails c
```

Now run the following commands from the Rails console:

```ruby
irb(main):001:0> CONSTANT_STRING = "This is a mutable "
irb(main):002:0> CONSTANT_STRING << "constant"
irb(main):003:0> CONSTANT_STRING
=> "This is a mutable constant"
```

As you can see this doesn't throw an error like you would expect. This is where
the `freeze` method comes in. The `freeze` method prevents further modifications
on the object it is called on. In other words, it makes the constant immutable.

Let' see this in action. Reload and type the following commands in your console:

```ruby
irb(main):001:0> CONSTANT_STRING = "This is an immutable".freeze
irb(main):002:0> CONSTANT_STRING << "constant"
```

Now you should see the following error in your console

```ruby
(irb):4:in `<main>': can't modify frozen String: "This is an immutable" (FrozenError)
```

Thus the `freeze` method allows us to make truly immutable constants in Ruby.

## What is the frozen_string_literal comment?

If you have correctly setup Rubocop correctly as we had mentioned in early
chapters, then you may notice the comment `#frozen_string_literal: true` being
added to the top of any Ruby file automatically when you run `rubocop` on it.

This comment essentially tells Ruby that all string literals in the file are
implicitly frozen, as if `freeze` had been called on each of them. This avoids
us the hassle of making sure to call the method `freeze` on any string literal
we define and also makes them behave like expected.

So we can remove the `freeze` method from `VALID_EMAIL_REGEX` if we have
configured Rubocop to add the `frozen_string_literal` comment on top of all Ruby
files. But in the upcoming chapters, we will be chaining the `.freeze` method
explicitly so as to reinforce the use case of `freeze` method.

**Note:** The `frozen_string_literal` comment only affects the behaviour of
string literals. Other collections like arrays, hash literals, etc won't be
affected by the comment.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added has_secure_password and validations to User model"
```
