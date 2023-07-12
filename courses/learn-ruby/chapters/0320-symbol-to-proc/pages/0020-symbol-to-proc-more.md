We saw that we can use `inject` like this.

<codeblock language="ruby" type="lesson">
<code>
def adder(array)
  array.inject { |result, element| result + element }
end

array = [1,2,3,4,5,6]
puts adder(array)
</code>
</codeblock>

In Ruby the plus sign is a method so we can write the above code like this.

<codeblock language="ruby" type="lesson">
<code>
def adder(array)
  array.inject(&:+)
end

array = [1,2,3,4,5,6]
puts adder(array)
</code>
</codeblock>

Let's see some more examples of `Symbol to Proc`.

<codeblock language="ruby" type="lesson">
<code>
def rounder(array)
  array.map { |element| element.round }
end

array = [1.23, 4.56, 7.89]
puts rounder(array)
</code>
</codeblock>

This code could also be written as shown below.

<codeblock language="ruby" type="lesson">
<code>
def rounder(array)
  array.map(&:round)
end

array = [1.23, 4.56, 7.89]
puts rounder(array)
</code>
</codeblock>

Here is another example.

<codeblock language="ruby" type="lesson">
<code>
string = "Ruby is programming language"
puts string.split.map{ |element| element.length }.reduce { |result, element| result + element }
</code>
</codeblock>

This code could be shortened a lot.

<codeblock language="ruby" type="lesson">
<code>
string = "Ruby is programming language"
puts string.split.map(&:length).reduce(&:+)
</code>
</codeblock>