As a project adds more features, the `application_controller.rb` file tends to
gather more and more code and soon it becomes very big and very messy.

Take a look at this
[application_controller.rb](https://gist.github.com/neerajdotname/405df1c6f6b22ec9bfeb3a5fdb5d95a4)
before the refactoring was done.

As we can see many disjoint entities exist within that file. In the first look
itself we can see that it doesn't adhere to the
[DRY principle](/learn-rubyonrails/rails-core-principles#dry).

One method has nothing to do with another method. All the `after_action`
declarations are physically too far from the implementation of the method. For
example method `set_honeybadger_context` is 67 lines apart from the
implementation of that method.

## Using concerns to keep sanity

Concerns in Rails are like Ruby modules that extend the `ActiveSupport::Concern`
module. Rails controllers come with `concerns` directory. All modules that
reside inside `concerns` directory are automatically loaded by Rails. It's
created by Rails team so that we can put related stuff together as a concern in
that directory. So let's try to use it.

Using `concerns` is another form of keeping code DRY.

## Moving functionality into a concern

Let's extract the helper methods for sending back a response for API requests
from `ApplicationController` class and move it inside the `api_responders.rb`
concern.

Let's try the same for authorization related code:

Run the following command to create the `api_responders.rb` concern:

```bash
touch app/controllers/concerns/api_responders.rb
```

Now add the following lines of code to the `api_responders.rb` file:

```ruby
module ApiResponders
  extend ActiveSupport::Concern

  private

    def render_error(message, status = :unprocessable_entity, context = {})
      is_exception = message.kind_of?(StandardError)
      error_message = is_exception ? message.record&.errors_to_sentence : message
      render status:, json: { error: error_message }.merge(context)
    end

    def render_notice(message, status = :ok, context = {})
      render status:, json: { notice: message }.merge(context)
    end

    def render_json(json = {}, status = :ok)
      render status:, json:
    end
end
```

Similarly let us extract the exception rescuing and its corresponding handler
methods out of the `ApplicationController` to the `api_exceptions.rb` concern.

Run the following command to create the `api_exceptions.rb` concern:

```bash
touch app/controllers/concerns/api_exceptions.rb
```

Now add the following lines of code to the `api_exceptions.rb` file:

```ruby
module ApiExceptions
  extend ActiveSupport::Concern

  included do
    protect_from_forgery

    rescue_from StandardError, with: :handle_api_exception

    def handle_api_exception(exception)
      case exception
      when -> (e) { e.message.include?("PG::") || e.message.include?("SQLite3::") }
        handle_database_level_exception(exception)

      when Pundit::NotAuthorizedError
        handle_authorization_error

      when ActionController::ParameterMissing
        render_error(exception, :internal_server_error)

      when ActiveRecord::RecordNotFound
        render_error(t("not_found", entity: exception.model), :not_found)

      when ActiveRecord::RecordNotUnique
        render_error(exception)

      when ActiveModel::ValidationError, ActiveRecord::RecordInvalid, ArgumentError
        error_message = exception.message.gsub("Validation failed: ", "")
        render_error(error_message, :unprocessable_entity)

      else
        handle_generic_exception(exception)
      end
    end

    def handle_database_level_exception(exception)
      handle_generic_exception(exception, :internal_server_error)
    end

    def handle_authorization_error
      render_error(t("authorization.denied"), :forbidden)
    end

    def handle_generic_exception(exception, status = :internal_server_error)
      log_exception(exception) unless Rails.env.test?
      error = Rails.env.production? ? t("generic_error") : exception
      render_error(error, status)
    end

    def log_exception(exception)
      Rails.logger.info exception.class.to_s
      Rails.logger.info exception.to_s
      Rails.logger.info exception.backtrace.join("\n")
    end
  end
end
```

There are a couple of key points to note here:

- Helper methods declared inside the `ApiResponders` module are used inside the
  `ApiExceptions` module. We can say that the `ApiExceptions` module is
  dependent on `ApiResponders` module but we do not need to include
  `ApiResponders` inside `ApiExceptions`.

  We can do so because, since `ActiveSupport::Concern` dependencies are
  gracefully resolved.

- We have used an `included` block inside the `ApiExceptions` module. The
  included block is available because we are extending the
  `ActiveSupport::Concern` module.

  When a class includes a module, the code present inside the `included` block
  will be executed within the scope of the including class.

  In the above code, when a class includes the `ApiExceptions` class, the
  `rescue_from` callbacks will be executed within the scope of that class.
  Whenever an exception occurs inside that class or it's child class, the
  `rescue_from` callback will be called.

  The `included` block usually contains code like callbacks and macros.

Let us now move the authentication functionality out of the
`ApplicationController` to the `authenticable.rb` concern.

Run the following command to create the `authenticable.rb` concern:

```bash
touch app/controllers/concerns/authenticable.rb
```

Open `app/controllers/concerns/authenticable.rb` and add following code:

```ruby
module Authenticable
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user_using_x_auth_token
  end

  private

    def authenticate_user_using_x_auth_token
      user_email = request.headers["X-Auth-Email"].presence
      auth_token = request.headers["X-Auth-Token"].presence
      user = user_email && User.find_by!(email: user_email)
      is_valid_token = user && auth_token && ActiveSupport::SecurityUtils.secure_compare(user.authentication_token, auth_token)
      if is_valid_token
        @current_user = user
      else
        render_error(t("session.could_not_auth"), :unauthorized)
      end
    end
```

Let's also modify our `TasksController` to invoke `verify_authorized` and
`verify_policy_scoped` methods after certain specific actions:

```ruby {2-3}
class TasksController < ApplicationController
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :index
  #------previous code -------
  end
```

`verify_authorized` raises an error if pundit authorization has not been
performed in specified actions. That is why we invoke it as an `after_action`
hook. It is used to prevent the programmer from forgetting to call `authorize`
from specified action methods.

Like `verify_authorized`, Pundit also adds `verify_policy_scoped` to our
controller. It tracks and makes sure that `policy_scope` is used in the
specified actions. This is mostly useful for controller actions like `index`
which find collections with a scope and don't authorize individual instances.

## Sanitized version

To make the `application_controller` even thinner and neater, we just need to
include the necessary concerns, rather than defining the functionality with the
controller.

For example, in a fully fledged application, once all the code is moved to
concerns, then the `application_controller.rb` would look something like this
(no need to add the following changes):

```ruby
class ApplicationController < ActionController::Base
  include Authenticable
  include Authorizable
  include ApiException
  include SetHoneybadgerContext
  include RedirectHttpToHttps
  include EnsureTermsOfServiceIsAccepted
  include EnsureUserOnboarded
  include DataLoader
end
```

Now let's modify our current `application_controller` and include the concerns
we created in the previous section. Fully replace the contents of
`application_controller.rb` file like so:

```ruby
class ApplicationController < ActionController::Base
  include ApiResponders
  include ApiExceptions
  include Authenticable
  include Pundit::Authorization

  private

    def current_user
      @current_user
    end
end
```

The `@current_user` is assigned when the `authenticate_user_using_x_auth_token`
inside the `Authenticable` concern is invoked when the server receives an API
request.

By convention, we prefer to name concerns with `able` suffix. It suggests the
addition of ability.

An important point to keep in mind is that we need to use `concerns` only when
the logic has to be shared within multiple controllers or related files.

If the logic is only specific to a controller, then we can either write it in
the `private` section or move it inside a helper.

Now let's commit these changes, where we moved pundit related functionalities
into `Authorizable` concern:

```bash
git add -A
git commit -m "Moved functionality from application controller to concerns"
```
