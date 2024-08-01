A **class level instance variable**
is a variable that belongs to a
class but is accessible to all
instances of that class.

It is different from a regular
instance variable, which is specific
to each individual object.

To define a class level instance
variable, you add `@@` 
before the variable name.

Let us take a look at an example.

<codeblock language="ruby" type="lesson">
<code>
class Counter
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

object1 = Counter.new
object2 = Counter.new

puts Counter.count
</code>
</codeblock>

In this example, we have
a Counter class that keeps track
of the count of objects created.

The **@@count** class level instance
variable is being used to store and update
the count.

Each time a new instance of the **Counter**
class is initialized, the **@@count**
variable is incremented.

The class method `count` allows us to
retrieve the total count of objects.
