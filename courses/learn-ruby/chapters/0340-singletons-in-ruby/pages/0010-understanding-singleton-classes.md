In Ruby, every object has its own unique class associated with it. This is called a singleton class. To access the singleton class of an object, you can use the `singleton_class` method.

Consider a `User` class as shown below.

<codeblock language="ruby" type="lesson">
<code>
class User
	attr_reader :name

	def initialize(name)
		@name = name
	end
	
  def greet
		puts "Hello, I'm #{name}!"
	end
end

user1 = User.new("Alice")
user2 = User.new("Bob")

puts user1.singleton_class
puts user2.singleton_class
</code>
</codeblock>

In the above code, the `User` class has an instance variable `@name` and a getter method `name` defined using the `attr_reader` method. The `greet` method prints a greeting message using the `name` attribute of the user. The `singleton_class` method is called on `user1` and `user2` to retrieve their respective singleton classes.

Upon running the code snippet, the output will show the singleton class of `user1` and `user2`, which will be different for each object. Even though both objects `user1` and `user2` are instances of the same `User` class, each object will have its own singleton class associated with it.

Singleton classes allow us to define behaviors that are unique to a particular object. To demonstrate this, let's assume that `user1` speaks only French. So here we can modify the behaviour of `user1`, using the singleton class, as follows:

<codeblock language="ruby" type="lesson">
<code>
class User
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    "Hello, I'm #{name}!"
  end
end

user1 = User.new("Alice")
user2 = User.new("Bob")

def user1.greet
  puts "Bonjour, je m'appelle #{name}!"
end

puts user1.greet  
puts user2.greet
</code>
</codeblock>

In the above example, a new `greet` method is defined specifically for `user1`. This singleton method for `user1` overrides the `greet` method defined in the `User` class. 

The focus is on modifying the behavior to accommodate the fact that `user1` speaks only French. When `user1.greet` is called, the singleton method defined for `user1` is invoked, which overrides the `greet` method of the `User` class. As a result, it prints `Bonjour, je m'appelle Alice!`.

Singleton classes have two primary uses: altering the behavior of individual objects and creating classes with only one instance. While both concepts involve singleton classes, they serve different purposes and have distinct implications. We already saw how to alter behaviour of individual objects in this lesson. In the next lesson, we shall learn how to create classes with one instance.