Let's say, that the instance of **CoffeeMaker**
wants to access the condition of coffee.
In that case, we would have a problem.
In Ruby, instances of **CoffeeMaker** can't access
instance variables just like that.
Only the methods can access instance variables.
Let's see an example:

<codeblock language="ruby" type="lesson">
<code>
class CoffeeMaker
  def initialize(condition)
    @condition = condition
  end
end

coffee1 = CoffeeMaker.new("hot")
puts coffee1.condition
</code>
</codeblock>

In the case given above, we are
getting an error `undefined method condition`.

In order to fix this error,
we can create a method which
will return the instance variable.

<codeblock language="ruby" type="lesson">
<code>
class CoffeeMaker
  def initialize(condition)
    @condition = condition
  end

  def condition
    @condition
  end
end

coffee1 = CoffeeMaker.new("hot")
puts coffee1.condition
</code>
</codeblock>

Now, the code will work,
because we added a method
called `condition` which is returning
the instance variable `@condition`.
