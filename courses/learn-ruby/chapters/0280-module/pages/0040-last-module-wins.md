A class can include any number of modules.
If there are two modules with the same method name,
then the module which was included later wins.

<codeblock language="ruby" type="lesson">
<code>
module Info1
  def name
    puts "Roger Smith"
  end
end

module Info2
  def name
    puts "Mary Brett"
  end
end

class Person
  include Info1
  include Info2
end

p1 = Person.new
p1.name
</code>
</codeblock>

As we can see, both the modules
have the same method `name`.
In this case, the module that was
included later wins. Change
the order of the modules inside
the class and then notice how
the result changes.