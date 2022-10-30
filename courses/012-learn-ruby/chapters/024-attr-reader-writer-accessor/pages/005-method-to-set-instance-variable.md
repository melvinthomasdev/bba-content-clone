To give instances access to
the instance variables, we need
to define new methods like we do here:

<Editor lang="ruby">
<code>
class CoffeeMaker
  def initialize(condition)
    @condition = condition
  end
  # Access the instance variable value
  def condition
    @condition
  end
  # Change the instance variable value that we can access
  def condition=(condition)
    @condition = condition
  end
end

coffee1 = CoffeeMaker.new("hot")
coffee1.condition = "cold"
puts coffee1.condition
</code>
</Editor>

Note that we need to first be able to
access the value to change it.

Now imagine, that the **CoffeeMaker** has
not one but five instance variables. For this
to work, we'll have to create 5 methods
to provide access to read them and 5 methods
to change their respective values. This can
quickly become difficult to manage.

In Ruby, we can use `attr_writer` along with
`attr_reader` to give object instances a simpler
way to update the instance variables:

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_reader :colour, :temperature, :quantity, :origin, :brand
  attr_writer :colour, :temperature, :quantity, :origin, :brand
  def initialize(colour, temperature, quantity, origin, brand)
    @colour = colour
    @temperature = temperature
    @quantity = quantity
    @origin = origin
    @brand = brand
  end
end

coffee1 = CoffeeMaker.new("dark", "hot", "small", "Brunei", "Domos")
coffee1.colour = "light"
puts coffee1.colour
coffee1.temperature = "cold"
puts coffee1.temperature
coffee1.quantity = "large"
puts coffee1.quantity
coffee1.origin = "Damascus"
puts coffee1.origin
coffee1.brand = "Misty"
puts coffee1.brand
</code>
</Editor>