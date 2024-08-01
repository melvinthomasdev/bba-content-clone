Let's create a coffee instance
using **Coffeemaker**.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
end

coffee1 = Coffeemaker.new
</code>
</codeblock>

We want to do something with
the coffee like **drink** or **stir**.

We need to add methods
to the **Coffeemaker** class,
so that a coffee instance
could use those methods.

<codeblock language="ruby" type="lesson">
<code>
class Coffeemaker
  def drink
    puts "drinking coffee"
  end

  def stir
    puts "stirring coffee"
  end
end

coffee1 = Coffeemaker.new
coffee1.drink
coffee1.stir
</code>
</codeblock>

Classes are used to make instances.
In order for instances to do something,
the class needs to have those methods.

Once again note that a method always starts with `def` and the method ends with `end`.
In the class `Coffeemaker` we have defined two methods `drink` and `stir`.
