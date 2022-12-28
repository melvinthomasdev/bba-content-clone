Fix the code given below so
that the **burger** instance
can access the **size** value.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Burger
  def initialize(size)
    @size = size
  end
end

burger = Burger.new("medium")
puts burger.size
</code>

<solution>
class Burger
  def initialize(size)
    @size = size
  end

  def size
    @size
  end
end

burger = Burger.new("medium")
puts burger.size
</solution>
</codeblock>