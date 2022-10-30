Check if **biscuit1** belongs to class `Biscuitproducer` using method `is_a?`.

<Editor lang="ruby" type="exercise">
<code>
class Biscuitproducer
end

biscuit1 = Biscuitproducer.new
</code>

<solution>
class Biscuitproducer
end

biscuit1 = Biscuitproducer.new
puts biscuit1.is_a?(Biscuitproducer)
</solution>
</Editor>