Ruby provides us with `&.` which
is called the **Safe Navigation Operator**.
Let's look at it in action:

<Editor lang="ruby">
<code>
class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

user1 = User.new('Oliver')

# Method 1
if user1 && user1.name
  puts "We have a new user."
end

# Method 2 using &.
if user1&.name
  puts "We have a new user."
end
</code>
</Editor>

The `&.` checks if **user1** exists and
if the **name** method exists on **user1**.
We can see that it is a much simpler
approach compared to checking the existence
of each method at every subsequent stage.

Let's see how it works when we have
a `nil` value:

<Editor lang="ruby">
<code>
class User
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

user1 = User.new('Oliver')

user1 = nil

if user1&.name
  puts "We have a new user."
end
</code>
</Editor>

We can see that
the value of **user1**
becomes `nil`. But the
**safe navigation operator** ensures that
we don't get an error. It knows
that **user1** is now `nil` and hence it simply
does not try to call the method
**name** on **user1** keeping our code safe
from errors like these.