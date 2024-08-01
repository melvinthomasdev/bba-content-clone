In large programs, we cannot remember
the order in which Ruby will look up
methods. It turns out, we don't need to
remember that.

We can ask Ruby to give us that order.

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

puts Person.ancestors
</code>
</codeblock>

Here, we can see that first Ruby
will look for the method
in the `Person` class itself
and
then in module `Info2` and
then in module `Info1`.

For the modules, it's simply
preferring the ones that are
included later, so essentially,
it will feel like it is checking
for the method in a bottom-to-top
manner.

We can also ask Ruby what
modules are included.

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

puts Person.included_modules
</code>
</codeblock>

From this, it's clear that
`Info2`, `Info1` and `Kernel`
are modules.

The **Kernel** module
is one which is included in
the basic **Object** class of Ruby.
This class is by default added as
a parent to all Ruby classes. This means
that the **Kernel** module methods
will be available to all
the instances of any class.