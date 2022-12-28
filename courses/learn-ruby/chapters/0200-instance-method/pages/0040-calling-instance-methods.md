In the previous page we saw the following code.

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

After defining the method we need to call the method for that method to act.
The way we call that method is by having the name of the instance then a dot and then the method name.

For example when we write `biscuit1.eat` then it means that we are calling method `eat` on the instance `biscuit1`.

When we write `biscuit1.gift` then we are calling method `gift` on the instance `biscuit1`.

If we write just `eat` or `gift` then we will get error. Let's see it in action.

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

eat
</code>
</codeblock>

The error message is `undefined method eat for main`.

In summary first we need to define a method and then we need to call that method to put that method to use.
Just defining the method means that method is ready and waiting for someone to call it to do something.