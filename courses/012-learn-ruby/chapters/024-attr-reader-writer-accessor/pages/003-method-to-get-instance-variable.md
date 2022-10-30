We know that to give instances, access to
the Class instance variables, we need
to define new methods like we do here:

<Editor lang="ruby">
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
</Editor>

Now imagine, that the **CoffeeMaker** has
not one but five instance variables. For this
to work, we'll have to create 5 methods
to provide access to read them. This can
quickly become difficult to manage.

In Ruby, we can use `attr_reader` to give
object instances a simpler way to read
the instance variables:

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_reader :colour, :temperature, :quantity, :origin, :brand
  def initialize(colour, temperature, quantity, origin, brand)
    @colour = colour
    @temperature = temperature
    @quantity = quantity
    @origin = origin
    @brand = brand
  end
end

coffee1 = CoffeeMaker.new("dark", "hot", "small", "Brunei", "Domos")
puts coffee1.colour
puts coffee1.temperature
puts coffee1.quantity
puts coffee1.origin
puts coffee1.brand
</code>
</Editor>