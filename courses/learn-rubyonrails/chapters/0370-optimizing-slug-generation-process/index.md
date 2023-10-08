## Using LIKE operator in SQL for efficient slug generation

In the current state of the `set_slug` method, we are running an iteration and
generating a non-duplicate slug for the current task at hand.

This approach is highly inefficient. The reason is that, for every iteration, we
are calculating a possible slug candidate by appending the iterator to
parameterized title of current task.

In the background our application is making a call to the database to check the
existence of a task whose slug matches the possible slug candidate in that
particular iteration.

In a real world scenario, there might be hundreds or even thousands of such
iterations before we can generate a valid slug. This will increase the load on
our database and might hamper with the performance.

Let's see how we can increase the efficiency of slug generation process. Our
main concern is excessive database queries. Thus if we can figure out a way to
minimize database calls then our problem will be solved.

If we were using `PostgreSQL`, then the solution was straightforward, which is
to use the `REGEXP` operator. But `SQLite` doesn't have any in-built `REGEXP`
operator. Thus let's try to devise a solution with what we have first.

One solution here is to use the `LIKE` operator from `SQLite` to query all tasks
with a matching slug. Once we have a list of all such tasks, we can append an
integer value greater than the count of such tasks to parameterized task title.
This will produce a unique slug.

For example, if a list of matching slugs in our application looks like,
`example-slug, example-slug-1, example-slug-2`, then the slug count is 3. Thus
when creating a new slug, appending `4`, that is `slug count + 1`, to
`example-slug` will result in a unique slug, which is `example-slug-4`.

`LIKE` operator is used inside a `WHERE` clause to search for a specific pattern
and return a collection of records matching the pattern.

Syntax of a query using `LIKE` operator is:

```ruby
table_name.where("column_name LIKE ?", pattern)
```

`table_name`, `column_name` and `pattern` are placeholders and they should be
replaced with appropriate values.

Before moving on, it is important to understand how to declare patterns inside a
query that uses `LIKE` operator for pattern matching. The SQL `LIKE` condition
allows us to use the following wildcards to perform pattern matching in a query.

- The percent sign `%`: It represents one or more than one character preceding
  or succeeding the pattern string, depending upon where it is placed.

  For example, if the pattern is `buy%`, then SQL will match with "buy" along
  with all words which are prefixed with "buy" such as "buying". If percent sign
  precedes "buy", then SQL will look for all words which end with "buy".

  `LIKE` pattern matching always covers the entire string. Therefore, if it's
  desired to match a sequence anywhere within a string, the pattern must start
  and end with a percent sign.

- The underscore sign `_`: Each underscore sign represents a single character
  preceding or succeeding the pattern text, depending upon where it is placed.

  For example, if the pattern is `buy__`, then along with the pattern string SQL
  will also match with all five letter words prefixed with "buy" because of the
  two underscore signs succeeding "buy".

If pattern does not contain percent signs or underscores, then the pattern only
represents the string itself.

Let us apply the optimized logic now. Fully replace the `set_slug` method with
the following lines of code:

```ruby
def set_slug
  title_slug = title.parameterize
  count = Task.where("slug LIKE ?", "#{title_slug}%").size
  slug_candidate = count.positive? ? "#{title_slug}-#{count + 1}" : title_slug
  self.slug = slug_candidate
end
```

We are treating the parameterized title as a potential slug candidate for the
task at hand and storing this value in `title_slug` variable.

We have appended a percent sign to `title_slug` to use it as the pattern for
`LIKE` query. Doing so will match the pattern with all slugs which are either
equal to the `title_slug` variable's value or prefixed with the value of
`title_slug` variable.

With the above approach, we are taking the count of all such tasks in the
database whose slug matches the value of the `title_slug` variable.

If this `count` is greater than `0`, as in a task exists in database whose slug
matches with `title_slug`, then we will append the integer value of `count + 1`
to the parameterized title.

If the `count` is less than `0`, then it means that no such tasks exists whose
slug matches with `title_slug` and we can use the parameterized title as it is
for slug.

## Different edge cases while using LIKE query

Let us understand this with the help of a hypothetical example. Suppose we have
to add a new task record whose title is "Buying", then its potential slug
candidate will be "buying", and database already contains another task record
whose slug also happens to be "buying".

In such a case, we will query the count for tasks with slugs similar to the
potential slug candidate which will be equal to `1` here, since the slug
`buying` already exists in the database. Hence appending `2` to the potential
slug candidate will yield a unique slug.

With the above approach we can generate a unique slug while restricting the
number of database calls to one.

There are however, a couple of edge cases for which the above logic will fail.
To understand those edge cases let us consider a hypothetical example where
three different task records exist in the database whose slugs are "buying",
"buying-2" and "buying-3" respectively.

### Edge case 1

Suppose one of the task records, say the one whose slug is "buying-2" is deleted
from the database. Now, when we create a new task record whose title is
"buying", the count in `set_slug` method will be equal to `2`.

Hence the application will append `3`, that is `count + 1`, to the `title_slug`
and attempt to save it.

But the database transaction will not go through because a task with slug
"buying-3" is already present in the database and the uniqueness validation will
fail. Hence for this edge case our `set_slug` method will fail to generate an
unique slug.

### Edge case 2

If we create a new task with title "buy", the slug generated for new task by
`set_slug` method would be "buy-4". Ideally the slug should have been "buy".

Upon taking a good look at the pattern we are using for pattern matching it will
become evident that even though no slugs that match with either `buy` or `buy-`
pattern exist in database at the time of record creation, the query for
calculating the count of tasks will still return `3`.

This is because SQL will also match with the "buying-2" and "buying-3" slugs in
the database due to the use of percent wildcard sign in pattern.

Recall that using a succeeding `%` wildcard sign in the pattern string will
match the string with the task slug whose value is equal to the pattern string
along with all other slugs which contain the pattern string as a prefix.

Since 3 such tasks are found in this case, `4` will be appended to the
parameterized title of task at hand and the resulting slug will be `buy-4`.

## Handling discussed edge cases

To fix the edge cases, fully replace the `set_slug` method with following lines
of code:

```ruby
def set_slug
  title_slug = title.parameterize
  latest_task_slug = Task.where(
    "slug LIKE ? or slug LIKE ?",
    "#{title_slug}",
    "#{title_slug}-%"
  ).order("LENGTH(slug) DESC", slug: :desc).first&.slug
  slug_count = 0
  if latest_task_slug.present?
    slug_count = latest_task_slug.split("-").last.to_i
    only_one_slug_exists = slug_count == 0
    slug_count = 1 if only_one_slug_exists
  end
  slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
  self.slug = slug_candidate
end
```

Let us break down the updated `set_slug` method with the help of the same
example we had just discussed and understand how it is handling the edge cases.

Consider a hypothetical example of task records in the database whose slugs are
`buying`, `buying-2` and `buying-3`.

We'd suggest reading the upcoming edge case handling section with the above code
split open to the side. This will give you more clarity on the variable names,
etc, that are being referred to.

### Handling edge case 1

**Note that, in all cases where we mention `title_slug`, we are referring to the
value of the variable `title_slug` from above mentioned code block and not any
random string `title_slug`.**

Suppose the task with slug `buying-2` has been deleted from the database. Now,
during the slug generation for a new task with title `Buying`, `set_slug` method
will assign a potential slug candidate which will be equal to `buying` and store
it inside the `title_slug` variable.

In the next step, all tasks whose slug matches either `buying` or `buying-1`,
`buying-2` etc are matched. That is why we have two `LIKE` queries, one for
matching `buying` and one for matching the hyphenated version of the slug.

Those matching tasks are then ordered in descending order of the length of their
respective slugs.

We are using the `order` method to sort the records in descending order of the
length of their slugs. `order` method accepts the name of attribute and the
order in which the records are to be sorted. For example, in the `set_slug`
method, `order` method contains two arguments, `LENGTH(slug) DESC` and
`slug: :desc`.

Let us understand why we need two arguments. Suppose the task slugs stored in
database are `buying-1`, `buying-2` and `buying-10`. If we sort by `slug: :desc`
then the result would be `buying-2`, `buying-10` and `buying-1` which is
incorrect and if we sort by the length of slugs alone then `buying-2` and
`buying-1` will have the same rank. Hence we have combined the sorting
parameters.

After combining the parameters and sorting by `"LENGTH(slug) DESC", slug: :desc`
the result would be `buying-10`, `buying-2` and `buying-1`. So the suffix
number, that is the integer after the hyphen of the slug is also taken into
account while ordering.

The main reason for ordering is because we are only interested in the latest
task in the database which matches the pattern.

Thus after ordering in descending order we take the first task from the
collection of matched tasks and its corresponding slug and store it in the
`latest_task_slug` variable.

We have also declared a variable called `slug_count` and initialized it to `0`.
`slug_count` variable will keep track of the number of tasks whose slugs matches
with `title_slug` at the time of slug generation.

If `latest_task_slug` doesn't exist, then it will mean that no task with a slug
similar to `title_slug` is present and the value for `slug_count` will remain
`0`. In such a case we can use the parameterized title itself for slug.

There can be two different cases if `latest_task_slug` is present.

1. No integer value is appended to `latest_task_slug`, then `slug_count` will be
   `0` itself while we try to split the slug using the hyphen and try to get the
   integer suffix. This also implies that only one other task exists in the
   database whose slug matches with `title_slug`. Hence we will update the value
   of `slug_count` to `1`.

2. The `latest_task_slug` variable contains a value that has a valid integer as
   a suffix after the hyphen. This implies that at the time of slug generation,
   the count of tasks whose slugs match with `task_title` is either equal to or
   less than this integer value. Thus to play it safe, we will update
   `slug_count` to this value.

If the value of `slug_count` is positive, then incrementing it by `1` and
appending it to `title_slug` will guarantee a unique slug else we can use
`title_slug` as it is for slug.

In this case the value of `latest_task_slug` and `slug_count` will be `buying-3`
and `3` respectively, hence the slug generated will be "buying-4".

### Handling edge case 2

On creating a new task with title `Buy`, `set_slug` method will assign a
potential slug candidate which will be equal to `buy` and store it inside the
`title_slug` variable.

Note that we have updated the pattern matching query and we are using two
`LIKE ` operators separated by an `OR` operator.

The first `LIKE` operator will match slugs with `slug_title` pattern whereas the
second `LIKE` operator will match slugs with `slug_title-%` pattern.

In this case, the `LIKE` query will match the slug values with either `buy`
itself or with the `buy-` pattern. Hence any other slugs which are suffixed or
prefixed with `buy` will not be included in the pattern matching result.

This approach towards slug generation is more efficient because it will only
lead to a single database query for each slug.

## Some missed out edge cases

Although we have solidified our slug generation process a lot, there still
remains some edge cases that we missed out or let's say left out for the last.

Consider the following scenario:

- A task with slug "buy-milk" already exists in database.
- A new task with title "buy" is being created.
- Upon reaching the slug generation process for "buy", it will check if any slug
  matches "buy" or "buy-".
- The "buy-" pattern will match with "buy-milk" of the unrelated task's slug.
- Thus new slug generated for the task with title "buy" will be "buy-2", even
  when no other slug having value "buy" exists in database.

Here, we could make a call and allow this edge case to go through. But we are
not going to give up yet. Let's try to handle this edge case too.

For handling this edge case, one logic looks like this:

- Check for existence of slugs that match "buy". This matches whole word or
  none. Thus the regex pattern would look like "buy$", where "$" denotes the end
  of string.
- After that check for the regex pattern "buy-[0-9]+$". This regex pattern will
  check for all slugs that start with "buy-" and ends with a number.

Now let's take the edge case we discussed before:

- A task with slug "buy-milk" already exists in database.
- A new task with title "buy" is being created.
- Upon reaching the slug generation process for "buy", it will check if any slug
  matches "buy$" or "buy-[0-9]+$".
- Neither matches. Already existing slug "buy-milk" won't match with
  "buy-[0-9]+$", given that it doesn't end with a number.
- Slug value of "buy" will be generated for this new task with title "buy".

Consider another scenario as follows:

- A task with slug "go-for-grocery-shopping-and-buy-apples" already exists in
  database.
- A new task with title "buy apples" is being created.
- Upon reaching the slug generation process for "buy apples", it will check if
  any slug matches "buy-apples$" or "buy-apples-[0-9]+$".
- The "buy-apples" pattern will match with
  "go-for-grocery-shopping-and-buy-apples" slug as they both are ending with the
  same substring that is "buy-apples".
- Thus new slug generated for the task with title "buy apples" will be
  "buy-apples-2", even when no other slug having value "buy-apples" exists in
  database.

Let's try to handle this edge case too.

For handling this edge case, one logic looks like this:

- Check for existence of slugs that match "buy-apples". This matches whole word
  or none. Thus the regex pattern would look like "^buy-apples$", where "^"
  denotes the start of string.
- After that check for the regex pattern "^buy-apples-[0-9]+$". This regex
  pattern will check for all slugs that start with "buy-apples-" and ends with a
  number.

Now let's take the edge case we discussed before:

- A task with slug "go-for-grocery-shopping-and-buy-apples" already exists in
  database.
- A new task with title "buy apples" is being created.
- Upon reaching the slug generation process for "buy apples", it will check if
  any slug matches "^buy-apples$" or "^buy-apples-[0-9]+$".
- Neither of them found any matches. Already existing slug
  "go-for-grocery-shopping-and-buy-apples" won't match with "^buy-apples$",
  given that it doesn't start and end with "buy-apples".
- Slug value of "buy-apples" will be generated for this new task with title "buy
  apples".

But still there exists one more minor edge case. We are calling "allow" on that
one for now. If you're curious, then go ahead and find out that particular edge
case on your own.

## Adding REGEX function to SQLite

The implementation of this logic can be a bit tricky because SQLite doesn't have
any in-built functions to handle the `REGEX` operator by default.

But as per the official SQLite documentation it supports adding user defined
functions to act as the `REGEX` matcher.

Another issue is that these custom functions are not persisted in the database.
They are only stored in local memory and will only remain as long as the
database is up and running.

Fortunately, Rails provides an elegant way to run code on application start-up
through initializer files, which are loaded after frameworks and gems.

Initializer files are stored in the `./config/initializers` directory, and it
allows running Ruby scripts.

SQLite allows creating new SQL functions in the database level using the
`sqlite3_create_function()` family of interfaces.

For doing this using Ruby, let's see check the custom DSL defined in the
`sqlite3` gem, which looks like this:

```ruby
def create_function name, arity, text_rep=Constants::TextRep::UTF8, &block
  define_function_with_flags(name, text_rep) do |*args|
    fp = FunctionProxy.new
    block.call(fp, *args)
    fp.result
  end
  self
end
```

The important arguments here are `name`, which will set the name of the custom
function and `arity`, which denotes number of arguments the newly defined
function will require.

The neat part here is that the `FunctionProxy` object `fp` allows us to set the
result of custom function directly.

Let's try to apply this knowledge and add the custom function.

Create a new initializer file:

```ruby
touch config/initializers/sqlite_custom_regexp_function.rb
```

In Rails, the `AbstractAdapter` class represents a connection to the database
and provides an abstract interface for database-specific functionality such as
establishing a connection, escaping values etc.

The `initialize` method within this `AbstractAdapter` class establishes the
connection with database and runs other side effects.

Thus, what we can do is, make the `initialize` method run our custom logic. In
order to do that we can use the `class_eval` method to define the `initialize`
instance method of the `AbstractAdapter` class.

But when doing that we'd have to execute all the code within AbstractAdapter's
`initialize` method first before executing our custom logic. This can be done by
aliasing the original initialize method.

Now, let's actually implement our case-insensitive `REGEXP` pattern matcher. Add
the following lines of code into
`config/initializers/sqlite_custom_regexp_function.rb`:

```ruby
ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  alias_method :orig_initialize, :initialize

  def initialize(connection, logger = nil, pool = nil)
    orig_initialize(connection, logger, pool)

    if connection.is_a? SQLite3::Database
      connection.create_function("regexp", 2) do |fn, pattern, expr|
        regex_matcher = Regexp.new(pattern.to_s, Regexp::IGNORECASE)
        fn.result = expr.to_s.match(regex_matcher) ? 1 : 0
      end
    end
  end
end
```

That's it! Now every time Rails boots up, this initializer will also be run,
such that the `REGEXP` matcher function will be available in the local memory
and SQLite will be able to use it.

## Updating the set_slug method

Let's modify the `set_slug` method to use the `REGEXP` operator.

Fully replace the `set_slug` method in the task model with the following lines
of code:

```ruby
def set_slug
  title_slug = title.parameterize
  latest_task_slug = Task.where(
    "slug REGEXP ?",
    "^#{title_slug}$|^#{title_slug}-[0-9]+$",
  ).order("LENGTH(slug) DESC", slug: :desc).first&.slug
  slug_count = 0
  if latest_task_slug.present?
    slug_count = latest_task_slug.split("-").last.to_i
    only_one_slug_exists = slug_count == 0
    slug_count = 1 if only_one_slug_exists
  end
  slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
  self.slug = slug_candidate
end
```

This handles the final edge case we had discussed.

## Ensuring initializer works in production environment

There is one minor catch here. Our production environment is Heroku. But Heroku
doesn't support SQLite database. That is why in the upcoming chapters we add
PostgreSQL for production environment.

We have to modify our SQLite initializer file such that it will only run if the
current database adapter is SQLite3. PostgreSQL comes with an in-built REGEX
function. Thus it wouldn't make sense running this initializer file in
production since there we use will be using PostgreSQL.

First fully replace `config/initializers/sqlite_custom_regexp_function.rb` with
the following content:

```ruby
ActiveRecord::ConnectionAdapters::AbstractAdapter.class_eval do
  alias_method :orig_initialize, :initialize

  def initialize(connection, logger = nil, pool = nil)
    orig_initialize(connection, logger, pool)

    is_sqlite_db = ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == "sqlite3"

    if is_sqlite_db
      connection.create_function("regexp", 2) do |fn, pattern, expr|
        regex_matcher = Regexp.new(pattern.to_s, Regexp::IGNORECASE)
        fn.result = expr.to_s.match(regex_matcher) ? 1 : 0
      end
    end
  end
end
```

So previously we had used `SQLite3::Database` for checking whether database
connection is `SQLite3` or not. But the `SQLite3` class is part of the `sqlite3`
gem and it won't be available in production environment. That's why we replaced
that condition with native `ActiveRecord::Base` statement which is part of Rails
itself.

Now comes the important part. In our current `set_slug` method we have used the
`REGEX` operator. But in PostgreSQL, the
[POSIX Regex operator](https://www.postgresql.org/docs/current/functions-matching.html#FUNCTIONS-POSIX-REGEXP)
is `~`. We need a case insensitive regex and the operator for that is `~*`.

Since this regex operator, that is either `REGEXP` or `~*`, needs to be
accessible in most of the Rails files after booting, it can be defined as a
constant under a global context like `Constants` instead of defining it under a
specific Model or Class, like we have done in the previous chapters. We can do
so by defining it in our `config/initializers/constants.rb` file.

The reason for making this a constant is because we will only be setting the
operator to a string value and it will remain constant throughout.

Create `constants.rb` inside `config/initializers/` to store constant values:

```bash
touch config/initializers/constants.rb
```

Now add the following lines of code into `config/initializers/constants.rb`:

```ruby {2-3}
module Constants
  is_sqlite_db = ActiveRecord::Base.connection_db_config.configuration_hash[:adapter] == "sqlite3"
  DB_REGEX_OPERATOR = is_sqlite_db ? "REGEXP" : "~*"
end
```

Now fully replace the `set_slug` method in `Task` model with the following lines
of code:

```ruby
def set_slug
  title_slug = title.parameterize
  regex_pattern = "slug #{Constants::DB_REGEX_OPERATOR} ?"
  latest_task_slug = Task.where(
    regex_pattern,
    "^#{title_slug}$|^#{title_slug}-[0-9]+$"
  ).order("LENGTH(slug) DESC", slug: :desc).first&.slug
  slug_count = 0
  if latest_task_slug.present?
    slug_count = latest_task_slug.split("-").last.to_i
    only_one_slug_exists = slug_count == 0
    slug_count = 1 if only_one_slug_exists
  end
  slug_candidate = slug_count.positive? ? "#{title_slug}-#{slug_count + 1}" : title_slug
  self.slug = slug_candidate
end
```

## count vs length vs size

So if you had noticed, in one of the iterations of our `set_slug` method, we had
used `size` method like this
` count = Task.where("slug LIKE ?", "#{title_slug}%").size`. But why exactly did
we use it over `count` and `length`? It's pretty straightforward:

- `count`: This method determines the number of elements with an SQL COUNT
  query. If you do not have anything loaded in the memory, use count to make a
  query on database.
- `length`: This method simply loads the data of the association into the memory
  and then returns the number of elements loaded.
- `size`: This method works as a combination of both the above mentioned methods
  i.e. if the collection has already been loaded in the memory, it will return
  the length same as calling length. If it has not been loaded yet, it is like
  calling count.

So in most cases `size` does the job.

Let's commit the changes made in this chapter:

```bash
git add -A
git commit -m "Added optimized slug generation method"
```
