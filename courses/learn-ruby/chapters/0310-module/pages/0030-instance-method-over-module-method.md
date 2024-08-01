Sometimes, we might have a method
defined by the same name in both the class
as well as in the module.
In that case, which method will Ruby choose?
The answer depends on
what path Ruby takes for
looking up methods.

<codeblock language="ruby" type="lesson">
<code>
module Info
  def name
    puts "Roger Smith"
  end
end

class Person
  include Info
  def name
    puts "name from the Person class"
  end
end

p1 = Person.new
p1.name
</code>
</codeblock>

In the example given above, we can
see that **p1** uses the **name**
method that was defined in
the class **Person** instead of the
one defined in the module **Info**.

Thus we can see, Ruby first looks at the
instance methods
of the class itself.
If it does not find the method there, then Ruby
will look for the method in the included modules.