**Class methods** are used for
implementing functionality
that is associated with a
particular class.

They are not tightly bound
to individual objects of
that class, also called **instances**.

When writing code, we should
use class methods exclusively
for defining a class-specific
functionality.

Let us take a look at an example:
<codeblock language="ruby" type="lesson">
<code>
class Car
  def self.wheels
    puts "The car has 4 wheels."
  end
end

Car.wheels
</code>
</codeblock>

In this example, we have
a class method called `wheels`
that displays the message
`The car has 4 wheels.`

Since cars usually have 4 wheels,
this method applies to all vehicles
in the `Car` class.

It is defined as a class method
and can be directly called on
the `Car` class itself.

Syntax to define a **Class method**:
```ruby
class ClassName
  def self.method_name
  # do something
  end
end
```

It is necessary to add the
word `self` when defining
a **Class Method**.

Without the `self` word,
this becomes an instance
method which can only
be called on an instance
of the class.
