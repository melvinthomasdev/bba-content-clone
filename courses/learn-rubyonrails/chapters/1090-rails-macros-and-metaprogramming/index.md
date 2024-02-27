## What is Metaprogramming?

Metaprogramming is a technique in which code operates on code rather than on
data. It can be used to write programs that write code dynamically at run time.
MetaProgramming gives Ruby the ability to open and modify classes, create
methods on the fly and much more.

A few examples of metaprogramming in Ruby are:

- Adding a new method to Ruby's native classes or to classes that have been
  declared beforehand.

- Using `send` to invoke a method by name programmatically.

## Metaclasses

You must have read about `singleton` methods in Ruby. `Singleton` methods are
declared on a single instance of a class and they are only available on that
particular instance contrary to instance methods which are available for all
instance methods of a class. For example:

```ruby
class Animal
end

dog = Animal.new

cat = Animal.new

def dog.bark
  puts "woof!"
end

dog.bark # woof!

cat.bark # undefined method `bark' for #<Animal:0x000000013181f510> (NoMethodError)
```

In the above example, `bark` is declared on the `dog` object, hence it is only
available to that particular instance of the `Animal` class.

Objects cannot hold methods, only classes can. But sometimes it is required for
objects to have methods. This is where the `metaclass` comes in. Ruby provides a
`metaclass` for each object which contains all the `singleton` methods of an
object.

A `metaclass` is also referred by other names such as an `eigenclass` or a
`singleton class`. We will be using the term `metaclass` for all intents and
purposes in this chapter.

Let us understand the concept of `metaclass` with the help of an example.
Previous example could be re-written as:

```ruby
class << dog
  def bark
    puts "woof!"
  end
end
```

The syntax is different but it effectively does the same thing. In the above
example, `class << dog` is used to open up the `metaclass` of dog object and
`bark` is defined inside the `dog's` metaclass. Therefore it becomes the
singleton method of `dog`

We know that everything in Ruby is an object. Even classes are objects since
they are instances of the `Class` class.

So if a Ruby class is an object in its own right, we can treat it like any other
object. For example, we can define a singleton method on a Ruby class as shown
below:

```ruby
def Animal.walks?
  true
end
```

Now, let us declare a class method.

```ruby
class Animal
  def self.eats?
   true
  end
end
```

Since classes are objects in Ruby, and a class method is defined on a single
instance of class, they can also be called as singleton methods of the class
they are defined on.

Let's check for all singleton methods for the Animal class using the
`instance_methods` method. `instance_methods` can be called for all Ruby classes
, it returns an array containing names of all instance methods of a class.

We can exclude the instance methods of ancestor classes by passing `false` as an
argument.

```ruby
Animal.singleton_class.instance_methods(false)
=> [:walks?, :eats?]
```

From the above example it is clear that class methods are nothing but singleton
methods of a class which are present inside the class's metaclass.

## Usage of send in Ruby

Ruby gives us a convenient way to call any method on an object using `send`. It
is an instance method of the `Object` class.

`send` method accepts the name of the method to be called as its first argument
and the remaining arguments passed to it are passed as arguments to the method
that is being called.

Method name can be passed as a string or a symbol but symbols are preferred. If
a string is passed, it is converted to a symbol. Given below is an example
showing how `send` is used:

```ruby
class Animal
  def eats?
    true
  end
end

dog = Animal.new

dog.send(:eats?) # true
```

In the above example, `send` method is used to invoke the `eats?` instance
method of `Animal` class.

Whenever `send` method is invoked on an object, it sends a message to that
object. What we need to understand here is that any method call in Ruby is
actually a message passed to that object.

In case of the `send` method, the name of method and arguments are passed as
message to the calling object.

`send` can also be used to invoke `private` and `protected` methods of a class.

## Defining methods dynamically

Consider a situation where you have to define a series of methods which are very
similar in the sense that they have the same basic structure except for a
string.

Sure, you can declare a method and pass the string as an argument to this
method. But the issue with this approach is that, it is not very declarative. As
in, the method name will now have to be generic.

Let us consider an example to understand this. Suppose we need to declare two
methods that perform two different actions. Let these actions be eating and
walking. Declaring two different methods called `eat` and `walk` will not be
very DRY. Instead we can declare a method and pass the actions as an argument as
shown below:

```ruby
class Animal
  def perform(action)
    puts "Performing #{action}."
  end
end
```

But the method in the above example is not very declarative since it doesn't say
which action is being performed. Also,`perform` is a very generic name which
doesn't tell us a lot about which action the method is supposed to be
performing.

Lets see how we can re-write this so that the code becomes more declarative
while adhering to the principles of DRY.

```ruby
class Animal
  ["eat", "walk"].each do |action|
    define_method(action) do
      puts "performing #{action}"
    end
  end
end
```

In the above example, we have used metaprogramming to define two methods called
`eat` and `walk`. If you notice, the code that we have written is also acting as
the data required for generating methods.

Let's break down what is happening. `define_method` is a Ruby method defined
inside the `Module` class. It is used to define instance methods on the receiver
dynamically. It accepts two arguments, first being the name of method and second
argument is a block which becomes the method body and parameters of the block
become parameters of the method.

In the example above, we have not used any receiver explicitly on which
`define_method` is being called. Hence `self` object becomes the receiver which
in this case is the `Animal` class.

**Note: You should refrain from using `define_method` for method creation in a
real-world codebase as it increases complexity and reduces the readability of
code**.

A developer who looks at such a code in future, may not be able to figure out
the context easily and often make the code unmaintainable.

## Defining missing methods on the fly

One more important aspect of metaprogramming is `method_missing` method. It is
invoked by Ruby when receiver object is sent a message it cannot handle.

In other words, when a method is called on an object, Ruby first looks for the
method inside the object's metaclass, then it goes into the object's class and
looks for it in instance methods.

If it doesn’t find the method there, it continues to search up the ancestors
chain. If Ruby still doesn’t find the method, it calls another method named
`method_missing`.

Ruby invokes `missing_method` with the name of the missing method as a symbol,
arguments passed to the method and a block.

`method_missing` is an instance method of the `Kernel` class which `Object`
class inherits from.

The `method_missing` method is used in the official Rails codebase to implement
a few functionalities like displaying a custom message when a method is not
found and also for dynamically creating a method which doesn't exist.

Let's see how we can dynamically create a method that doesn't exist using
concepts we have learnt so far.

```ruby
class Animal
  def method_missing(method, *args, &block)
    return super(method, *args, &block) unless method.to_s.include?("can")

    self.class.send(:define_method, method) do
      puts "#{method} created"
    end
  end
  self.send(method, *args, &block)
end

dog = Animal.new

dog.swim? # undefined method `swim?' for #<Animal:0x0000000141834fe0> (NoMethodError)

dog.can_swim? # can_swim? created
```

Let's break down the code in above example. Calling `can_swim?` and `swim?`
methods that don’t exist will invoke `method_missing`.

Inside `method_missing`, we want to create a new method only when the method
name includes "can". Otherwise we want to call super which will in turn call the
`method_missing` method in `Kernel` module which will throw a `NoMethodError`
exception.

## Macros in Rails

Macros are everywhere in Ruby. You cannot get very far into the Ruby language
without encountering a Macro. A few common examples of Macros in Ruby/Rails are
`attr_accessor`, `has_many` and `belongs_to`.

The first time you encounter a declaration like `has_many`, it looks like
something built in the Ruby language. But it is just Ruby code. Ruby makes
programming in this declarative style easier than you might think.

Macros in Ruby are class methods that generate instance methods. Let us try to
understand how `macros` work by implementing our own version of the `has_many`
macro.

Suppose there is a `User` model with a `has_many` association for `comments` as
shown in the following example:

```ruby
class User
  has_many :comments
end
```

`has_many` declaration is a call to the `has_many` class method. Upon invocation
`has_many` dynamically generates methods for managing the association.

In this case, it should generate the `comments` instance method inside `User`
model which would return the comments belonging to each user.

We will try to define a `has_many` class method inside the `User` model which
will dynamically generate the instance methods for associations passed to
`has_many` as arguments.

But before we do so, it is important to understand that all Ruby classes are
executable code i.e. All the code inside a Ruby class is executed during the
process of defining a class. For example, if we define the following class:

```ruby
class User
  puts "Inside the User class"

  def self.class_method
    puts "Inside class method"
  end

  puts "After class method declaration"

  self.class_method
end
```

The result would be:

```text
Inside the User class
After class method declaration
Inside class method
```

Hence every piece of code inside a class definition is executed while defining
the class.

Now, let's define the `has_many` class method inside `User` class.

```ruby
class User
  def self.has_many(association_name)
    define_method(association_name) do
      puts "Returning association user.#{association_name}"
    end
  end

  has_many :comments
end

user = User.new

user.comments # Returning association user.comments
```

Let's break down the code in above example. We know that every line of code
inside a Ruby class is executable. Therefore, when `has_many` method is invoked,
it calls `define_method` on `User` and generates instance methods inside `User`
class by the name of association passed to `has_many` as an argument.

Recall that we have already discussed this technique of dynamic method creation
using `define_method` earlier in this chapter.

This way, we can have as many `has_many` associations as we want inside our
`User` model. Since every `has_many` declaration is a class method call, an
instance method will be created for each association.

Note that in the above example, the receiver of `has_many` and `define_method`
method calls is `self` object and in this case it is equal to the `User` model.

We have skipped `self` as it is redundant. Ruby implicitly adds `self` as a
receiver if there is no explicit receiver for a method call.

For the sake of simplicity, we defined the `has_many` method inside the `User`
object itself. Ideally, methods like `has_many` and `belongs_to` are defined
inside the `ActiveRecord::Base` class so that they are available to all the
model classes which inherit from `ActiveRecord::Base` class.

Now we know how a class method or macro is used to generate instance methods.
Another popular macro is the `attr_accessor` macro which generates a getter and
setter instance method for each attribute passed to the `attr_accessor` method
call.

Now you might have a good idea about what a macro is and what metaprogramming is
etc. The point of this chapter was to give you an idea about what's happening
underneath the hood.

**There is nothing to commit in this chapter as it's an in-depth chapter that
doesn't have anything to do with our granite application.**
