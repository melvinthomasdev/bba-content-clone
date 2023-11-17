Consider the provided `Person` class:

<codeblock language="ruby" type="lesson">
<code>
class Person
  def initialize(name, age)
    @name = name
    @age = age
  end

  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old."
  end
end

person1 = Person.new("Albert",  23)
person1.introduce
</code>
</codeblock>

In this class, the instance variables `@name` and `@age` serve as 
containers that hold the specific characteristics of an instance 
of the `Person` class. The instance method `introduce` can be 
invoked on a `Person` object to reveal information about that 
individual.

The class acts as a unified entity bundling both the 
data, represented by the instance variables, and the methods that 
operate on that data. This cohesion establishes a protective 
boundary, safeguarding the data from unauthorized access and 
alterations, a principle known as encapsulation.

Encapsulation serves to conceal internal details, exposing only 
the essential components. Using class objects, we create 
encapsulated instance variables and methods accessible solely by 
the object's class or the object itself, restricting access from 
external sources. 

Employing method access control further fortifies this encapsulation, 
restricting even the object itself from accessing these variables and 
methods. We will learn about access control modifiers in the next lesson.

