Ruby provides three levels of access control: `public`, `protected`, and 
`private`. These modifiers determine the visibility of methods within a 
class.

**Public**: Public methods can be called by anyone both from outside 
the class and from within the class. By default, all methods in 
Ruby are public.

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

In this example, `introduce` is a public method that can be called from any part of the code.

**Protected**: Protected methods can be called only by objects of the 
same class or its subclasses. They are not accessible from 
outside the class.

Let's add a method called `update_name` to the `Person` class.  Subclasses might need to change the name for specific reasons like a marriage. Making it protected permits the method's usage by subclasses.

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

  protected

    def update_name(new_name)
      @name = new_name
    end
end

class Adult < Person
  def marry(spouse_name)
    new_full_name = "#{@name.split.first} #{spouse_name.split.first}"
    update_name(new_full_name)
  end
end

alice = Adult.new("Alice Smith",  27)
alice.introduce
alice.marry("Richard Roy")
alice.introduce
</code>
</codeblock>

**Private**: Private methods are the most restrictive. They can be 
called only within the context of the object itself. Private 
methods cannot be called with an explicit receiver, even if the 
receiver is `self`.

Let's add a method to generate a unique username for a person based on 
their name and age. The logic for generating a username should be 
specific to the `Person` class and is not meant to be exposed or 
modified externally.

<codeblock language="ruby" type="lesson">
<code>
class Person
  def initialize(name, age)
    @name = name
    @age = age
    @username = generate_username
  end

  def introduce
    puts "Hi, I'm #{@name} and I'm #{@age} years old. My username is #{@username}"
  end

  protected

    def update_name(new_name)
      @name = new_name
    end

  private

    def generate_username
      name_parts = @name.split
      "#{name_parts.first.downcase}_#{@age}"
    end
end

person1 = Person.new("Albert",  23)
person1.introduce
</code>
</codeblock>
