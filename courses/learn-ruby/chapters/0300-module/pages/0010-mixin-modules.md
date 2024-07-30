In Ruby, a **Class** can have methods.
Similarly, a **Module** can also have methods.

```
module Info
  def name
    puts "Roger Smith"
  end
end
```

However, we can't call `new` on a **Module**.
A module needs to be mixed in with a class.
In other words, we need to put the module in a class
and then we need to instantiate that class.
Then, that instance will have access to the methods
defined in the module.

<codeblock language="ruby" type="lesson">
<code>
module Info
  def name
    puts "Roger Smith"
  end
end

class Person
  include Info
end

p1 = Person.new
p1.name
</code>
</codeblock>