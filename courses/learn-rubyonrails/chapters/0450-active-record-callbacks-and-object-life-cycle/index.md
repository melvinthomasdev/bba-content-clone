When we create or update a record in the database, we might want to perform some
operations before or after saving to the database. For example: when a blog is
created, then we might want to generate a permanent URL for the blog. Similarly,
when someone changes their password, then we might want to send an email to the
person that the password has been changed.

We can achieve such business cases by registering some methods that should be
executed by Active Record whenever a model changes.

## List of callbacks

Active Record Callbacks are hooks to which we can register methods in our
models. These hooks are executed in various stages of an Active Record object
lifecycle. The following callbacks are run when an object is created. These
callbacks are executed in the order in which they are listed below.

```msg
before_validation
after_validation
before_save
around_save
before_create
around_create
after_create
after_save
after_commit/after_rollback
```

The `before_create`, `around_create` and `after_create` are replaced by
`before_update`, `around_update` and `after_update` respectively when records
are updated.

Active Record provides only four callbacks when records are `destroyed`. They
are invoked in the following order.

```msg
before_destroy
around_destroy
after_destroy
after_commit/after_rollback
```

Active Record callbacks are useful as we can place repetitive behavior in a
single place, in turn abiding to the DRY principle.

## Registering callbacks

### Using callbacks for validations

In the previous chapter, we had introduced a validation to ensure that task has
a title. Let's try and modify the value of the `title` attribute through
callbacks and observe the behavior.

Open `task.rb` file and add following lines of code:

```ruby {4,12-14}
class Task < ApplicationRecord
  # previous code

  before_validation :set_title
  validates :title,
    presence: true,
    length: { maximum: MAX_TITLE_LENGTH },
    format: { with: VALID_TITLE_REGEX }

  private

    def set_title
      self.title = "Pay electricity bill"
    end
end
```

Now open Rails console and execute the following code.

```msg
$ bundle exec rails console
>> task = Task.new
>> task.valid?
#=> true
```

As seen above, `task.valid?` returned `true`, which means the title was set
before the validations were run. Let's verify if the value was actually set on
the record.

```msg
>> task.title
#=> "Pay electricity bill"
```

Yay! The task record has `title` set by the callback. Now comment out the line
where callback is registered, and register the same method in an
`after_validation` callback:

```ruby
# before_validation :set_title
after_validation :set_title
```

Open Rails console and check the following:

```msg
>> task = Task.new
>> task.title
#=> nil

>> task.valid?
#=> false

>> task.title
#=> "Pay electricity bill"
```

Interesting isn't it! The validation has failed and returned `false`, but we
still have a title assigned. That's because the attribute was assigned after the
validations were run.

As you would expect, `task.save!` should fail here:

```msg
task.save!
#=> ActiveRecord::RecordInvalid: Validation failed: Title enter a value for Title
```

### Using callbacks for saving data

Let's modify the `Task` model to enable `before_validation` again:

```ruby
before_validation :set_title

# Comment out after_validation callback
# after_validation :set_title
```

Let's add a `before_save` callback to change the title. Let's also ensure that
we also have our `before_validation` callback that was enabled above as well:

```ruby {4}
class Task < ApplicationRecord
  # ... existing validations and callbacks

  before_save :change_title

  def change_title
    self.title = "Pay electricity & TV bill"
  end

end
```

Time to try things using `rails console`:

```msg
>> task = Task.new
>> task.valid?
#=> true

>> task.title
#=> "Pay electricity bill"

>> task.save!
>> task.title
#=> "Pay electricity & TV bill"
```

Let's look at the value stored in the database:

```msg
>> task = Task.order(created_at: :desc).first
>> task.title
#=> "Pay electricity & TV bill"
```

As we can see, the value stored in the database is what we have set from
`before_save` callback. We can observe similar results if we use
`before_create`.

Callbacks like `after_create`, `after_save` and `after_commit` will have a
different behaviour in above scenarios. Comment out existing `before_save`
callback and enable `after_save` for same methods:

```ruby
# before_save :change_title
after_save :change_title
```

Observe results in Rails console:

```msg
>> task = Task.create!
>> task.title
#=> "Pay electricity & TV bill"

>> task = Task.last
>> task.title
#=> "Pay electricity"
```

The task object returned from `Task.create!` has title updated from the
`after_save` callback. But the value in the database is the one that was set
from our `before_validation` callback.

### after_save vs after_commit

There is a slight but important difference between `after_save` and
`after_commit` callbacks. `after_commit` is invoked when a database transaction
reaches `committed` state. In case a transaction fails, for instance, while
creating a record, `after_commit` is not invoked by Active Record, but
`after_save` will have run by then. If there is a requirement that necessitates
data to be persisted in the database before executing a piece of code, we should
use `after_commit` instead of `after_save`.

### Triggering multiple callbacks of the same type

We can register multiple methods for a callback. They will be chained up and
executed in the same order in which they are registered. Let's have two
`before_validation` callbacks in our `Task` model:

```ruby
class Task < ApplicationRecord
  # previous code

  before_validation :set_title
  before_validation :print_set_title

  private

    def set_title
      self.title = 'Pay electricity bill'
    end

    def print_set_title
      puts self.title
    end
end

```

Reload Rails console and observe the following:

```msg
>> task = Task.new
>> task.title
#=> nil

>> task.valid?
#=> "Pay electricity bill"
```

When `valid?` method is called, `set_title` is executed first and
`Pay electricity bill` is assigned to the `title` attribute. Then
`print_assigned_title` is executed and the assigned value is printed.

## Conditionally triggering callbacks

Let's modify our `before_validation` callback as follows:

```ruby
before_validation :set_title, if: :title_not_present

def title_not_present
  self.title.blank?
end

def set_title
  self.title = 'Pay electricity bill'
end
```

Here we make sure that the `title` is assigned a value only when
`title_not_present` method returns `true`. Let's verify this behavior in Rails
console:

```msg
>> task = Task.new(title: "This is a sample task")
>> task.valid?
#=> true

>> task.title
#=> "This is a sample task"
```

As we can see, title is not set from the `before_validation` callback.
Similarly, we can use `unless:` to conditionally trigger a callback when a
negative condition is provided:

```ruby
before_validation :assign_title, unless: :title_present

def title_present
  self.title.present?
end
```

## Understanding how the callbacks are triggered

The following methods, when called on an Active Record object, trigger the
above-described callbacks:

```msg
create
create!
destroy
destroy!
destroy_all
save
save!
save(validate: false)
toggle!
touch
update_attribute
update
update!
valid?
```

`save(validate: false)` runs all callbacks as that of `save`, except validate
callbacks.

Callbacks are NOT triggered when the following methods are called:

```msg
decrement
decrement_counter
delete
delete_all
increment
increment_counter
toggle
update_column
update_columns
update_all
update_counters
```

Except the title presence validation we don't need anything else to be committed
in this chapter:

```bash
git clean -fd
```
