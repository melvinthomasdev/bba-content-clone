## Class methods

Class methods are methods that are invoked using a class name itself. These
methods provide the functionality to a class itself.

Let's take an example:

```ruby
class ClassName
  def self.class_method_name
    # some code
  end
end
```

The code above is the same as below:

```ruby
class ClassName
  class << self
    def class_method_name
      # some code
    end
  end
end
```

In the above example, we can access the class method directly without creating
any instance of that class.

The `self` keyword refers to the entire class itself, and not to an instance of
the class.

The `class << self` style is often preferred when our class methods are large
and when we need a clear separation between class and instance methods.

All the methods defined inside `class << self` scope is automatically a class
method.

Let's see an example:

```ruby
class SayHello
  def self.from_the_class
    "Hello, from a class method"
  end

  def from_an_instance
    "Hello, from an instance method"
  end
end
```

We can test it out from Rails console:

```bash
>> SayHello.from_the_class
=> "Hello, from a class method"

>> SayHello.from_an_instance
=> undefined method `from_an_instance' for SayHello:Class

>> hello = SayHello.new
>> hello.from_an_instance
=> "Hello, from an instance method"

>> hello.from_the_class
=> undefined method `from_the_class' for #<SayHello:0x0000557920dac930>
```

In the above example, we can see that, to use class methods we are not required
to create an instance of the class.

We can directly query the class methods using the class name itself.

Please don't confuse "class methods" as methods defined within a class.

Please test out the above mentioned examples to understand the differences
between class methods and instance methods.

## Active Record model scopes

Scopes are custom queries and works very similar to a class method.

Scopes are defined inside our Rails models using the `scope` method.

Every scope takes two arguments:

- A `name`, which we can use to call this scope in our code.
- A `lambda` function, which implements the query.

Let's see an example:

```ruby
class Fruit < ApplicationRecord
  scope :with_juice, -> { where("juice > 0") }
end
```

The value returned when calling a scope is the `ActiveRecord::Relation` object,
which in turn helps us to avoid errors when our `scope` returns nothing.

We can also chain and combine scopes.

Let's see an example:

```ruby
Fruit.with_juice.with_round_shape.first(3)
```

## Which one to prefer?

It's all about consistency. Scopes are usually used when the logic is very small
or, for simple `where/order` clauses.

Class methods are used when it involves a bit more complexity, and when we need
a finer grain of control over the execution of queries.

Let's take an example to see when to use `scope` method:

```ruby
def index
  @books = Book.where("LENGTH(title) > 20")
end
```

In the above code, there is an `index` controller action that wants to display
books with titles longer than 20 characters.

The code is fine but it's not reusable yet.

Thus writing queries like these in controllers makes the code not reusable.

Let’s move this query into a scope:

```ruby
class Book
  scope :with_long_title, -> { where("LENGTH(title) > 20") }
end
```

Now our controller action looks like this:

```ruby
def index
  @books = Book.with_long_title
end
```

We could do the same thing using class methods:

```ruby
class Book
  def self.with_long_title
    where("LENGTH(title) > 0")
  end
end
```

As we can see from the above example, we did the same thing using a class
methods.

Although this class method does the job, we usually give preference for `scope`
for such simple queries.

The following is an example of where class methods come in handy:

```ruby
class Book < ActiveRecord::Base
  def self.by_audience(audience)
    if audience == "children"
      where("age < 13")
    else
      where("age >= 13")
    end
  end
end
```

There is **nothing to commit** in this chapter.
