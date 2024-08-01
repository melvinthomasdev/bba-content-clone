Write a program which will convert
**77** yards into meters.

```
meter = yard * 0.9144
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Converter
  # Write your code here
end

# Write your code here
</code>

<solution>
class Converter
  def initialize(yard)
    @yard = yard
  end

  def value_in_meter
    @yard * 0.9144
  end
end

converter = Converter.new(77)
puts converter.value_in_meter
</solution>
</codeblock>
