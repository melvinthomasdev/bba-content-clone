Here is our code from
the previous lesson:

<codeblock language="ruby" type="lesson">
<code>
class Biscuitproducer
  def eat
    puts "eating biscuit"
  end

  def gift
    puts "biscuit is a wonderful gift"
  end
end

biscuit1 = Biscuitproducer.new

biscuit1.eat
biscuit1.gift
</code>
</codeblock>

As we can see, we are calling
the method **eat**
and
**gift** on the instance.

Let's try to call these
methods on the class itself.
We will get an error.
Let's see it in action.

<codeblock language="ruby" type="lesson">
<code>
class Biscuitproducer
  def eat
    puts "eating biscuit"
  end

  def gift
    puts "biscuit is a wonderful gift"
  end
end

biscuit1 = Biscuitproducer.new

Biscuitproducer.eat
</code>
</codeblock>

We got an error because the method
exists only on the instances
and
not on the class.
These methods are also called
**instance methods** because **these methods
can only be called by an instance**
and
not by the class.
