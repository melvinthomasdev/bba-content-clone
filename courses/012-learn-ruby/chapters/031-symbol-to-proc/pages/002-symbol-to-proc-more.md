We saw that we can use `inject` like this.

<Editor lang="ruby">
<code>
def adder(array)
  array.inject { |result, element| result + element }
end

array = [1,2,3,4,5,6]
puts adder(array)
</code>
</Editor>

In Ruby the plus sign is a method so we can write the above code like this.

<Editor lang="ruby">
<code>
def adder(array)
  array.inject(&:+)
end

array = [1,2,3,4,5,6]
puts adder(array)
</code>
</Editor>

Let's see some more examples of `Symbol to Proc`.

<Editor lang="ruby">
<code>
def rounder(array)
  array.map { |element| element.round }
end

array = [1.23, 4.56, 7.89]
puts rounder(array)
</code>
</Editor>

This code could also be written as shown below.

<Editor lang="ruby">
<code>
def rounder(array)
  array.map(&:round)
end

array = [1.23, 4.56, 7.89]
puts rounder(array)
</code>
</Editor>

Here is another example.

<Editor lang="ruby">
<code>
string = "Ruby is programming language"
puts string.split.map{ |element| element.length }.reduce { |result, element| result + element }
</code>
</Editor>

This code could be shortened a lot.

<Editor lang="ruby">
<code>
string = "Ruby is programming language"
puts string.split.map(&:length).reduce(&:+)
</code>
</Editor>