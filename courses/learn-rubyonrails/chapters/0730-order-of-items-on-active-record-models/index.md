In this chapter we are going to discuss how Active Record models should be
structured.

Let's start by looking into the unordered definition of the `User` model, which
will work, but has the potential to cause a lot of harm and debugging issues in
the future.

Note that the following is an example of how we shouldn't structure our model:

```ruby
# frozen_string_literal: true

class User < ApplicationRecord

  def to_lowercase
    email.downcase
  end

  before_save :to_lowercase

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
end
```

## Items should be presented in an order

Above code works but the Rails community has agreed upon certain order in which
items should be presented. And the order goes something like this:

- default_scope
- constants
- attr\_\*
- enum
- associations
- validations
- callbacks
- other macros (like devise's, has_secure_password) should be placed after the
  callbacks
- public methods
- private methods

The
[RuboCop Rails style guide](https://github.com/rubocop-hq/rails-style-guide#macro-style-methods)
is a good reference for this.

Now we can rearrange the above to look like this:

```ruby
# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false }
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}

  before_save :to_lowercase

  private

    def to_lowercase
      email.downcase
    end
end
```

Let's take a look at the User model in our Granite application. If you recall we
updated the User model in
[Adding comments to a task](/learn-rubyonrails/adding-comments-to-tasks)
chapter to:

```ruby
# frozen_string_literal: true

class User < ApplicationRecord
  MAX_NAME_LENGTH = 35
  MIN_PASSWORD_LENGTH = 6
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  MAX_EMAIL_LENGTH = 255

  has_many :comments, dependent: :destroy
  has_many :tasks, dependent: :destroy, foreign_key: :user_id

  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    length: { maximum: MAX_EMAIL_LENGTH },
    format: { with: VALID_EMAIL_REGEX }
  validates :password,
    presence: true,
    confirmation: true,
    length: { minimum: MIN_PASSWORD_LENGTH }
  validates :password_confirmation, presence: true, on: :create

  before_save :to_lowercase

  has_secure_password
  has_secure_token :authentication_token

  private

    def to_lowercase
      email.downcase!
    end
end
```

We can see that all the items are in correct order inside the User model.

Ideally, we should go through all our models and make sure that the ordering is
taken care of. But for the time being let's focus on creating our application.

In the upcoming chapters let's try to add `Rubocop` rules which can do this job
or at least warn us, when ordering is not correct.

After going through the User model and refactoring it (if required), commit the
changes:

```bash
git add -A
git commit -m "Fixed order of items in Active Record models"
```
