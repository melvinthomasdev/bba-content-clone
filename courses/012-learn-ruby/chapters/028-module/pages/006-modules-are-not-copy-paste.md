Let's see what happens if
we change a module after it
has been included.

<Editor lang="ruby">
<code>
module Info
  def name
    puts "Roger Smith"
  end
end

class Person
  include Info
end

module Info
  def name
    puts "Mike Bohanan"
  end
end

p1 = Person.new
p1.name
</code>
</Editor>

As we can see, the result
is **Mike Bohanan**.
Do not think that including a
module is equivalent to copy pasting all the
module code into the class.
Including a module does
not work like that.

Including a module is more like
setting up a link in the
method lookup.
When **p1** is looking for the method
**name**, then first Ruby will
check if class **Person**
has any instance method called **name**.
The answer is No.

Then, Ruby will check if
class **Person** includes any modules.
The Answer is Yes. Module **Info** is included.

Then, Ruby checks if that module
has a method called **name**.
Answer is Yes.
Now, Ruby executes that method.

That is why, we can make changes
to the module even after
they are included in a class
and the updated method will be picked up.