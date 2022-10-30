Look at the following code:

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

If you look at this part of the code,

```
  attr_reader :colour, :temperature, :quantity, :origin, :brand
  attr_writer :colour, :temperature, :quantity, :origin, :brand
```

it seems like a complicated way to
achieve a simple thing: access and
change instance variables.

Ruby provides us with `attr_accessor` to
simplify this code:

<Editor lang="ruby">
<code>
class CoffeeMaker
  attr_accessor :colour, :temperature, :quantity, :origin, :brand
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