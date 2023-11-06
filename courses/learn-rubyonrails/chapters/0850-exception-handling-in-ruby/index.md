## Exceptions in Ruby

In Ruby, Exceptions are created using `raise` command:

```ruby
begin
  raise "boom"
end
```

If we execute that code then we will see the error:

```ruby
 boom (RuntimeError)
```

Notice that Ruby is saying that it is a `RuntimeError`. Here is Ruby's official
documentation about
[RuntimeError](https://ruby-doc.org/3.2.2/RuntimeError.html). Above code
can also be written like this:

```ruby
raise RuntimeError, "boom"
```

As per Ruby's documentation if when we do not mention any class while raising an
exception then by default it is `RuntimeError` class.

In Ruby all exceptions are subclasses of `Exception` class.

## Hierarchy of Ruby Exception class

Ruby has lots of built in exceptions. Here is hierarchy of all Ruby's
exceptions:

```ruby
Exception
  NoMemoryError
  ScriptError
    LoadError
    NotImplementedError
    SyntaxError
  SecurityError
  SignalException
    Interrupt
  StandardError
    ArgumentError
      UncaughtThrowError
    EncodingError
    FiberError
    IOError
      EOFError
    IndexError
      KeyError
      StopIteration
    LocalJumpError
    NameError
      NoMethodError
    RangeError
      FloatDomainError
    RegexpError
    RuntimeError
    SystemCallError
      Errno::*
    ThreadError
    TypeError
    ZeroDivisionError
  SystemExit
  SystemStackError
```

## The rescue method catches a class and all its subclasses

```ruby
begin
  do_something
rescue NameError
end
```

Here we are rescuing all `NameError` exceptions. However `NoMethodError` will
also be rescued because `NoMethodError` is a subclass of `NameError`.

For example, consider a `api_exceptions.rb` file where we are rescuing from all
the exceptions like this:

```rb
module ApiExceptions
  rescue_from StandardError, with: :handle_api_exception
  rescue_from ActiveRecord::RecordNotUnique, with: :handle_record_not_unique_exception

  def handle_api_exception(exception)
    case exception
    # handles the exceptions
  end

  def handle_record_not_unique_exception(exception)
    # handles record not unique exception
  end
end
```

The `RecordNotUnique` exception is a child class of `StandardError`. When we
rescue from `StandardError` all the child exception classes will also be caught.
So the `rescue_from ActiveRecord::RecordNotUnique` in the above example is
redundant. The code will never reach this line because the `RecordNotUnique`
exception will already be caught by the `rescue_from StandardError` statement.

The correct way of rescuing the errors will be, like this:

```rb
module ApiExceptions
  rescue_from StandardError, with: :handle_api_exception

  def handle_api_exception(exception)
    case exception

    when ActiveRecord::RecordNotFound
      handle_record_not_unique_exception(exception)

    # handles the other exceptions
  end

  def handle_record_not_unique_exception(exception)
    # handles record not unique exception
  end
end
```

In the above example, we are rescuing `StandardError` and all its children
classes with `handle_api_exception` method. And inside `handle_api_exception`
method [case](https://www.rubyguides.com/2015/10/ruby-case/) is used to handle
the required child exception classes specifically.

## Certain exceptions and when they are raised

- `Pundit::NotAuthorizedError` is raised when any authorization error from
  [Pundit](https://rubygems.org/gems/pundit/versions/1.1.0) gem raises and we
  can handle it with `403` or `forbidden` status.

- `ActionController::ParameterMissing` is raised when a required parameter is
  missing. Consider a case when we have `strong params` defined for a `post`
  request and those params are missing in the request header. We can handle this
  via `500` or `internal_server_error` status.

- `ActiveRecord::RecordNotFound` is raised when `Rails` does not find any
  record. When we use `find` method to search for a record with the provided
  `id` in params and the `id` is mistaken or the record is missing from `DB`,
  `Rails` raises `ActiveRecord::RecordNotFound` exception. We can handle this
  with a `404` or `not_found` status.

- `ActiveRecord::RecordInvalid` is raised on failure of validations declared in
  model for any record creation or updation. Let's say we have some `email`
  validation declared in model and the input email does not match with the given
  `Regex` pattern `Rails` raises `ActiveRecord::RecordInvalid` exception. We can
  handle this with a `422` or `unprocessable_entity` status.

- `ActiveRecord::RecordNotUnique` is raised when a record cannot be inserted or
  updated because it would violate a uniqueness constraint from `DB`. We can
  handle this with `unprocessable_entity` or `422` status.

- `PG::NotNullViolation: ERROR: null value in column "name" of relation "users" violates not-null constraint`
  for missing mandatory input. We should handle the database errors starting
  with `PG::` or `SQLite3::` with `internal_server_error` or `500` status. If we
  keep this as `unprocessable_entity` then it won't raise Honeybadger issues,
  meaning it will log the error silently. These errors are very rare and we
  should be getting notified of these errors by Honeybadger in Github.

## Raising error using class

Following two lines do the same thing:

```ruby
raise "boom"
raise RuntimeError, "boom"
```

We can raise exceptions of a particular class by stating the name of that
exception class:

```ruby
raise ArgumentError, "two arguments are needed"
raise LoadError, "file not found"
```

## Default rescue is StandardError

`rescue` without any argument is same as rescuing `StandardError`:

```ruby
begin
rescue
end
```

Above statement is same as the one given below:

```ruby
begin
rescue StandardError
end
```

## Catching multiple types of exceptions in one shot

We can catch multiple types of exceptions in one statement:

```ruby
begin
rescue ArgumentError,NameError
end
```

## Catching exception in a variable

We can catch exception in a variable like this:

```ruby
begin
rescue StandardError => e
end
```

Here `e` is an exception object. The three main things we like to get from an
exception object are "class name", "message" and "backtrace".

Let's print all the three values:

```ruby
begin
   raise "boom"
rescue StandardError => e
  puts "Exception class is #{e.class.name}"
  puts "Exception message is #{e.message}"
  puts "Exception backtrace is #{ e.backtrace}"
end
```

## Custom exceptions

Sometimes we need custom exceptions. Creating custom exceptions is easy:

```ruby
class NotAuthorizedError < StandardError
end

raise NotAuthorizedError.new("You are not authorized to edit record")
```

`NotAuthorizedError` is a regular Ruby class. We can add more attributes to it
if we want:

```ruby
class NotAuthorizedError < StandardError
  attr_reader :account_id

  def initialize(message, account_id)
    #invoke the constructor of parent to set the message
    super(message)

    @account_id = account_id
  end
end

raise NotAuthorizedError.new("Not authorized", 171)
```

## rescue nil

Sometimes we see code like this:

```ruby
do_something rescue nil
```

The above code is equivalent to the following code:

```ruby
begin
  do_something
rescue
  nil
end
```

The above code can also be written like this, since by default `StandardError` is
raised:

```ruby
begin
  do_something
rescue StandardError
  nil
end
```

## Exception handling in Ruby on Rails using rescue_from

A typical controller could look like this:

```ruby
class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end

  def edit
    @article = Article.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
```

We can use
[rescue_from](https://api.rubyonrails.org/classes/ActiveSupport/Rescuable/ClassMethods.html)
to catch the exception.

The `rescue_from` directive is an exception handler that rescues the specified
exceptions raised within controller actions and reacts to those exceptions with
a defined method.

For example, the following controller rescues `ActiveRecord::RecordNotFound`
exceptions and passes them to the `render_404` method:

```ruby
class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def render_404
  end
end

class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end
end
```

The advantage to `rescue_from` is that it abstracts the exception handling away
from individual controller actions, and instead makes exception handling a
requirement of the controller.

The `rescue_from` directive not only makes exception handling within controllers
more readable, but also more regimented.

## Rescuing from specific exception

Ruby’s `Exception` is the parent class to all errors. So one might be tempted to
always rescue from this exception class and get the "job" done. But DON'T!

`Exception` includes the class of errors that can occur outside your
application. Things like memory errors, or `SignalException::Interrupt`(sent
when you manually quit your application by hitting `Control-C`), etc. These are
the errors that you don’t want to catch in your application as they are
generally serious and related to external factors. Rescuing the `Exception`
class can cause very unexpected behaviour.

`StandardError` is the parent of most Ruby and Rails errors. If you catch
`StandardError` you’re not introducing the problems of rescuing `Exception`, but
it is not a great idea either. Rescuing all application-level errors might cover
up unrelated bugs that you don’t know about.

The safest approach is to rescue the error(or errors) you are expecting and deal
with the consequences of that error inside the rescue block.

In the event of an unexpected error in your application you want to know that a
new error has occurred and deal with the consequences of that new error inside
its own rescue block.

Being specific with rescue means your code doesn’t accidentally swallow new
errors. You avoid subtle hidden errors that lead to unexpected behaviour for
your users and bug hunting for you.

## Do not use exception as control flow

Let's look at the following code:

```ruby
class QuizController < ApplicationController
  def load_quiz
    @quiz = current_user.quizzes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    format.json { render status: :not_found, json: { error: "Quiz not found"}}
  end
end
```

In the above code when quiz id is not found then an exception is raised and then
that exception is immediately caught.

Here the code is using exception as a control flow mechanism. What it means is
that the code is aware that such an exception could be raised and is prepared to
deal with it.

The another way to deal with such a situation would be to not raise the
exception in the first place. Here is an alternative version where code will not
be raising any exception:

```ruby
class QuizController < ApplicationController
  def load_quiz
    @quiz = current_user.quizzes.find_by_id(params[:id])
    unless @quiz
      format.json { render status: :not_found, json: { error: "Quiz not found"}}
    end
  end
end
```

In the above case instead of using `find` code is using `find_by_id` which would
not raise an exception in case the quiz id is not found.

In Ruby world we like to say that **an exception should be an exceptional
case**. Exceptional case could be database is down or there is some network
error. Exception can happen anytime but in this case code is not using catching
an exception as a control flow.

Long time ago in the software engineering world `GOTO` was used a lot. Later
[Edsger W. Dijkstra](https://en.wikipedia.org/wiki/Edsger_W._Dijkstra) wrote a
famous letter
[Go To Statement Considered Harmful](https://en.wikipedia.org/wiki/Considered_harmful).
Today it is a well established that using `GOTO` is indeed harmful.

Many consider using Exception as a control flow similar to using GOTO since when
an exception is raised it breaks all design pattern and exception starts flowing
through the stack. The first one to capture the exception gets the control of
the software. This is very close to how GOTO works. In Ruby world it is well
established practice to
[not to use Exception as a control flow](https://softwareengineering.stackexchange.com/questions/189222/are-exceptions-as-control-flow-considered-a-serious-antipattern-if-so-why).

## Using bang methods in controller actions

But, just like everything in software engineering, the suggestion we had made in
last section also has some exceptions. Like in controllers etc, we should be
trying our level best to keep controllers as skinny as possible. So adding
repetitive `unless` or `if` statements as a replacement for `rescue` statements
won't scale. Thus in such cases, what we should do is use the `bang(!)` versions
of ActiveRecord methods, like `create!`, `update!`, `destroy!` or `save!` within
the controller actions. This would raise an exception in case there's a failure.

But where to handle theses exceptions? Well, in the chapter where we had cleaned
up the application controller, we had added a concern named `ApiExceptions`.
This concern is included in the `ApplicationController`. Which means all other
controllers will be having access to the methods defined in that concern. In
that concern we have several `rescue_from` statements, which handles specific
exceptions.

Thus in our controller, we could write something like this, and both the success
and failure cases will be handled:

```rb
class QuizController < ApplicationController
  before_action :load_quiz!, only: %i[update]

  def update
    @quiz.update!(quiz_params) # control wouldn't even reach here if exception was raised in load_quiz!
    render_notice(t("successfully_created", entity: "Quiz")) # control will only reach here if the above statement didn't raise any exception
  end

  private

    def load_quiz!
      @quiz = current_user.quizzes.find_by!(id: params[:id])
    end
end
```

Notice how we have named the method as `load_quiz!` with a `bang(!)` rather than
simply `load_quiz`? It's to denote that the particular method has the potential
to raise an exception. If no record is found by the `find_by!` method then a
`ActiveRecord::RecordNotFound` exception will be raised.

There is a problem in the above code block, which has to deal with code
conventions that we follow in BigBinary. That's, if we are querying using the
`id` attribute only then we should use the `find` method over `find_by!` because
in the `find` method we can directly pass the `id` value without defining any
key and it makes the code cleaner. If for a given `id` no record is found by
`find` method then the same exception will be raised that is
`ActiveRecord::RecordNotFound`.

So, in the above code block the `load_quiz!` method needs to be updated like this:

```rb
def load_quiz!
  @quiz = current_user.quizzes.find(id)
end
```

There is **nothing to commit** in this chapter since all we had done was
learning the basics of exception handling in Ruby.
