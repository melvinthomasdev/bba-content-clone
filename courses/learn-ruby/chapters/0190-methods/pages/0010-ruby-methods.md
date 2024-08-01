Ruby methods are similar to functions in other programming languages. They are used to encapsulate one or more repeatable statements into a single unit.

## Naming Conventions

Method names should start with a lowercase letter. If a method name begins with an uppercase letter, Ruby may mistakenly interpret it as a constant, leading to potential parsing errors.

## Simple Method Example

Here is an example of a method that prints "Hello World":

<codeblock language="ruby" type="lesson">
<code>
def print_hello_world
  puts "Hello world!"
end

print_hello_world

</code>
</codeblock>

## Methods with Parameters

Parameters are variables in a method definition that allow you to pass information (or arguments) into the method. They let the method perform actions based on the input values provided when the method is called. This is useful when the method needs to work with different inputs. Here's an example:

<codeblock language="ruby" type="lesson">
<code>
def greet(name)
  puts "Hello, #{name}!"
end

greet("Alice") # Output: Hello, Alice!
greet("Bob") # Output: Hello, Bob!

</code>
</codeblock>

### Methods with Multiple Parameters

You can also define methods with multiple parameters. Here's how:

<codeblock language="ruby" type="lesson">
<code>
def add_numbers(num1, num2)
  sum = num1 + num2
  puts "The sum is #{sum}."
end

add_numbers(5, 3)

</code>
</codeblock>

In the above case, the `add_numbers` method accepts two parameters, `num1` and `num2`, adds them together, and prints the result.

### Default Parameters

<codeblock language="ruby" type="lesson">
<code>
def greet(name="Guest")
  puts "Hello, #{name}!"
end

greet() # Output: Hello, Guest!
greet("Alice") # Output: Hello, Alice!

</code>
</codeblock>

Here, the greet method has a default value for the name parameter. If no argument is passed, it uses "Guest" as the default.

## Positional & Named Parameters

### Positional Parameters

In Ruby, positional parameters are passed to methods based on the order in which they are listed:

<codeblock language="ruby" type="lesson">
<code>
def greet(first_name, last_name)
  puts "Hello, #{first_name} #{last_name}!"
end

greet("Alice", "Smith") # Output: Hello, Alice Smith!

</code>
</codeblock>

Here, "Alice" is assigned to `first_name`, and "Smith" is assigned to `last_name` based on their positions.

### Named Parameters

Named parameters, also known as keyword arguments, are passed by specifying the parameter names along with their values:

<codeblock language="ruby" type="lesson">
<code>
def greet(first_name:, last_name:)
  puts "Hello, #{first_name} #{last_name}!"
end

greet(first_name: "Alice", last_name: "Smith") # Output: Hello, Alice Smith!

</code>
</codeblock>

With named parameters, the order doesn't matter because each argument is associated with a specific parameter name.

You can also set default values for named parameters:

<codeblock language="ruby" type="lesson">
<code>
def greet(first_name: "Guest", last_name: "User")
  puts "Hello, #{first_name} #{last_name}!"
end

greet() # Output: Hello, Guest User!
greet(first_name: "Alice") # Output: Hello, Alice User!

</code>
</codeblock>

This allows you to call the method without passing all arguments, and the default values will be used instead.
