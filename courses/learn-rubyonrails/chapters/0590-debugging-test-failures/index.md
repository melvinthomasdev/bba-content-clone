While running all the test cases there are chances some might fail. In this
chapter we take a look at the tools that we can use to debug our code to figure
out why the failure occurred and to fix it.

Let's run a test file which has been taken from the "granite" application, but
has been modified to make sure some test cases will fail for debugging purposes.

The following are the different failures that we may encounter:

```bash {85}
$ bundler exec rails test test/models/task_test.rb
Running via Spring preloader in process 85217
Run options: --seed 40122

# Running:

A task was created with the following title: Et laboriosam aliquam vero.
A task was created with the following title: test task
A task was created with the following title: test task
F

Failure:
TaskTest#test_incremental_slug_generation_for_tasks_with_duplicate_two_worded_titles [/Users/mre/bb/granite/test/models/task_test.rb:51]:
Expected: "test-task-22"
  Actual: "test-task-2"


rails test test/models/task_test.rb:47

A task was created with the following title: Voluptatem molestiae enim sed.
F

Failure:
TaskTest#test_task_slug_is_parameterized_title [/Users/mre/bb/granite/test/models/task_test.rb:44]:
--- expected
+++ actual
@@ -1 +1 @@
-"voluptatem-molestiae-enim-sed "
+"voluptatem-molestiae-enim-sed"



rails test test/models/task_test.rb:41

A task was created with the following title: Ut qui sed minima.
.A task was created with the following title: Minus enim et perferendis.
A task was created with the following title: buy 2 apples
A task was created with the following title: buy
.A task was created with the following title: Cum aut eos porro.
A task was created with the following title: Fugiat explicabo consequuntur qui.
.A task was created with the following title: Fugit commodi nihil asperiores.
A task was created with the following title: test-task
A task was created with the following title: test-task
A task was created with the following title: test-task
A task was created with the following title: test-task
A task was created with the following title: test-task
.A task was created with the following title: Aut ut atque in.
A task was created with the following title: another test task
.A task was created with the following title: Excepturi omnis laborum molestiae.
A task was created with the following title: buy milk and apple
A task was created with the following title: buy milk
.A task was created with the following title: Reiciendis consequatur recusandae qui.
A task was created with the following title: test-task
A task was created with the following title: test-task
F

Failure:
TaskTest#test_incremental_slug_generation_for_tasks_with_duplicate_hyphenated_titles [/Users/mre/bb/granite/test/models/task_test.rb:59]:
Expected: "test-task-23"
  Actual: "test-task-2"


rails test test/models/task_test.rb:54

A task was created with the following title: Aut iste molestias veniam.
.A task was created with the following title: Aut at omnis dolores.
A task was created with the following title: This is a test task
.A task was created with the following title: Ab quia rerum est.
.A task was created with the following title: Debitis error tempora magnam.
A task was created with the following title: fishing
A task was created with the following title: fish
F

Failure:
TaskTest#test_slug_generation_for_tasks_having_titles_one_being_prefix_of_the_other [/Users/mre/bb/granite/test/models/task_test.rb:67]:
Expected: "fishh"
  Actual: "fish"


rails test test/models/task_test.rb:62



Finished in 0.590504s, 22.0151 runs/s, 47.4171 assertions/s.
13 runs, 28 assertions, 4 failures, 0 errors, 0 skips
```

Here on the final line of the output we get an summary of the test we ran, we
can see 28 assertions where made in 13 runs (which means 13 functions were
executed) and in which 4 assertions failed.

It's easier to fix the failures when we can take a look at it one by one. Rails
provides us an easy a way to do this. Lets look at the output we got from
running the test again.

```bash {9}
# previous test case outputs
...
Failure:
TaskTest#test_slug_generation_for_tasks_having_titles_one_being_prefix_of_the_other [/Users/mre/bb/granite/test/models/task_test.rb:67]:
Expected: "fishh"
  Actual: "fish"


rails test test/models/task_test.rb:62



Finished in 0.590504s, 22.0151 runs/s, 47.4171 assertions/s.
13 runs, 28 assertions, 4 failures, 0 errors, 0 skips
```

## Running an single test

In the above code snippet shown in last section, the highlighted line shows a
line number after the file name. If we take a look at `task_test.rb` we can see
that line 62 is the start of the test function which failed:

<image alt="Test Function">debugging-test-1.png</image>

By running `rails test test/models/task_test.rb:62` we can see that `rails` runs
only the method corresponding to the line number mentioned:

```bash
$ bundler exec rails test test/models/task_test.rb:62
Running via Spring preloader in process 93088
Run options: --seed 7633

# Running:

A task was created with the following title: Reiciendis molestias nulla commodi.
A task was created with the following title: fishing
A task was created with the following title: fish
F

Failure:
TaskTest#test_slug_generation_for_tasks_having_titles_one_being_prefix_of_the_other [/Users/mre/bb/granite/test/models/task_test.rb:67]:
Expected: "fishh"
  Actual: "fish"

rails test test/models/task_test.rb:62

Finished in 0.234019s, 4.2732 runs/s, 8.5463 assertions/s.
1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```

Here from the final line of the output we understand that only "1" test ran
which had "2" assertions and "1" failed. If we take a look at the function
definition we can see the second assertion failed here.

Now we know where exactly the issue is and what the expected and actual values
are. Sometimes it might not be obvious from the failure details and we might
need to do a deeper analysis.

## Debugging using puts

From the test we know that we are calling `Task.create!`. Lets navigate to where
the actual method is written. There we can add `puts` statements to figure out
what might have gone wrong. This is more or less a hacky way of getting the job
done.

Here we need to add `puts` statements to `test/models/task_test.rb`:

```ruby {18}
  before_create :set_slug

  private

    def set_slug
      title_slug = title.parameterize
      regex_pattern = "slug #{Constants::DB_REGEX_OPERATOR} ?"
      latest_task_slug = Task.where(
        regex_pattern,
        "^#{title_slug}$|^#{title_slug}-[0-9]+$").order(slug: :desc).first&.slug
      slug_count = 0
      if latest_task_slug.present?
        slug_count = latest_task_slug.split("-").last.to_i
        only_one_slug_exists = slug_count == 0
        slug_count = 1 if only_one_slug_exists
      end
      slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
      puts "DEBUGGING:" + slug_candidate
      self.slug = slug_candidate
    end
```

By adding the above statement, the value of the `puts` statement is now printed
when we run the test again:

```bash {8,10,12}

$ bundler exec rails test test/models/task_test.rb:62
Running via Spring preloader in process 96740
Run options: --seed 34992

# Running:

DEBUGGING:cupiditate-rerum-suscipit-voluptatem
A task was created with the following title: Cupiditate rerum suscipit voluptatem.
DEBUGGING:fishing
A task was created with the following title: fishing
DEBUGGING:fish
A task was created with the following title: fish
F

Failure:
TaskTest#test_slug_generation_for_tasks_having_titles_one_being_prefix_of_the_other [/Users/mre/bb/granite/test/models/task_test.rb:67]:
Expected: "fishh"
  Actual: "fish"


rails test test/models/task_test.rb:62



Finished in 0.248429s, 4.0253 runs/s, 8.0506 assertions/s.
1 runs, 2 assertions, 1 failures, 0 errors, 0 skips
```

From the logs it is evident that it is a spelling mistake that caused the test
suite to fail. But this `puts` method becomes a hassle if we want to try change
or view multiple variable values. And more importantly we should never commit
code which has `puts` statements.

## Debugging using byebug

To achieve the same result as the above method we can also use the `byebug` gem
to get a more powerful and interactive way to debug.

Example:

```ruby {14}
    def set_slug
      title_slug = title.parameterize
      regex_pattern = "slug #{Constants::DB_REGEX_OPERATOR} ?"
      latest_task_slug = Task.where(
        regex_pattern,
        "^#{title_slug}$|^#{title_slug}-[0-9]+$").order(slug: :desc).first&.slug
      slug_count = 0
      if latest_task_slug.present?
        slug_count = latest_task_slug.split("-").last.to_i
        only_one_slug_exists = slug_count == 0
        slug_count = 1 if only_one_slug_exists
      end
      slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
      byebug
      self.slug = slug_candidate
    end

```

The debugger will run `byebug` which is a gem which has been already installed.
This gem requires no additional configuration. Now when we run the test:

```bash
$ bundler exec rails test test/models/task_test.rb:62
Running via Spring preloader in process 2977
Run options: --seed 32115

# Running:

[31, 40] in /Users/mre/bb/granite/app/models/task.rb
   31:         only_one_slug_exists = slug_count == 0
   32:         slug_count = 1 if only_one_slug_exists
   33:       end
   34:       slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
   35:       byebug
=> 36:       self.slug = slug_candidate
   37:     end
   38:
   39:     def slug_not_changed
   40:       if slug_changed? && self.persisted?
(byebug)
```

We can see that byebug has set a breakpoint right after the line where we
specified `byebug`.

Let's say we want to print the current value of the variable `slug_candidate`.
For such cases we can just enter it to the terminal and we will get the output
in the current scope's context:

```bash
(byebug) slug_candidate
"fish"
(byebug)
```

We can also change the value of variables by:

```bash
(byebug) slug_candidate= "fishh"
"fishh"
(byebug)
```

`byebug` gem has a lot of options which we can see by using the `help` command.
Some useful ones to know are:

1. `continue` - it runs until the next breakpoint is reached or the program is
   terminated.
2. `var local` - it shows all the local variable in current scope.
3. `break LINE_NO` - it sets additional breakpoint in `LINE_NO`.
