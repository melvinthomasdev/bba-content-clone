In the previous chapter, we had mentioned adding some tests. But currently, we
don't have any mechanism to ensure that people are actually writing the
necessary tests.

In this chapter we will see how to add a `test coverage` report for all tests in
the project.

## What is test coverage?

Test coverage is a technique which determines whether our tests are actually
covering the application code and how much code is executed when we run those
tests.

Let's take an example where our application has 10 features, and when we run our
tests, they cover only 7 of those features. In this case, we could say that our
tests cover 70% of the application.

## Why do we need to have test coverage?

Test coverage helps monitor the quality of testing and assists developers in
create tests to cover areas that are missing.

## Test coverage using SimpleCov

We will be using `simplecov` gem for our test coverage.

[SimpleCov](https://github.com/simplecov-ruby/simplecov) is a code coverage
analysis tool for Ruby. It uses
[Ruby's built-in Coverage](https://ruby-doc.org/stdlib-3.1.2/libdoc/coverage/rdoc/Coverage.html)
library to gather code coverage data.

Add `simplecov` to your Gemfile and run `bundle install`:

```bash
gem 'simplecov', require: false, group: :test
```

Load and launch `simplecov` at the very top of your `test/test_helper.rb`:

```ruby
def enable_test_coverage
  require 'simplecov'
  SimpleCov.start do
    add_filter '/test/'
    add_group 'Models', 'app/models'
    add_group 'Mailers', 'app/mailers'
    add_group 'Controllers', 'app/controllers'
    add_group 'Uploaders', 'app/uploaders'
    add_group 'Helpers', 'app/helpers'
    add_group 'Workers', 'app/workers'
    add_group 'Services', 'app/services'
  end
end

enable_test_coverage if ENV['COVERAGE']

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
# Previous content of test helper as is
```

We are enabling the test coverage only on demand if the `ENV` variable named
`COVERAGE` exists in our environment. We don't need to execute this
`enable_test_coverage` method while running the tests every time.

Remember the `SimpleCov.start` must be issued before any of your application
code is required! If `simplecov` starts after your application code is already
loaded (via `require`), then it won't be able to track your files and their
coverage.

`add_filter` is a filter method for test coverage given by `simplecov`. This
filter method can be used to remove selected files from our coverage data.

We have added such a filter for our test files because we don't need to cover
test files. We have to cover code inside the `app` folder for Models, Services,
Controllers and Helpers etc.

We can separate our source files into groups with the help of `add_group`.

We have separated coverage listings for Models, Mailers, Controllers, Helpers,
Workers and Services, etc.

Before running `simplecov` via tests, we need to make the change in the below
mentioned line from `test/test_helper.rb`:

```ruby
# Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors) unless ENV['COVERAGE']
```

The reason why we added a conditional to the above line is because `simplecov`
gem has issues while running tests in parallel with workers.

So by adding a conditional we are not executing
`parallelize(workers: :number_of_processors)` method, if we are running test
coverage.

Let's run our full test suite to see the percentage coverage in our application:

```bash
COVERAGE=true bundle exec rails test -v
```

By any chance, if your terminal shows a segmentation issue, then exit out of the
process using `Ctrl+C` or `Cmd+C`. This segmentation error is one of the issues
with `simplecov`, when it runs under some specific Ruby versions. It doesn't
have any negative impacts, because we'd be getting the generated report either
way.

## View the coverage reports

After running tests, open `coverage/index.html` in the browser of your choice.
In a Mac Terminal, run the following command from the application's root
directory:

```bash
open coverage/index.html
```

We will get a test coverage report, which might look like the following image:

<image>test-coverage-report-1.png</image>

In cases where we don't have enough test cases, this is how the report would
look like:

<image>test-coverage-report-2.png</image>

Run the following command from the terminal to make sure coverage reports are
not tracked by Git:

```bash
echo "coverage" >> .gitignore
```

If you want to share the whole test coverage report then share the `coverage`
folder containing `index.html` file and `assets` folder. Because for running
`index.html` properly we need an `assets` folder.

You can also share screenshot of the HTML page from the browser for coverage
report.

## Do not write tests to satisfy test coverage alone

Developers often feel tempted to write low-quality test cases merely to achieve
high test coverage. This type of behavior is highly discouraged in BigBinary.

Test coverage should be seen as a tool to guide developers while writing test
cases and not vice versa. The main goal of writing test cases is to ensure the
quality and reliability of the system or code under scrutiny. In other words,
the focus should be on writing high-quality test cases that effectively test the
system and identify potential issues, rather than just trying to achieve a
certain level of test coverage.

There might be instances where a functionality that has already been thoroughly
tested at, say model level, is being tested again at the controller level to
achieve a high test coverage. Take heed before you write such redundant test
cases which are totally unacceptable.

Writing low-quality test cases, or test cases that are not relevant or effective
can decrease the overall quality of the testing process. In the worst case, this
can result in serious bugs or vulnerabilities that go unnoticed until it is too
late.

Now, let's commit the changes:

```bash
git add -A
git commit -m "Added test coverage reporting"
```
