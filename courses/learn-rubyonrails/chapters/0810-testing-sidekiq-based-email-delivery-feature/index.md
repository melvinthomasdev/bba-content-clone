In this chapter, we are going to create the test cases for the models, jobs
and services that we had created in the previous chapter.

## Adding tests for the User model

Let's incrementally add the following test cases into
`test/models/user_test.rb`.

Let's test if user preference is created when a new user is created:

```ruby
def test_preference_created_is_valid
  @user.save
  assert @user.preference.valid?
end
```

Let's add another test to verify the default preference saved for the user is
the same as the `DEFAULT_NOTIFICATION_DELIVERY_HOUR` which we defined in our
`config/initializers/constants.rb` file:

```ruby
def test_notification_delivery_hour_uses_default_value
  @user.save
  assert_equal Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR, @user.preference.notification_delivery_hour
end
```

We have used the `assert_equal` method to check if the two values provided are
equal.

## Adding tests for the Preference model

Open `test/models/preference_test.rb` and let's create a `preference` instance
in the `setup` method so that it's available to all the test cases:

```ruby
require 'test_helper'

class PreferenceTest < ActiveSupport::TestCase
  def setup
    user = create(:user)
    @preference = user.preference
  end
end
```

Let's test that a preference is invalid if `notification_delivery_hour` is not
present.

Add the following code to the test file:

```ruby
def test_notification_delivery_hour_must_be_present_and_valid
  @preference.notification_delivery_hour = nil
  assert @preference.invalid?
  assert_includes @preference.errors.messages[:notification_delivery_hour], t('errors.messages.blank')
end
```

In the above code, we have used `assert_includes`.

The `assert_includes` assertion takes in two arguments and checks whether the
second argument is included in the first argument, which is a collection.

We have used `errors.messages`, to get all the errors in `hash` format.

In this hash, the key is the attribute's name and its value is an array of error
messages specific to that attribute.

Below is an example showing how the hash value looks like:

```ruby
> @preference.errors.messages
{
  :notification_delivery_hour=>["Notification Delivery Hour is required."]
}
```

Here, since `preference` is invalid, the model should be ideally raising a
validation error.

We are just making sure that the error is actually raised and the message raised
is the same as what we had.

In our `Preference` model the value of `notification_delivery_hour` should only
take in default business hour values which are in the range of 0 to 23.

Thus we have to test that the `Preference` model will be invalid if an invalid
value is provided to `notification_delivery_hour`.

When testing for invalid values, we should always prefer to test the n-number of
such values.

This is to make sure that we are weeding out any edge cases. The same logic
applies when testing valid values.

Add the following code to the test file:

```ruby
def test_notification_delivery_hour_should_be_in_range
  invalid_hours = [-10, -0.5, 10.5, 23.5, 24]

  invalid_hours.each do |hour|
    @preference.notification_delivery_hour = hour
    assert @preference.invalid?
  end
end
```

## Adding tests for the UserNotification model

Let us first create a new factory to generate instances of `UserNotification`
model. Create and open `test/factories/user_notification.rb` and add the
following contents to it:

```ruby
# frozen_string_literal: true

FactoryBot.define do
  factory :user_notification do
    user
    last_notification_sent_date { Time.zone.today }
  end
end
```

As you can see, we haven't used faker here. We can pass any Ruby expression as
the fields value for generated objects in the factory definition.

Open `test/models/user_notification_test.rb` and let's create `setup` for the
test cases:

```ruby
require 'test_helper'

class UserNotificationTest < ActiveSupport::TestCase
  def setup
    @user_notification = create(:user_notification)
  end
end
```

In the above code, we have used `Time.zone.today` instead of using the default
Ruby `Time`, `Date` and `DateTime` classes.

If we use Ruby default classes, it will not show time in the time zone specified
by `config.time_zone` in `application.rb`.

That's the reason why we should always use Active Support methods of `Time.zone`
to pick up the Rails time zone.

Let's test that a `user_notification` is invalid if
`last_notification_sent_date` is not present:

```ruby
def test_last_notification_sent_date_must_be_present
  @user_notification.last_notification_sent_date = nil
  assert @user_notification.invalid?
  assert_includes @user_notification.errors.messages[:last_notification_sent_date], t('errors.messages.blank')
end
```

Let's add another test to check `last_notification_sent_date` must be a parsable
date:

```ruby
def test_last_notification_sent_date_must_be_parsable
  # The value of date becomes nil if provided with invalid date.
  # https://github.com/rails/rails/issues/29272

  not_parsable_dates = ["12-13-2021", "32-12-2021", "11-00-2022"]
  not_parsable_dates.each do |not_parsable_date|
    @user_notification.last_notification_sent_date = not_parsable_date
    assert_nil @user_notification.last_notification_sent_date
  end
end
```

When we provide a string value to a `datetime` field, Rails will try to parse
that string to make sure it's a valid date.

In the case where the string passed in is not a valid date, Rails will store
`nil` value to that particular field. That's the default Rails behaviour.

This is actually the way
[Rails typecasts](https://github.com/rails/rails/issues/29272).

We can use the `_before_type_cast` accessor to apply the validation. But since
that brings in some obfuscation, let's go with the default behaviour of Rails.

In our test case, we are trying to store a date string whose month is `13`,
which is invalid. Thus Rails will typecast it into `nil` when storing it in the
field.

So that is the reason why we are using the `assert_equal` method for
`last_notification_sent_date` attribute to verify it is nil for an invalid date.

Notice that we have tested against multiple data. This re-emphasizes the need
for general test cases.

Let's add another test to make sure `user_notification` is invalid if
`last_notification_sent_date` is set to a past date:

```ruby
def test_last_notification_sent_date_cannot_be_in_past
  @user_notification.last_notification_sent_date = Time.zone.yesterday
  assert @user_notification.invalid?
  assert_includes @user_notification.errors.messages[:last_notification_sent_date], t('date.cant_be_in_past')
end
```

## Adding tests for the TodoNotificationsJob

Open `test/jobs/todo_notifications_job_test.rb` and paste the following
into it:

```ruby
# frozen_string_literal: true

require 'test_helper'

class TodoNotificationsJobTest < ActiveSupport::TestCase
  def setup
    @user = create(:task).assigned_user # assignee of the generated task
    default_mail_delivery_time = "#{Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR}:00 AM"
    travel_to DateTime.parse(default_mail_delivery_time)
  end

  def test_todo_notification_job_sends_email_to_users_with_pending_tasks
    assert_difference -> { @user.user_notifications.count }, 1 do
      TodoNotificationsJob.perform_async
    end
  end
end
```

In the above test case, we have populated the required models in the `setup`
method, and then tested whether our job is actually sending mails
successfully, if it's the actual delivery time.

As you can see, we are using the `travel_to` helper in our `setup` method.

`travel_to` helper changes the current time to the given time by stubbing
`Time.now`, `Date.today`, and `DateTime.now` to return the time or date passed
into this method. The stubs are automatically removed at the end of the test.

We know that the default mail delivery time is 10 AM. So if the job runs at
this specific time, then it should be able to send the mail.

Thus, in our test case, instead of waiting for the time in our system to be 10
AM, we are temporarily setting the time as 10 AM by using the `travel_to`
helper.

`assert_difference` method allows us to check that a value has changed by a
given amount after a block has been executed.

Here in our code, we passed the lambda function
`-> { @user.user_notifications.count }` which returns the total records present
in the `user_notifications` table for that user.

Lambda functions are the method created using the literal lambda operator
`-> {}`.

You can also use the `lambda` keyword instead of `->` but the literal operator
is succinct and commonly used.

Once the mail is successfully sent to the user, the
`last_notification_sent_date` attribute in the `user_notifications` table will
be set with today's date for that particular user.

That's the reason why we are asserting that the count in `user_notifications`
for that particular user has been changed by one, given that we are only sending
one mail.

## Adding tests for the UserNotificationsJob

Open `test/jobs/user_notifications_job_test.rb` and paste the following
into it:

```ruby
require 'test_helper'
class UserNotificationsJobTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
  end

  def test_task_mailer_jobs_are_getting_processed
    assert_difference -> { @user.user_notifications.count }, 1 do
      UserNotificationsJob.perform_async(@user.id)
    end
  end
end
```

Similar to how we tested `TodoNotificationsJob`, here also we used the
`assert_difference` method to check whether the mail has been successfully sent
to the user.

## Creating support or helper files for tests

In Rails, we can create support files for testing. These are helper modules
which can be used by any test file by importing it.

Let's create the `support` directory which will have the helper modules.

An example of such a support test module is a `SidekiqHelper`.

When testing Sidekiq queues, we are often required to manipulate the Redis queue
before and after the test cases. Rather than doing it manually each time, we
delegate it to a support method:

```bash
mkdir -p test/support
touch test/support/sidekiq_helper.rb
```

The following is an example of how the module, which will be located at
`test/support/sidekiq_helper.rb`, will look like. You don't have to create this
file since we won't be testing any Sidekiq queue related processing.

```ruby
# frozen_string_literal: true

module SidekiqHelper
  def clear_redis_data
    Sidekiq.redis do |conn|
      conn.keys("cron_job*").each do |key|
        conn.del(key)
      end
    end
  end

  def clear_sidekiq_queues
    Sidekiq::Queue.all.each do |queue|
      queue.clear
    end
  end

  def after_teardown
    Sidekiq::Job.clear_all
    super
  end
end
```

It is important to understand when you would want to manipulate the Redis queue
in your test cases. This will help you decide whether to include the above
module or not. One common scenario where such methods would be useful is when
dealing with flaky tests. Let us see this in detail.

Sidekiq offers three different testing
[modes](https://github.com/mperham/sidekiq/wiki/Testing):

- A **fake** mode that pushes all jobs into a jobs array. Here no job processing
  is performed. This is the default mode.
- An **inline** mode that runs the job immediately instead of enqueuing it.
- A **disabled** mode where jobs are enqueued in Redis and processed normally.

To change the testing mode in Sidekiq, you can use the `Sidekiq::Testing`
module. But it should be noted that such a change is a global change and can
cause unexpected behavior for randomized or parallelized tests.

Assume we have to test the presence of a job in the queue. In this case, we do
not need to execute the job. We only need to enqueue it and then test whether
the length of the queue is increased by one. Hence, the default `fake` mode
would suffice over here. But one should note that the Sidekiq job queues are global
and will therefore persist between tests. So if you are writing another test
case, that utilizes the same queue, but focuses on the execution of the job, it
might be a good idea to clear the Sidekiq job queue using `after_teardown` provided
above and then switch to the `inline` mode. Otherwise, your tests will bleed
state, and your test suite will become order dependent. Using
`Sidekiq::Testing.inline!` can help prevent flaky tests by ensuring that
background jobs are processed immediately, rather than being enqueued for
processing by Sidekiq jobs.

It's generally a best practice to change the mode within the context of a block
so that the change only affects the specific test or set of tests that you're
working on. This helps to ensure that the behavior of your tests is consistent
and predictable, even when they are run in randomized or parallelized
environments.

In the cases where you'd want to use these support modules, we have to require
it in the test file and include it within the class.

Here is an example of importing the helper module:

```ruby
require  "support/sidekiq_helper"

class TodoNotificationServiceTest < ActiveSupport::TestCase
  include SidekiqHelper
end
```

Requiring these modules manually in the test files can be a repetitive chore.

Thus in cases where we want to use support modules, we can automate the
`require` part, by adding the following in our `test_helper`:

```ruby
Dir[Rails.root.join("test/support/**/*.rb")].each { |f| require f }
```

Note that adding the above statement, would only automatically `require` the
files.

You'd still have to manually include the required modules within your test class
when needed.

## Adding tests for the TodoNotificationService

Let's create `todo_notification_service_test` file in the `tests/services` directory :

```bash
touch test/services/todo_notification_service_test.rb
```

While testing this service we are going to make sure that the user preferences
are always respected before sending mail.

We will also ensure that idempotency is handled.

Open the file and paste the following into it:

```ruby
# frozen_string_literal: true

require "test_helper"
require  "support/sidekiq_helper"
class TodoNotificationServiceTest < ActiveSupport::TestCase
  include SidekiqHelper

  def setup
    @sam = create(:task).assigned_user # assignee of the generated task
    @nancy = create(:task).assigned_user # assignee of another generated task

    default_mail_delivery_time = "#{Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR}:00 AM"
    travel_to DateTime.parse(default_mail_delivery_time)
  end

  def test_notification_job_is_invoked_for_users_receiving_mail_for_first_time
    assert_difference -> { @sam.user_notifications.count }, 1 do
      todo_notification_service.process
    end
  end

  def test_notification_job_is_invoked_for_users_according_to_delivery_hour_preference
    delivery_hour_in_future = Constants::DEFAULT_NOTIFICATION_DELIVERY_HOUR + 1
    @sam.preference.update(notification_delivery_hour: delivery_hour_in_future)

    assert_difference -> { UserNotification.count }, 1 do
      todo_notification_service.process
    end
  end

  def test_notification_job_is_invoked_only_for_users_with_should_receive_email_enabled
    @sam.preference.update(should_receive_email: false)

    assert_difference -> { UserNotification.count }, 1 do
      todo_notification_service.process
    end
  end

  def test_notification_job_is_invoked_only_for_users_yet_to_receive_notification_today
    create(:user_notification, user: @sam)

    assert_difference -> { UserNotification.count }, 1 do
      todo_notification_service.process
    end
  end

  private

    def todo_notification_service
      TodoNotificationService.new
    end
end
```

## Adding tests for the TaskMailer

We can also write a test case for our `TaskMailer` to check if `ActionMailer` is
actually delivering our mails or not.

Open `test/mailers/task_mailer_test.rb` and paste the following into it:

```ruby
require 'test_helper'

class TaskMailerTest < ActionMailer::TestCase
  def setup
    @user = create(:user)
  end

  def test_task_mailer_is_delivering_mails
    email = TaskMailer.pending_tasks_email(@user.id).deliver_now
    assert_not ActionMailer::Base.deliveries.empty?
    assert_equal ["no-reply@granite.com"], email.from
    assert_equal [@user.email], email.to
    assert_equal "Pending Tasks", email.subject
  end
end
```

Let us also test if `user_notification` is generated after an email regarding
pending tasks has been sent to the user. Add the following test case to
`TaskMailerTest`:

```ruby
def test_task_mailer_after_action_create_user_notifications
  assert_equal 0, UserNotification.count
  TaskMailer.pending_tasks_email(@user.id).deliver_now

  assert_equal 1, UserNotification.count
end
```

Now, add a test case to verify that no email is being sent in case the receiver
or user with given `user_id` is not present:

```ruby
def test_task_mailer_shouldnt_deliver_email_if_receiver_is_not_present
  email = TaskMailer.pending_tasks_email("").deliver_now
  assert ActionMailer::Base.deliveries.empty?
  assert_nil email
end
```

In the above code, we have used the `pending_tasks_email` method created in
`TaskMailer`, which will find the user with the user id and all the pending
tasks associated with that user, to send the mail.

Also, we have used `deliver_now` on the `TaskMailer` to send the mail.

We can also use the `deliver_later` helper method to enqueue the mail to be
delivered through Active Job. When the job runs it will send the mail using
`deliver_now`.

Here, we are using the `deliver_now` method, as we did not want to wait for mail
delivery.

`ActionMailer::Base.deliveries` keeps an array of all the mails sent out through
the `ActionMailer`.

Thus we are asserting that after successfully sending the mail
`ActionMailer::Base.deliveries?` is not empty, since it's an array of emails
already sent out.

This was the last test case. So we have completely tested and fortified our
Sidekiq email sending feature.

You can run all the test cases by using `bundle exec rails t -v`.

You can also append a specific test file's path to this command to make it run
only a single test file.

Now let's commit these changes:

```bash
git add -A
git commit -m "Added test cases for sidekiq email sending feature"
```
