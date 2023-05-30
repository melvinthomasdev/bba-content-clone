## What is a stack trace?

Stack trace or backtrace is a representation of the call stack at any point of
time while running the program.

Stack trace will be printed when an exception is raised. So let's raise an error
with a few method calls to understand it.

To see a very simple stack trace open `rails console` and paste the following
code:

```ruby
def capitalize_name(name)
  name.upcase
end

def print_name
  name = 1
  capitalize_name name
end
puts print_name
```

You should have got the following output on your console:

```bash
irb(main):001:1*  def capitalize_name(name)
irb(main):002:1*    name.upcase
irb(main):003:0>  end
=> :capitalize_name
irb(main):004:0>
irb(main):005:1* def print_name
irb(main):006:1*   name = 1
irb(main):007:1*   capitalize_name name
irb(main):008:0> end
=> :print_name
irb(main):009:0> puts print_name
Traceback (most recent call last):
        3: from (irb):9
        2: from (irb):6:in `print_name'
        1: from (irb):2:in `capitalize_name'
NoMethodError (undefined method `upcase' for 1:Integer)
```

It is very evident from the stack trace that the method `capitalize_name` is at
the top of the call stack and encountered an error
`NoMethodError (undefined method upcase' for 1:Integer)` at `(irb):2`, and
`print_name` is at the position `2` of the stack.

## How to log stack trace of an exception

If we want to log the stack trace of the exception rescued in our application,
we need to set up a logger first.

Rails makes use of the `ActiveSupport::Logger` class to write log information.
Other loggers, such as `Log4r`, may also be substituted.

You can specify an alternative logger in `config/application.rb` or any other
environment file, for example:

```ruby
config.logger = Logger.new(STDOUT)
```

Or you can use the following:

```ruby
config.logger = Log4r::Logger.new("Application Log")
```

The following will iterate through each line of backtrace and logs to log file:

```ruby
begin
  raise
rescue => e
  logger.error e.message
  e.backtrace.each { |line| logger.error line }
end
```

## Interpreting Rails stack trace

Let's change the task controller's `show` method as follows:

```ruby
def show
 render status: :OK, json: { task: @task }
end
```

Now try to edit an existing task, check the console of your browser, and we can
see a 500 error message. We can see an error page in the preview of particular a
request in `Network` tab. The lines after
`Application Trace | Framework Trace | Full Trace` is our stack trace:

```shell {2,4,10,20,21}

ArgumentError in TasksController#show

Unrecognized status code :OK

Extracted source (around line #21):

19
20  def show
21    render status: :OK, json: { task: @task }
22  end
23
24  def update




Rails.root: /Users/admin/learnROR/Granite-Revamp

Application Trace | Framework Trace | Full Trace
app/controllers/tasks_controller.rb:21:in `show'

```

The above error message says `Unrecognized status code :OK`, but `200 OK` is a
standard status code part of http as we know. So let us check why Rails has
raised such an error. But the problem is that there is no stack trace printed
for us to debug.

Rails isn't showing the framework stack trace by default, since it has a
silencer enabled to show only the app directory stack trace and to skip the
Rails stack trace. So let's remove the silencers.

open `config/initializers/backtrace_silencers.rb` and uncomment the following
line:

```ruby
 Rails.backtrace_cleaner.remove_silencers!
```

Initializer files are loaded only once when the Rails server is started. Always
restart the server, when any of the initializer files are modified. For further
information check the
[documentation](https://guides.rubyonrails.org/initialization.html).

So let's restart the Rails server and try editing the task once again:

```shell {2,4,7-12,16,17,32}

ArgumentError in TasksController#show

Unrecognized status code :OK

Extracted source (around line #583):
581  def status_code(status)
582    if status.is_a?(Symbol)
583      SYMBOL_TO_STATUS_CODE.fetch(status) { raise ArgumentError, "Unrecognized status code #{status.inspect}" }
584    else
585      status.to_i
586  end

Rails.root: /Users/admin/learnROR/Granite-Revamp

Application Trace | Framework Trace | Full Trace
rack (2.2.3) lib/rack/utils.rb:583:in `block in status_code'
rack (2.2.3) lib/rack/utils.rb:583:in `fetch'
rack (2.2.3) lib/rack/utils.rb:583:in `status_code'
actionpack (6.1.4.1) lib/action_controller/metal/rendering.rb:96:in `_normalize_options'
actionpack (6.1.4.1) lib/abstract_controller/rendering.rb:119:in `_normalize_render'
actionpack (6.1.4.1) lib/abstract_controller/rendering.rb:24:in `render'
actionpack (6.1.4.1) lib/action_controller/metal/rendering.rb:36:in `render'
actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:44:in `block (2 levels) in render'
activesupport (6.1.4.1) lib/active_support/core_ext/benchmark.rb:14:in `block in ms'
/Users/rojinpaul/.rbenv/versions/3.1.2/lib/ruby/3.1.2/benchmark.rb:308:in `realtime'
activesupport (6.1.4.1) lib/active_support/core_ext/benchmark.rb:14:in `ms'
actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:44:in `block in render'
actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:84:in `cleanup_view_runtime'
activerecord (6.1.4.1) lib/active_record/railties/controller_runtime.rb:34:in `cleanup_view_runtime'
actionpack (6.1.4.1) lib/action_controller/metal/instrumentation.rb:43:in `render'
app/controllers/tasks_controller.rb:21:in `show'
actionpack (6.1.4.1) lib/action_controller/metal/basic_implicit_render.rb:6:in `send_action'
actionpack (6.1.4.1) lib/abstract_controller/base.rb:195:in `process_action'
```

We can look at the first line of stack trace, and it shows:

`rack (2.2.3) lib/rack/utils.rb:583:in `block in status_code'`

So this is an error from rack version 2.2.3, go to GitHub `rack` repo and select
the tag `2.2.3` and navigate to `lib/rack/utils.rb`.

Line 583 is calling a method `SYMBOL_TO_STATUS_CODE`. If we look into the code
we can see they have already defined all the status codes in
`HTTP_STATUS_CODES`, and there is a `200 => 'OK'` in the list. But in the
`SYMBOL_TO_STATUS_CODE` method it is getting down cased(Refer
[here](https://github.com/rack/rack/blob/1d70c73043e8fd41bf204ff794730aed2620d7a4/lib/rack/utils.rb#L590)).
So we have to use `ok` symbol instead of `OK`:

```ruby
def show
 render status: :ok, json: { task: @task }
end
```

We are not committing any of these changes:

```bash
git checkout -f app/controllers/tasks_controller.rb
git checkout -f config/initializers/backtrace_silencers.rb
```

## Video on how to interpret a stack trace

Chris Oliver of [gorails](https://gorails.com) has posted a nice video on
[how to interpret a stack trace](https://gorails.com/episodes/debugging-how-to-interpret-a-stacktrace?autoplay=1).
