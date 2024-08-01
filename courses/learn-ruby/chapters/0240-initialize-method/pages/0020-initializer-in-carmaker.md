While making the car, we should
be able to set the color of the car:

```
car1 = Car.new("red")
car1.current_color
```

<codeblock language="ruby" type="lesson">
<code>
class Carmaker
  def initialize(color)
    @color = color
  end

  def current_color
    puts "Color of this car is #{@color}"
  end
end

car1 = Carmaker.new("red")
car1.current_color
</code>
</codeblock>