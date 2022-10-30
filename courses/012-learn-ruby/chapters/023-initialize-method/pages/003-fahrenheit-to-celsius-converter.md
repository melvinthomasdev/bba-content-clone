Let's write a program  which will
convert Fahrenheit values to Celsius values.

The formula to convert temperature
from Fahrenheit to Celsius is given below:

```
Celsius = (Fahrenheit - 32) * 5 / 9
```

<Editor lang="ruby">
<code>
class Converter
  def initialize(fahrenheit)
    @fahrenheit = fahrenheit
  end

  def value_in_celsius
    (@fahrenheit - 32) * 5 / 9
  end
end

converter = Converter.new(77)
puts converter.value_in_celsius
</code>
</Editor>

Change the Fahrenheit value from **77**
to some other value and
run the code again to see the result.