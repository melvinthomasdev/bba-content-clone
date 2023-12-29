Tasks like sending an email, sending SMS, generating PDF, generating excel file
etc can be time consuming for the server. While the server is trying to do these
things the server can't process any other request. This reduces the throughput
of the server. This would mean we would need a lot more servers to process
incoming requests. A better strategy is to take the request and store it to be
processed in the background. In this way server can immediately send a response
when someone requests for say "reset password". The user gets a notification the
"password email is on its way". In the background the server can process all
background jobs one by one.

Rails provides
[Active Job](https://guides.rubyonrails.org/active_job_basics.html) to process
background jobs and has built-in support for multiple queueing backends such as [Sidekiq](https://sidekiq.org),
[Resque](https://github.com/resque/resque) and
[Delayed Job](https://github.com/collectiveidea/delayed_job). The [Queue adapters section](https://edgeapi.rubyonrails.org/classes/ActiveJob/QueueAdapters.html)
of the Rails guides has detailed information about all the queueing adapters
supported by Rails by default.

## Sidekiq Jobs

Although Rails provides Active Job, we are choosing to use [Sidekiq](https://sidekiq.org/) Jobs directly for its enhanced performance and feature set. Directly interfacing with Sidekiq bypasses the additional abstraction layer provided by Active Job, offering more granular control over job processing.

Sidekiq uses Redis to store all the operational data. So let's
setup Redis on the development machine. If you're using macOS, then Redis will
be installed by the following command:

```bash
brew install redis
```

Start the Redis server:

```bash
brew services start redis
```

Now Redis should be up an running.

Open Gemfile and add the following line:

```ruby
gem "sidekiq", "<7"
```

We are using Sidekiq version less than 7 because Sidekiq v7 has some breaking
changes. To know more about Sidekiq v7 please check this
[article](https://www.mikeperham.com/2022/10/27/introducing-sidekiq-7.0/) by
Mike Perham.

Install the gem:

```bash
bundle install
```

Now open `config/application.rb` file. You should find a block of code where all
the configurations are set. Add the following line in that block:

```ruby
config.active_job.queue_adapter = :sidekiq
```

## Configuring Sidekiq

Now let's add an initializer which can be used to configure Sidekiq to interact
with our Redis queue:

```bash
touch config/initializers/sidekiq.rb
```

Add the following lines to `sidekiq.rb`:

```ruby
Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'], size: 4, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'], size: 4, network_timeout: 5 }
end
```

Here the `client` is our passenger, which is `puma` running behind `rails`, and
can be literally termed as anything that pushes jobs to Redis. The server is the
`sidekiq` process which pulls jobs from Redis. That means when deploying, our
web dynos in Heroku will use a max of `size` number of connections to push jobs
to Redis, no matter how many threads they have.

The initializer is meant for more complicated config which requires Ruby, for
instance the Redis connection info or custom middleware.

Now let's add a `config/sidekiq.yml`, which is meant to be a persistent config
for all options we can pass to `sidekiq`:

```bash
touch "config/sidekiq.yml"
```

Add the following to that file:

```yaml
development:
  :concurrency: 1
production:
  :concurrency: 1
:queues:
  - default
```

We can change `concurrency` based on our needs. `default` is the name of the
queue.

Next we need to find Redis URL. In most systems the Redis URL is
`redis://127.0.0.1:6379/12`.

If we need to confirm that the port is correctly set, run the command
`redis-cli info` and check for the field called `tcp_port`.

Open a new tab in terminal app since we want to run Sidekiq in addition to the
Rails server that is already running. In the new tab of the terminal execute the
following command:

```bash
REDIS_URL="redis://127.0.0.1:6379/12" bundle exec sidekiq -e development -C config/sidekiq.yml
```

The `REDIS_URL` env variable needs to be explicitly passed in local development
environments. In production environment this value is set using some settings
file.

Another way to persist the `REDIS_URL` is to run
`export REDIS_URL="redis://127.0.0.1:6379/12"` every time a new shell is
created. To automate it we can add this line to our `~/.bashrc` or `~/.zshrc`
and restart our terminal.

In most systems the above command will make Sidekiq work with Redis without any
problems.

Redis URL changes from system to system. Thus if the above command doesn't work,
then use the following:

```ruby
bundle exec sidekiq -e development -C config/sidekiq.yml
```

## Creating a job

Run the following command on your terminal:

```bash
rails generate job task_logger
```

```bash
create    test/jobs/task_logger_job_test.rb
create  app/jobs/task_logger_job.rb
```

You'll notice that it creates two files `task_logger_job.rb` inside `app/jobs`
directory and its corresponding test file `task_logger_job_test.rb` inside
`test/jobs` directory.

Once generated, the job file should look like this:

```ruby
class TaskLoggerJob < ApplicationJob
end
```

`ApplicationJob` is just an abstract class where we define configurations for
all the jobs. It inherits `ActiveJob::Base`. In short, it's analogous to
`ApplicationRecord` that we have in case of models.

But as we said earlier, we won't be using `ActiveJob`, instead we will be using Sidekiq Job directly.

So, let's replace the contents of `task_logger_job.rb` and remove the `application_job.rb` file:

```ruby
class TaskLoggerJob
  include Sidekiq::Job
end
```

Now, let's define `perform` method within the job. This method is responsible for executing the job's entire business logic.

```ruby
class TaskLoggerJob
  include Sidekiq::Job

  def perform
    puts "TaskLoggerJob is performed"
  end
end
```

## Executing the job

Open your Rails console using `rails c`. Now as you'd expect we can execute the
`perform` method that we've defined inside `TaskLoggerJob` just like any other
instance method of a class. So let's see if that works.

```ruby
TaskLoggerJob.new.perform
> "TaskLoggerJob is performed"
```

Great this works. But you might wonder how this `job` is different from any
other Ruby class. The answer is that this class provides an ability to enqueue
this job to the backend queue. Now in your Rails console, run the following:

```ruby
TaskLoggerJob.perform_async
```

Notice the output here. Instead of printing the message from `perform` method of
the job, it displays the `ID` of the job being enqueued. Now go to the Sidekiq window where
Sidekiq is running. You should observe that this job has run there and the
message `"TaskLoggerJob is performed"` is printed there.

Let's see what has happened here. We've called a method `perform_async`, which
is a class method available on subclass of `Sidekiq::Job`. The details of the job are
stored in the Redis. Sidekiq picks up the job when it's available and executes
the perform method. upon availability and executes the perform method.

We can also define when we want to run the job by using `perform_at` or `perform_in` option:

```ruby
# By providing `perform_at` option, we are asking
# to perform the job at the end of the day.
TaskLoggerJob.perform_at(Time.zone.today.end_of_day)
```

```ruby
# By providing `perform_in` option we are asking
# to perform after 1 minute.
TaskLoggerJob.perform_in(1.minute)
```

## Enqueuing jobs to Sidekiq

Now let's use our `TaskLoggerJob` to actually log something. Let's log the
details of the task after the task got created.

First, let's add the following lines to the Task model:

```ruby {2, 6-8}
class Task < ApplicationRecord
  after_create :log_task_details

  # Existing code ...

  def log_task_details
    TaskLoggerJob.perform_async(self.id)
  end
end
```

Notice that we have passed an argument to `perform_async` method. The method
`perform`, that we manually define inside the job can take any number and any
type of argument. In the above case, we are considering the `id` of the task as an
argument to `perform` action.

So let's clear all the actions that we have added in `TaskLoggerJob` and define
`perform` action as follows:

```ruby
class TaskLoggerJob
  include Sidekiq::Job

  def perform(task_id)
    task = Task.find(task_id)
    puts "Created a task with following attributes : #{task.attributes}"
  end
end
```

Now when you create a task in the browser and you will notice that the log is
printed in the Sidekiq window printing all the attributes of the newly created
task.

There are some best practices to follow to make the most out of Sidekiq. You can
refer them in their
[official docs](https://github.com/mperham/sidekiq/wiki/Best-Practices).

## Testing Sidekiq jobs

To write a Sidekiq test, first we need to require `sidekiq/testing` in
`task_logger_job_test.rb` as well as replace `ActiveJob::TestCase` to `ActiveSupport::TestCase` as we are not using `Active Job` anymore:

```ruby {2,3}
require "test_helper"
require "sidekiq/testing"
class TaskLoggerJobTest < ActiveSupport::TestCase
end
```

Sidekiq provides a few modes of testing our jobs. These are
`Sidekiq::Testing.inline!`, `Sidekiq::Testing.fake!` and
`Sidekiq::Testing.disable!`.

Requiring `sidekiq/testing` will automatically initialize the
`Sidekiq::Testing.inline!` mode, where `inline` is the default mode.

For the purpose of testing the `TaskLoggerJob`, let's create a `Log` model which
will store the message and id of the task:

```bash
bundle exec rails g model log
```

Add the following into the migration file with suffix `_create_logs.rb`, which
is automatically generated by running above command:

```ruby
class CreateLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :logs do |t|
      t.integer :task_id
      t.text :message
      t.timestamps
    end
  end
end
```

Let's run the migration:

```bash
bundle exec rails db:migrate
```

Let's add validations to the `Log` model:

```ruby {2,3}
class Log < ApplicationRecord
  validates :message, presence: true
  validates :task_id, presence: true
end
```

Sometimes the tests fail because the `Test` db is not prepared. In case of such
error run the following command:

```bash
bundle exec rails db:test:prepare
```

Update the perform method in `TaskLoggerJob`:

```ruby
  def perform(task_id)
    task = Task.find(task_id)
    message = "A task was created with the following title: #{task.title}"

    log = Log.create! task_id: task.id, message:
    puts log.message
  end
```

We know that our job needs to be performed once we create a new task. So it's
necessary to have a reference to a `task` in our test cases. Let's create that
in our `setup` function, which gets run initially:

```ruby
  def setup
    @task = create(:task)
  end
```

Let's add a `fake` test, which doesn't rely on the response or side effects part
of our job:

```ruby
  def test_logger_runs_once_after_creating_a_task
    Sidekiq::Testing.fake! do
      assert_difference -> { TaskLoggerJob.jobs.size }, 1 do
        TaskLoggerJob.perform_async(@task.id)
      end
    end
  end
```

This fake testing mode operates in a way in which jobs are queued up in an array
rather than being executed immediately. Jobs within the queue can be queried,
inspected, and optionally “drained” to process enqueued jobs. This mode is
activated simply with the `fake!` directive. Testing this
way promotes decoupled and faster tests, as the background job doesn’t have to perform
any actual work. But using this mode isn’t appropriate for full on integration
testing or situations where you want to process jobs during a test.

It is good for testing that the jobs have been enqueued properly and in other
scenarios which don't require the result of execution.

But when working on real applications, these jobs perform some side
effects and we would be required to assure that those are performed as intended.
In such scenarios we can use the `inline` mode that runs the job immediately
instead of enqueuing it. Inline testing mode performs enqueued jobs
synchronously within the same process. So let's use inline mode for real testing
which needs results of jobs immediately after execution.

By default the mode is `inline!`. In most tests, we would require a mix of the
both the `inline!` as well as `fake!` modes. So let's create a test in the `inline` mode as follows and perform the job:

```ruby
  def test_log_count_increments_on_running_task_logger
    assert_difference "Log.count", 1 do
      TaskLoggerJob.new.perform(@task.id)
    end
  end
```

The above test ensures that our new log message/entry is added to the `Log`
table and thus it's `count` is incremented when we perform the `TaskLoggerJob`.

The final test file should look like this:

```ruby
# frozen_string_literal: true

require "test_helper"
require "sidekiq/testing"

class TaskLoggerJobTest < ActiveSupport::TestCase
  def setup
    @task = create(:task)
  end

  def test_logger_runs_once_after_creating_a_task
    Sidekiq::Testing.fake! do
      assert_difference -> { TaskLoggerJob.jobs.size }, 1 do
        TaskLoggerJob.perform_async(@task.id)
      end
    end
  end

  def test_log_count_increments_on_running_task_logger
    assert_difference "Log.count", 1 do
      TaskLoggerJob.new.perform(@task.id)
    end
  end
end
```

Voila! That's it. Now we have an idea on how to test our Sidekiq jobs. Sidekiq
has some of its own assertion methods and goodies. You can refer the
[official documentation](https://github.com/mperham/sidekiq/wiki/Testing) to
know more.

As a final note, just for understanding, the `disabled` mode signifies that
Sidekiq is not in testing mode. Thus the jobs are pushed to Redis. We don't use
this mode often while testing unless we want to mock the Redis part too.

## Clearing Sidekiq queues

Open the terminal and run the following commands to clear Sidekiq queues:

```bash
redis-cli flushdb
redis-cli flushall
```

Usually, when a Sidekiq test fails, it will automatically retry in the next
invocation since its state is taken from Redis.

Thus if we don't want it to run again, we can use the above commands to clear
the queues.

`flushdb` command is used to delete all the keys of the currently selected DB,
while `flushall` command removes all the keys of all the existing databases in
Redis.

These commands come in handy during testing, where some Sidekiq inline tests
behave weirdly. In other environments, please use them carefully only when it's
really needed.

Now let's commit changes made in this chapter:

```bash
git add -A
git commit -m "Configured Sidekiq for background job processing"
```
