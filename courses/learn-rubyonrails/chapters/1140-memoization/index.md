## Memoization

Memoization is a technique used to cache the results of a time consuming and
resource intensive operation so that it only needs to be done once. Examples of
such operations could be querying data from the database or hitting an external
service.

Although it is a good idea to cache the results of such operations, it doesn't
make sense for us to do so when we only require the results once.

Ruby provides a very idiomatic way for memoizing values with the help of an
`conditional assignment operator (||=)`. A `conditional assignment operator`
assigns a value to a variable if the value inside the variable is either `false`
or `nil`.

In other words, if the boolean equivalent of value inside the left-hand side of
the `conditional assignment operator` is true then the value resulting from the
right-hand side expression will not be assigned to the variable on left-hand
side.

For example:

```ruby
result ||= expensive_method_invocation
```

is the same as:

```ruby
result = (result || expensive_method_invocation)
```

The code in above example basically tells Ruby to invoke the expensive method
and store the result in `result` variable if the boolean equivalent of value
inside `result` is not `true`. If `result` contains a truthy value then the
expression on right hand side of the `conditional assignment operator` will not
be evaluated.

Since a `conditional assignment operator` will prevent the execution of the
right-hand side expression, it should not be used to store results from an
operation whose value is likely to change. For example, a method that returns a
value based on the current time. In such a case, memoization is not a good
choice as you will get stale value present in the `result` variable.

Let us see a hypothetical example to understand how we can use memoization in
Rails. As per our Granite application, while deleting a user, we assign back the
tasks assigned to that user to the task owner. Consider a scenario where we have
an admin user and instead of assigning back the tasks to the task owner the
tasks have to be assigned back to the admin, like this:

```ruby
class UserDeletionService
  ADMIN_EMAIL = "oliver@example.com"

  attr_reader :user_id

  def initialize(user_id)
	  @user_id = user_id
  end

  def process
	  assign_tasks_to_admin
	  delete_user
  end

  private

	  def assign_tasks_to_admin
	    user.assigned_tasks.each do |task|
	      task.update(assigned_user: admin)
	    end
	  end

	  def delete_user
	    user.destroy
	  end

	  def user
	    @_user ||= User.find_by(id: user_id)
	  end

	  def admin
	    @_admin ||= User.find_by(email: ADMIN_EMAIL)
	  end
end
```

In the above example, we have declared a `UserDeletionService` which first
assigns the tasks to admin and then deletes the user. Inside the
`assign_tasks_to_admin` method, we are calling the `user` method for the first
time. When `user` method gets called, it will query the database for the user
based on the `user_id` and store the result of the query in the `@_user`
variable. variable. **At Bigbinary we prefix the memoized instance variable with
an underscore, like `@_user`.**

When the `user` method gets called again for the second time in the
`delete_user` method, the query to fetch the user won't get executed again
because the `@_user` variable already contains the user. Thus saving time and
resources, and most importantly reduces a database query.

While assigning the tasks to admin, we are looping over all the tasks assigned
to the user to be deleted and then assigning each task to the admin. `admin`
method will get called during each iteration but the query to fetch the admin
will only be executed once during the first run of the iteration and for all
subsequent runs, value stored inside the `@_admin` variable will be used.

In the Granite application we have a private method inside the
`ApplicationController` which returns the `@current_user`:

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

You might be tempted to memoize the initialization of `@current_user` instance
variable. The reason we haven't used memoization here is because,
`authenticate_user_using_x_auth_token` method which is declared inside the
`Authenticable` concern gets called for every request and for each request we
need to fetch the user based on the email present in `X-Auth-Email` key in
request headers.

Since the user can vary across requests we should not use memoization in this
case. We have already discussed that memoization isn't a good choice to store
values which are likely to change frequently.

Another reason why memoization won't work here is because, a new instance of
`ApplicationController` is created for each request and the value inside
memoized variables do not persist across different instances of a class. If you
had noticed, a memoized variable is an instance variable, for example, `@_user`,
which means they belong to a particular instance of the class.

**This is an in-depth chapter and you do not need to commit any changes.**
