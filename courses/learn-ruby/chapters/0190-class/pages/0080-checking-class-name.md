If we want to check if an instance is from a given `Class`
then we can use method `is_a?`.

<codeblock language="ruby" type="lesson">
<code>
class Carmaker
end

car1 = Carmaker.new
puts car1.class
puts car1.is_a?(Carmaker)
</code>
</codeblock>