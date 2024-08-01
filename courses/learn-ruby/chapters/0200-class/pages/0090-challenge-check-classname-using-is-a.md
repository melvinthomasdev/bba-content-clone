Check if **biscuit1** belongs to class `Biscuitproducer` using method `is_a?`.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
class Biscuitproducer
end

biscuit1 = Biscuitproducer.new
# Write your code here
</code>

<solution>
class Biscuitproducer
end

biscuit1 = Biscuitproducer.new
puts biscuit1.is_a?(Biscuitproducer)
</solution>
</codeblock>
