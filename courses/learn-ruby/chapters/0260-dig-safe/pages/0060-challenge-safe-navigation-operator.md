If the method **name** exists in
**liquid1**, then by using `&.`,
print to the screen, **Milk is energy**:

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Liquid
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

liquid1 = Liquid.new('milk')

# Write your code below this
</code>

<solution>
class Liquid
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

liquid1 = Liquid.new('milk')

# Write your code below this

if liquid1&.name
  puts "Milk is energy"
end
</solution>
</codeblock>