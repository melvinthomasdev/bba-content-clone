Write a program which will
convert **55** pounds into kilogram.

```
kilogram = pound * 0.4536
```

<Editor lang="ruby" type="exercise">
<code>
class Converter
end
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
</Editor>