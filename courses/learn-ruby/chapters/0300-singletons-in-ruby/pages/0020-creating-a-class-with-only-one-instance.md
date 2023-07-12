The singleton class can also be used to enforce the restriction that there can be only one object of that class in the entire application. This design pattern is called the Singleton Pattern.

In Ruby, you can create a singleton object by using the [`Singleton`](https://docs.ruby-lang.org/en/3.2/Singleton.html) module. This module provides a convenient way to define a singleton class with just a few lines of code. By including the `Singleton` module, only one instance of the respective class can be created. Consider the below example:

<codeblock language="ruby" type="lesson">
<code>
require 'singleton'

class Logger
  include Singleton

  def log(message)
    puts "[LOG] #{message}"
  end
end

logger1 = Logger.instance
logger2 = Logger.instance

puts "logger1 object ID: #{logger1.object_id}"
puts "logger2 object ID: #{logger2.object_id}"
</code>
</codeblock>

In this example, we define a `Logger` class that includes the `Singleton` module. We create two instances of the `Logger` class, `logger1` and `logger2`, by calling the `instance` method provided by the `Singleton` module. Since the `Logger` class includes the `Singleton` module, calling `Logger.instance` will always return the same instance of the class.

To verify whether the instances `logger1` and `logger2` are the same, we output their respective object IDs using the `object_id` method. When you run this example, you'll see that the object IDs of `logger1` and `logger2` are identical, demonstrating that only one instance of the `Logger` class is created.

While it is possible to create singletons without using the `Singleton` mixin, incorporating the mixin provides important advantages, particularly in terms of **thread safety**. It simplifies the implementation, ensures consistent usage, and provides a standardized API for accessing the singleton instance. These benefits make the `Singleton` mixin a valuable tool when working with singletons in Ruby.