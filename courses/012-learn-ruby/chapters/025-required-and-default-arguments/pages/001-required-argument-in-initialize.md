In the case given below,
the `initialize` method takes one argument:

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_reader :condition
  def initialize(condition)
    @condition = condition
  end
end

coffee1 = CoffeeMaker.new("hot")
puts coffee1.condition
</code>
</Editor>

While calling the `new` method,
we can pass the value **hot**.
We can also tell Ruby that if no
value is passed, then take **hot**
as the default value.

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_reader :condition
  def initialize(condition = "hot")
    @condition = condition
  end
end

coffee1 = CoffeeMaker.new
puts coffee1.condition
</code>
</Editor>

Now, when we are not providing
any value, then **hot** becomes
the default value.
On the other hand, if we did provide a value,
then that value would
override the default value.

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_reader :condition
  def initialize(condition = "hot")
    @condition = condition
  end
end

coffee1 = CoffeeMaker.new("cold")
puts coffee1.condition
</code>
</Editor>