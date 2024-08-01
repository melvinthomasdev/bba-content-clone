Write a program which will
convert **55** pounds into kilogram.

```
kilogram = pound * 0.4536
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
  def initialize(pound)
    @pound = pound
  end

  def value_in_kilogram
    @pound * 0.4536
  end
end

converter = Converter.new(55)
puts converter.value_in_kilogram
</solution>
</codeblock>
