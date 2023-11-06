In previous chapters, we had setup a base for writing unit tests and also learnt
the basics of writing unit tests with User model. Now let's deep dive on writing
unit tests by writing tests for the Task model.

## Setting up Task model test

Create the `task_test.rb` file by running the following command, if it doesn't
already exist:

```bash
touch test/models/task_test.rb
```

It's a convention to use `_test` suffix for all test file names. Now add the
following code inside `task_test.rb`:

```ruby
require "test_helper"

class TaskTest < ActiveSupport::TestCase
end
```

The class `TaskTest` can be called a test because it inherits from
`ActiveSupport::TestCase`. Because of the inheritance, every method that Rails
defines for testing is made available to `TaskTest` class.

By requiring `test_helper`, we have ensured the default configurations for
testing are made available.

## The setup method

As discussed in previous chapters, Rails will run the `setup` method
automatically before every test case. Therefore, we can use this method to run
common tasks like setting up demo data, loading configuration data, etc.

In this case, we can use it to avoid the redundant task creation statement in
every test case. Add following `setup` method in the `test/models/task_test.rb`
file:

```ruby {4-7}
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @task = create(:task, assigned_user: @user, task_owner: @user)
  end
end
```

While creating the test task, we have passed the test user object to create an
association between task and the user. If you recall from the
[Adding comments to task chapter](/learn-rubyonrails/adding-comments-to-tasks),
Task factory accepts user object to create an association.

Now onwards, we don't need to create a default test task or a test user unless
required otherwise. We can always make use of the instance variables.

## Testing timestamps columns

Add the following test case to `task_test.rb` file to test the `created_at` and
`updated_at` fields of the task record:

```ruby
def test_values_of_created_at_and_updated_at
  task = Task.new(title: "This is a test task", assigned_user: @user, task_owner: @user)
  assert_nil task.created_at
  assert_nil task.updated_at

  task.save!
  assert_not_nil task.created_at
  assert_equal task.updated_at, task.created_at

  task.update!(title: 'This is a updated task')
  assert_not_equal task.updated_at, task.created_at
end
```

Now let's test this test case.

Run the following command from the terminal:

```bash
bundle exec rails test test/models/task_test.rb -v
```

In the above test case, we are asserting that the values of the `created_at` and
`updated_at` attributes should be `nil` when the task is instantiated for the
first time.

When the record is saved to the database then we are asserting two things:

- `created_at` attribute's value shouldn't be a `nil` value.
- `updated_at` attribute's value should be equal to the value of `created_at`
  attribute, when we are creating a `task` for the first time.

From the second time onwards, once we update the task in the database then the
`updated_at` attribute's value should not be equal to the `created_at`
attribute's value.

## Testing association, length and format

Let's add some more test cases:

```ruby {11-20}
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = create(:user)
    @task = create(:task, user: @user)
  end

  # previous test case methods as it was

  def test_task_should_not_be_valid_without_user
    @task.assigned_user = nil
    assert_not @task.save
    assert_includes @task.errors.full_messages, "Assigned user must exist"
  end

  def test_task_title_should_not_exceed_maximum_length
    @task.title = 'a' * (Task::MAX_TITLE_LENGTH + 1)
    assert_not @task.valid?
  end

  def test_validation_should_accept_valid_titles
    valid_titles = %w[title title_1 title! -title- _title_ /title 1]

    valid_titles.each do |title|
      @task.title = title
      assert @task.valid?
    end
  end

  def test_validation_should_reject_invalid_title
    invalid_titles = %w[/ *** __ ~ ...]

    invalid_titles.each do |title|
      @task.title = title
      assert @task.invalid?
    end
  end
end
```

In the first test case, we have ensured that every task should have a user
association to be valid. The second test case validates that the maximum length
of the task's title should be 125 characters only. The third test case checks
whether the titles are of valid format, i.e, they have at least one alphanumeric
character. The fourth test case check whether titles are of invalid format.

## Setup method and mutation

The previous two test cases will get a fresh copy of `@task` from the `setup`
method.

Even if the first test case mutates the `@task` by setting `nil` value to the
associated `user` attribute, that particular mutation will not affect the
`@task` copy of the second test case.

Internally Rails will rollback all the database transactions performed in the
test case after that particular test case completes execution.

## Testing exceptions

Active Record provides a `find` method that loads the record in memory based on
the ID we provide it. If no such record exists, it raises a
`ActiveRecord::RecordNoFound` exception.

The following is an example of how such an exception can be tested:

```ruby
def test_exception_raised
  assert_raises ActiveRecord::RecordNotFound do
    Task.find(SecureRandom.uuid)
  end
end
```

`assert_raises` is a method that takes the names of exception classes and a
block. It tests whether the block, when executed, raises the exception that was
passed in the argument.

So in our example, we are testing if `Task.find` method will raise an exception
when we try querying the `Task` from database with a non-existent/invalid task
ID.

## Testing expressions

Let's test if creating a task has actually increased the number of records in
the database.

Add the following test case to `task_test.rb`:

```ruby
def test_task_count_increases_on_saving
  assert_difference ['Task.count'] do
    create(:task)
  end
end
```

Let's run the test using the following command:

```bash
bundle exec rails test test/models/task_test.rb -v
```

We'll notice that all the tests ran without any error.

The above code tests whether the count of `Task` table from database, changes by
a count of 1, after the block operation is executed.

The following test case will fail. Take a moment and think about why it will
fail.

```ruby
def test_task_count_increases_on_saving
  assert_difference ['Task.count'] do
    create(:task)
    create(:task)
  end
end
```

Running the above test would give us the following output:

```text
"Task.count" didn't change by 1.
Expected: 1
  Actual: 2
```

In the above case the block inside `assert_difference` has actually created two
task records, but we're asserting that it had created only one.

So how do we test this?

Fortunately for us `assert_difference` helps us pass the count to evaluate the
difference in the results of the expression. If we do not pass a count then the
assertion is ran against the default count which is 1.

Example:

```ruby
def test_task_count_increases_on_saving
  assert_difference ['Task.count'], 2 do
    create(:task)
    create(:task)
  end
end
```

The above code will not result in test failure as we are asserting that
`Task.count` has changed by 2 when the block which creates two new tasks were
executed.

To test that an expression has not changed, we can use `assert_no_difference`
method.

Rails provides a larger array of methods for testing and we haven't covered them
all in this chapter. The idea was to walk you through how testing can be done
and describe some of the methods that you are most likely to use in the testing.

We don't need to generate two tasks to verify the count is increasing right?
That is why the following test case code itself is good enough:

```ruby
def test_task_count_increases_on_saving
  assert_difference ['Task.count'], 1 do
    create(:task)
  end
end
```

We can also use `assert_difference` method to verify if the count is decreasing.
This can be useful while testing a `delete` operation. To do so, we have to pass
a negative count to the `assert_difference` method implying that the count has
decreased.

For example:

```ruby
def test_task_count_decreases_on_deleting
  assert_difference ['Task.count'], -1 do
    delete(:task)
  end
end
```

## Testing presence of an attribute

Previously, we had added some validations to our Task model. Now, let's add a
test case to check title presence validation:

```ruby
def test_task_should_not_be_valid_without_title
  @task.title = ""
  assert_not @task.valid?
end
```

Above, we are asserting that the task should be invalid without a title.

## Testing for the uniqueness of slugs

Let's add a test case to assert that the `slug` attribute is the `parameterized`
version of a tasks `title`:

```ruby
def test_task_slug_is_parameterized_title
  title = @task.title
  @task.save!
  assert_equal title.parameterize, @task.slug
end
```

Now let's add a few test cases to test whether the slug generation is working
correctly for various edge cases. We will test slug generation for two different
tasks in each of the test cases.

Case 1: When two tasks have duplicate two worded titles:

```ruby
def test_incremental_slug_generation_for_tasks_with_duplicate_two_worded_titles
  first_task = Task.create!(title: "test task", assigned_user: @user, task_owner: @user)
  second_task = Task.create!(title: "test task", assigned_user: @user, task_owner: @user)

  assert_equal "test-task", first_task.slug
  assert_equal "test-task-2", second_task.slug
end
```

Case 2: When two tasks have duplicate hyphenated titles:

```ruby
def test_incremental_slug_generation_for_tasks_with_duplicate_hyphenated_titles
  first_task = Task.create!(title: "test-task", assigned_user: @user, task_owner: @user)
  second_task = Task.create!(title: "test-task", assigned_user: @user, task_owner: @user)

  assert_equal "test-task", first_task.slug
  assert_equal "test-task-2", second_task.slug
end
```

Case 3: When one of the task's title is a prefix of the other task's title:

```ruby
def test_slug_generation_for_tasks_having_titles_one_being_prefix_of_the_other
  first_task = Task.create!(title: "fishing", assigned_user: @user, task_owner: @user)
  second_task = Task.create!(title: "fish", assigned_user: @user, task_owner: @user)

  assert_equal "fishing", first_task.slug
  assert_equal "fish", second_task.slug
end
```

As you can see, we can dynamically pass field values to factory-bot. Here we are
passing a value for `title` field with the same value as an already persisted
task.

The generated task will have the specified title, and not any fake data
generated by `Faker`.

Let's also test if an error is raised when a `duplicate slug` is being stored in
task table:

```ruby
def test_error_raised_for_duplicate_slug
  another_test_task = Task.create!(title: "another test task", assigned_user: @user, task_owner: @user)

  assert_raises ActiveRecord::RecordInvalid do
    another_test_task.update!(slug: @task.slug)
  end

  error_msg = another_test_task.errors.full_messages.to_sentence
  assert_match t("task.slug.immutable"), error_msg
end
```

Note that the `t('key')` method is part of the `TranslationHelper`, which reads
keys from the `en.yml` file.

According to our slug implementation logic, `slug` should be `immutable`. Let's
test to make sure that is the case when we update the title of a task:

```ruby
def test_updating_title_does_not_update_slug
  assert_no_changes -> { @task.reload.slug } do
    updated_task_title = 'updated task title'
    @task.update!(title: updated_task_title)
    assert_equal updated_task_title, @task.title
  end
end
```

The `assert_no_changes` method evaluates the expression in the lambda function
before and after executing the code block it wraps. If their values are
different, the test fails.

In the above test case, we were checking the task's `slug` before and after
updating its title. This test ensures that the slug remains the same even if the
title is changed.

In the above test case, we have also used the `reload` method. In the next
section let's take a look at why we had to use the `reload` method.

## Active Record reload method and its usage

Reloading is commonly used in test suites to test that something is actually
written to the database, or when some action modifies the corresponding row in
the database but not the object in memory.

Let's consider the example `test_task_count_increases_on_saving` test case in
`TaskTest` which tests if the count for total number of tasks in the database
increases upon creating a new task record.

The following need not be added to our test file:

```ruby
def test_task_count_increases_on_saving
  assert_difference ['Task.count'], 1 do
    create(:task)
  end
end
```

The above test case would work just fine without any issues because the `.count`
method dynamically runs a raw SQL query to fetch count from the corresponding
database.

Now let's take a hypothetical example where we use a background worker to update
a user's name to "Sam".

Let's say that `@user` is defined in the `setup` method of the test file.

In our test case we might be tempted to write the test case like this:

```ruby
def test_background_worker_should_update_name
  background_worker.process # updates name to Sam in DB
  assert_equal "Sam", @user.name
end
```

In the above code, if we use `@user.name`, then it will not reflect the latest
update and we will get the old value itself because when using `@user.name`, we
are using `@user` from the object memory and not from the updated record in
database.

Hence our assertion will fail.

That's why it's a good practice to use `@user.reload.name` instead of
`@user.name` to check the updated column values, like this:

```ruby
def test_background_worker_should_update_name
  background_worker.process
  assert_equal "Sam", @user.reload.name
end
```

Now, if we run the above test case, the assertion will pass.

During the creation of the `ActiveRecord` relation instance, Rails will pull all
the latest values of the attributes and we can query them using `@user` itself.

But once changes occur in database, we need to update our instance variable.

Thus we should call `reload` on it to fetch the latest data.

This is another reason why we prefer to use model name queries like
`Task.where(user: 'sam').count` in test cases.

This statement will always fetch latest database values, since we are directly
querying DB.

## Handling edge cases part of slug generation

All the following edge cases are self-explanatory from their test case name
itself.

Add the following test cases:

```ruby
def test_slug_suffix_is_maximum_slug_count_plus_one_if_two_or_more_slugs_already_exist
  title = "test-task"
  first_task = Task.create!(title:, assigned_user: @user, task_owner: @user)
  second_task = Task.create!(title:, assigned_user: @user, task_owner: @user)
  third_task = Task.create!(title:, assigned_user: @user, task_owner: @user)
  fourth_task = Task.create!(title:, assigned_user: @user, task_owner: @user)

  assert_equal "#{title.parameterize}-4", fourth_task.slug

  third_task.destroy

  expected_slug_suffix_for_new_task = fourth_task.slug.split("-").last.to_i + 1

  new_task = Task.create!(title:, assigned_user: @user, task_owner: @user)
  assert_equal "#{title.parameterize}-#{expected_slug_suffix_for_new_task}", new_task.slug
end

def test_existing_slug_prefixed_in_new_task_title_doesnt_break_slug_generation
  title_having_new_title_as_substring = "buy milk and apple"
  new_title = "buy milk"

  existing_task = Task.create!(title: title_having_new_title_as_substring, assigned_user: @user, task_owner: @user)
  assert_equal title_having_new_title_as_substring.parameterize, existing_task.slug

  new_task = Task.create!(title: new_title, assigned_user: @user, task_owner: @user)
  assert_equal new_title.parameterize, new_task.slug
end

def test_having_same_ending_substring_in_title_doesnt_break_slug_generation
  title_having_new_title_as_ending_substring = "Go for grocery shopping and buy apples"
  new_title = "buy apples"

  existing_task = Task.create!(
    title: title_having_new_title_as_ending_substring, assigned_user: @user,
    task_owner: @user)
  assert_equal title_having_new_title_as_ending_substring.parameterize, existing_task.slug

  new_task = Task.create!(title: new_title, assigned_user: @user, task_owner: @user)
  assert_equal new_title.parameterize, new_task.slug
end

def test_having_numbered_slug_substring_in_title_doesnt_affect_slug_generation
  title_with_numbered_substring = "buy 2 apples"

  existing_task = Task.create!(title: title_with_numbered_substring, assigned_user: @user, task_owner: @user)
  assert_equal title_with_numbered_substring.parameterize, existing_task.slug

  substring_of_existing_slug = "buy"
  new_task = Task.create!(title: substring_of_existing_slug, assigned_user: @user, task_owner: @user)

  assert_equal substring_of_existing_slug.parameterize, new_task.slug
end
```

Now run all the test cases and verify:

```bash
bundle exec rails test test/models/task_test.rb
```

All the test cases should be passing now.

## Creating multiple records

We want to add a test where we will create many tasks using the factory and then
check if all of them have a unique slug. Rather than creating a number of tasks
one by one using `create` method, we can use `create_list` method. This method
will create n-number of factory objects and return them as an array.

Let's add the following test case in `task_test.rb`:

```ruby
def test_creates_multiple_tasks_with_unique_slug
  tasks = create_list(:task, 10, assigned_user: @user, task_owner: @user)
  slugs = tasks.pluck(:slug)
  assert_equal slugs.uniq, slugs
end
```

Here, this `create_list` method creates 10 `tasks` in one line. After that, we
took slugs from the tasks array and checked their uniqueness. For more details
about `create_list` method check
[this section](https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md#building-or-creating-multiple-records)
from the factory bot official documentation.

## Testing task deletion and assignment on user deletion

Let's add test cases inside the `UserTest` class to test that all the tasks
created by a user are deleted when that user itself is deleted.

Add the following test cases into `UserTest`:

```ruby
def test_tasks_created_by_user_are_deleted_when_user_is_deleted
  task_owner = build(:user)
  create(:task, assigned_user: @user, task_owner:)

  assert_difference "Task.count", -1 do
    task_owner.destroy
  end
end
```

Add the following test case to check if the task will be assigned back to task
creator, when the user assigned to that particular task is deleted:

```ruby
def test_tasks_are_assigned_back_to_task_owners_before_assigned_user_is_destroyed
  task_owner = build(:user)
  task = create(:task, assigned_user: @user, task_owner:)

  assert_equal @user.id, task.assigned_user_id
  @user.destroy
  assert_equal task_owner.id, task.reload.assigned_user_id
end
```

To run these tests, execute the following command:

```bash
bundle exec rails test test/models/user_test.rb
```

## Maintaining test cases execution order

When you run your test suite, you might notice the following line in the output:

```bash {3}
bundle exec rails test -v
Running via Spring preloader in process 11579
Run options: -v --seed 13231
```

This is because Rails by default runs tests in random order. Each time you run
the test suite you will see a new seed value. This is a good thing because it
prevents your tests from accidentally becoming order-dependent due to state
leakage.

By state leakage, we meant a test becomes dependent on the result of the
previous test.

Ideally in a good test suite the order of running tests shouldn't matter. That's
how good tests are written without any state leakage.

One of the ways to set seed value while running test suite, is like this:

```bash
SEED=12345 PARALLEL_WORKERS=0 bundle exec rails test -v
```

We have set the seed value to `12345`. We have also set the `PARALLEL_WORKERS`
value to `0`. We are using parallelization in our test suite. So even after
setting the seed value tests will be executed in random order because multiple
tests will be executed in a parallel fashion. Here to see the working seed value
we have set the value of `PARALLEL_WORKERS` to `0` so that no parallelization
will be there and we can see the same order in the execution of tests.

We can also pass seed value using `-s` flag like this:

```bash
PARALLEL_WORKERS=0 bundle exec rails test -v -s 12345
```

So now each time when you run a test suite with the above command, your tests
and test case's execution order is maintained with the same seed.

If you find that your tests are breaking randomly, it is most likely due to
state leakage.

In such cases, you can re-run your tests with the same seed value to verify the
problem.

### Other ways of maintaining test cases execution order

We can set the order in which test cases should run by using the `test_order`
method. The `test_order` method can be added in the configuration block of the
`config/environments/test.rb` file like this.

No need to add it in your application. The following is only an example:

```ruby
config.active_support.test_order = :alpha
```

After adding the above config, tests should execute alphabetically by method
name.

Possible values of test order set via environment config are `:random`,
`:sorted` and `:parallel`. This option is set to `:random` by default in
`config/environments/test.rb` in newly-generated applications.

We can also specify the `test_order` method for a particular test, instead of
adding `test_order` configuration for all tests.

Example:

```ruby {2}
class SampleTest < ActiveSupport::TestCase
  self.test_order = :alpha

  # test cases goes here
end
```

### Problems with parallelization tests

Parallelization is added to decrease the execution time of the tests. It speeds
up the test suite by running multiple processes in parallel. But adding
parallelization can also lead to some problems:

- If we add parallelization to a small number of tests then the test suite ends
  up being slower than running tests without parallelization. Adding
  parallelization to tests comes with significant overhead like creating
  multiple databases for parallel processing. This overhead eliminates the
  speedup we might get when we run a small number of tests in parallel. Thus if
  the number of tests is less it's better to disable parallelization. Rails 7
  fixed this problem by enabling parallel execution only when you execute many
  tests.
- The second problem we might see is the "flaky" tests. The "flaky" tests are
  the tests that fail randomly without our knowledge. These tests use some
  common resources. When one of the tests updates this common resource it
  affects the working of other tests and results in random failure of tests. We
  have discussed the "flaky" tests and its solution later in this chapter.

### Parallelize selective tests

There can be a case where we only want to parallelize selective tests rather
than the whole test suite. We can enable parallelization only for a subset of
tests.

Let's see how we can parallelize selective tests in our Granite application.
First, comment out the following line from the `test_helper.rb` to disable
parallelization:

```ruby
# parallelize(workers: :number_of_processors) unless ENV["COVERAGE"]
```

Create a new file named `parallelization_enabler.rb` in the `test/support`
directory like this:

```bash
touch test/support/parallelization_enabler.rb
```

Add the following code in the `parallelization_enabler.rb` file:

```ruby
module ParallelizationEnabler
  def self.included(base)
    base.class_eval do
      parallelize(workers: :number_of_processors)
    end
  end
end
```

We use forks by default over threads option in parallelize method. All the test
class that includes this module will now run their tests in parallel. Let's add
parallelization in the `Comment` model tests.

Update the highlighted line in `comment_test.rb` file:

```ruby {2,5}
require "test_helper"
require "support/parallelization_enabler"

class CommentTest < ActiveSupport::TestCase
  include ParallelizationEnabler

  # rest of the code
end
```

Now to verify if parallelization is added successfully or not add the following
lines in the `test_helper.rb`:

```ruby
parallelize_setup do
  puts "New process is forked"
end
```

After adding the above-mentioned code, every time a new process is forked
`New Process is forked` will be printed in the output. The number of forks
depends on the number of processors in the machine.

Let's run the `comment_test.rb` file like this:

```bash
bundle exec rails test test/models/comment_test.rb
```

The output will look something like this:

```bash
# Running:

New process is forked
New process is forked
....

Finished in 1.064065s, 3.7592 runs/s, 3.7592 assertions/s.
4 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

We have successfully added parallelization in the `Comment` model.

Now let's remove the parallelization from `comment_test.rb` file and run the
file again.

The output will look something like this:

```bash
# Running:

....

Finished in 0.320782s, 12.4695 runs/s, 12.4695 assertions/s.
4 runs, 4 assertions, 0 failures, 0 errors, 0 skips
```

We can verify from the output that no new process is forked in this case. One
more thing to notice here is the execution time is more and runs/s are less when
we enable parallelization in `comment_test.rb`. As mentioned in the last section
when the number of tests is less adding parallelization decreases the speed of
the test suite.

The changes we made in this section are just to demonstrate the process for
adding parallelization for selective tests. We can undo these changes and enable
the parallelization for the whole test suite, as follow:

- Remove the above-highlighted lines from the `comment_test.rb` and
  `test_helper.rb` files.
- Remove the `parallelization_enabler.rb` file like this:

```bash
rm -rf test/support/parallelization_enabler.rb
```

- Uncomment the following line from the `test_helper.rb` to enable
  parallelization for whole test suite:

```ruby
parallelize(workers: :number_of_processors) unless ENV["COVERAGE"]
```

## Things to pay attention to

### Use bang method whenever possible

Let's assume for a while we are using plain old hardcoded way to generate test
data and are not using any factories to do the same.

The difference between bang method (`create!`) and a normal method (`create`) is
that the normal method doesn't raise any exception.

For example, consider the following code:

```ruby
def setup
  @user = User.create(name: "Sam Smith", email: "sam@example.com",
    password: 'welcome')
end
```

Here we are using a non-bang method (`create`) to create a user.

Let's take the case where there already exists an user with email as
`sam@example.com` in the database.

Thus on executing above creation statement, we are expecting Rails will raise an
exception since email field is set to be unique.

But if we don't use a bang method, such an exception won't be raised.

Rather it will set the value of `@user` to `nil` when an internal error occurs.

Now some test cases will fail for a different reason and we will have to spend
time debugging it.

Due to this reason, we prefer the fail-fast approach while writing tests. We
want the test to break immediately when an error occurs.

Using bang method, that is `create!`, will ensure that it raises an
`UniqueConstraint` exception when it fails.

The following is the preferred way to create the record:

```ruby
def setup
  @user = User.create!(name: "Sam Smith", email: "sam@example.com",
    password: 'welcome')
end
```

### Test class name should be unique and in PascalCase

The test class name should always be unique and should be the `PascalCase`
version of the test file name. If two test classes have the same name then it
can result in a test failure. Because the wrong `setup` method will be invoked
and the required variable will not be set for the test.

For example, consider a file called `organization_test.rb`, like this:

```ruby
require "test_helper"

class OrganizationTest < ActiveSupport::TestCase
  def setup
    @user = "Sam"
  end

  def test_checks_the_sam_user
    assert_equal "Sam", @user
  end
end
```

Consider a second file called `category_test.rb`, like this:

```ruby
require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup
    @user = "Oliver"
  end

  def test_checks_the_oliver_user
    assert_equal "Oliver", @user
  end
end
```

Both of above mentioned files work perfectly fine and the test suite will also
run successfully. Now say by mistake we named the `CategoryTest` as
`OrganizationTest` while keeping the file name as `category_test.rb`, then the
`test_checks_the_oliver_user` test will fail, like this:

<image>wrong-class-name-example.png</image>

The above test failed because of the wrong class name for the test file. In the
above mentioned test, `setup` method of `OrganizationTest` class from
`organization_test.rb`, was invoked which sets the `@user` variable to `Sam` and
thus led to the failure of the `category_test.rb` file.

### rails/test_help.rb file

The `test_help.rb` file which is required by the default generated test helper
will automatically keep your test database up-to-date with `db/schema.rb`. It
raises an error if reloading the schema does not resolve all pending migrations.
This file also takes care of the testing environment and loads the test db.

For more details, please refer the
[test_help.rb](https://github.com/rails/rails/blob/main/railties/lib/rails/test_help.rb)
file from the Rails repo.

## Different styles of writing a test case

The first way of writing test case is using a Ruby method. But for this you have
to come up with a descriptive method name which is sometimes annoyingly long and
hard to read. Also joining words using underscore needs to be done manually.

For example consider one of the previous test cases we had added:

```ruby
def test_error_raised_for_duplicate_slug
  another_test_task = Task.create!(title: "another test task", user: @user)

  assert_raises ActiveRecord::RecordInvalid do
    another_test_task.update!(slug: @task.slug)
  end

  error_msg = another_test_task.errors.full_messages.to_sentence
  assert_match t("task.slug.immutable"), error_msg
end
```

Another way of writing test case is using test block which allows us to use a
string to describe our test and gives better readability:

```ruby
test "should raise an error when the slug is duplicated" do
  another_test_task = Task.create!(title: "another test task", user: @user)

  assert_raises ActiveRecord::RecordInvalid do
    another_test_task.update!(slug: @task.slug)
  end

  error_msg = another_test_task.errors.full_messages.to_sentence
  assert_match t("task.slug.immutable"), error_msg
end
```

and the `setup` method gets modified like this:

```ruby
setup do
  ...
end
```

Technically there is no difference between both the ways of writing test cases.

But we should stick to using Ruby methods. When we use the `test_` prefix we can
easily navigate among different tests by searching with the `test_` keyword.
When a test case fails it shows the name of failed test in `snake_case`. So, if
we have used the Ruby method to define the test case we can directly search for
the failed test case by name and can resolve the error faster.

## Executing a single test case

Every time we run the below command, we notice that all the test cases in the
file are being run:

```bash
bundle exec rails test test/models/task_test.rb -v
```

Now go to `task_test.rb`, and choose a test case of your choice. Let's say you
selected the first test case that we added
`test_values_of_created_at_and_updated_at`.

Note down the line number in file where this test case is starting. Let's assume
that line number is 8.

Now run the following command in the terminal:

```bash
bundle exec rails test -v test/models/task_test.rb:8
```

Voila! We see that only one test case has been run, which is
`test_values_of_created_at_and_updated_at`.

That's because we have suffixed the test filename with a `:8` in the command.

It means, we are asking Rails to run only the test case whose code is present in
line number 8.

You can try out running a different test starting at a different line number.

## Flaky tests

Test cases should be independent of each other. Irrespective of the order in
which tests are executed they should give the same results. Every test case in
the test suite should be idempotent which means it should produce the same
results when executed once or multiple times.

Flaky tests are tests that produce inconsistent results meaning it sometimes
passes and sometimes fails when run with the same inputs and conditions.
Although the roots of such inconsistent behavior can be traced to several
reasons, the most common cause of flaky tests can be ascribed to
environment-specificity. Some tests may depend on specific environmental
conditions, such as the availability of certain resources or system
configurations, which can lead to inconsistent results. Let us see one such
scenario.

If we are changing any environment variable in any test then we are making a
global change. That means updating an env variable can change the working of
other tests. This can lead to "flaky" tests.

Let's consider an example. Create a file named `flaky_env_variable_test.rb` in
the `test` directory and paste the following code:

```ruby
require "test_helper"

class FlakyEnvVariableTest < ActiveSupport::TestCase
  def test_one_check_the_env_value
    assert_equal "test", Rails.env
  end

  def test_two_check_the_env_value
    assert_equal "test", Rails.env
  end

  def test_three_check_the_env_value
    assert_equal "test", Rails.env
  end

  def test_four_check_the_env_value
    assert_equal "test", Rails.env
  end

  def test_five_check_the_env_value
    assert_equal "test", Rails.env
  end

  def test_update_the_env_value
    Rails.env = "production"
    assert_equal "production", Rails.env
  end
end
```

So in the above tests, we are asserting the `Rails.env` value. In this case, the
default value of this `Rails.env` is `test` but in one of the above-mentioned
tests, that is `test_update_the_env_value`, we have updated this value to
`production`. This value update of `Rails.env` is a global change, meaning it's
not restricted within a block, and will affect the working of other tests. Run
the test file several times to see some of the tests will fail randomly because
of this global change. In very simple terms, if we update `Rails.env` to
`production` in one of the test cases, then in one of the other test cases, when
we assert `assert_equal "test", Rails.env`, it has a chance for failure because
the value of `Rails.env` has been updated.

We can run this test file using the following command:

```bash
bundle exec rails test -v test/flaky_env_variable_test.rb
```

There isn't one-for-all plugin solution to fix flaky tests. But here, in the
case of env variables, what we should be doing is modifying the env variable
only for the particular test case where it's actually necessary and then
reverting the value of the env variable back to its original value before
finishing the test case.

We can update `test_update_the_env_value` like this:

```ruby
def test_update_the_env_value
  Rails.env = "production"
  assert_equal "production", Rails.env
  Rails.env = "test"
end
```

In the test above we updated the env variable but resets the value just before
exiting the function. Thus this test will not affect the results of other tests.

We can also use the `teardown` method from `minitest`. The `teardown` is a
method that runs after every test case and thus can be used for cleanup
operations.

We can define the `teardown` method like this right after the `setup` method.
Always keep the `teardown` method towards the top of the test file:

```ruby
def teardown
  #reset the env variables
  Rails.env = "test"
end
```

In the above example, we are updating the env variable only in one test case.
But that may not be the case in an actual code base. There might be many tests
that have similar logic. So it's possible that we modify the env variable, but
forget to revert it back to its original state. To avoid such cases, using the
`stub` method from `minitest` is the best solution. This method updates the
variable only for a block. Outside the `stub` block, all the variables are
unchanged.

We can define a `stub` method like this:

```ruby
def test_update_the_env_value
  Rails.stub :env, "production" do
    assert_equal "production", Rails.env
  end
  assert_equal "test", Rails.env
end
```

Also, add the following line at the top of the `flaky_env_variable_test.rb`
file:

```ruby
require "minitest/mock"
```

Impetuous use of Sidekiq modes can also lead to flaky tests. In one of the
future chapters, dealing with Sidekiq testing, we will discuss this scenario in
detail.

## Debugging with minitest-bisect

In large applications, it's difficult to track down the "flaky" tests because it
can take a lot of time, like say hours, to run the complete test suite and each
time any random test can fail. The `minitest-bisect` gem helps us in hunting
down the "flaky" tests. It efficiently figures out the minimal reproduction of
the random failure so that we can actually focus on the problem. With the help
of this gem, we can reproduce the same failing test and work on the cause of the
problem.

Add the following line in the `Gemfile` under the `test` block:

```ruby
gem 'minitest-bisect'
```

Then install the newly added gem:

```bash
bundle install
```

Let's first run the test suite normally like this:

```bash
bundle exec rails test
```

The output will look something like this:

<image>flaky-tests-1.png</image>
<image>flaky-tests-2.png</image>

We can see that the above test run fails. The test suite started with some
random seed value which is `24892` in our case. We will use this seed value of
the failed test run with the `minitest-bisect` command to run the tests in the
same order like this:

```bash
bundle exec minitest_bisect --seed 24892
```

The `minitest-bisect` gem will minimize the number of files and then the number
of methods from the test suite to reproduce the same results with a minimum
number of tests. The output of the `minitest-bisect` command will look something
like this:

<image>minitest-bisect-1.png</image>
<image>minitest-bisect-2.png</image>

We can see that it has found the culprit methods which are causing the random
failures in the tests. The important part of this output is the statement
mentioned as `Run options` at the last. It shows the culprit methods and their
order of execution like this:

```bash
Run options: --seed 24892 -n "/^(?:FlakyEnvVariableTest#(?:test_two_check_the_env_value|test_update_the_env_value|test_five_check_the_env_value|test_three_check_the_env_value))$/"
```

We can use this statement while running tests to reproduce the same failing
tests again and work on the root cause of the problem. We can run the test suite
with the above mentioned statement like this:

```bash
bundle exec rails test --seed 24892 -n "/^(?:FlakyEnvVariableTest#(?:test_two_check_the_env_value|test_update_the_env_value|test_five_check_the_env_value|test_three_check_the_env_value))$/"
```

The `minitest-bisect` gem helps us in reproducing the same failing tests
efficiently so that we can debug the "flaky" tests easily.

This `flaky_env_variable_test.rb` we created is just for example purposes. This
file is not required in the `granite` project and we can delete this file like
so:

```bash
rm -rf test/flaky_env_variable_test.rb
```

This brings us to the end of the chapter on Unit testing in detail.

You can read more about the different assertions from the official documentation
for [MiniTest](https://docs.ruby-lang.org/en/2.1.0/MiniTest/Assertions.html).

Also, You can read more on Rails testing in the official
[Rails testing guide](https://guides.rubyonrails.org/testing.html).

Let's commit changes made in this chapter:

```bash
git add -A
git commit -m "Added unit tests for Task model"
```
