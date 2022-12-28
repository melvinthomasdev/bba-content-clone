We have an array full of numbers.
Create another array
with the double of these numbers.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
numbers = [3,8,13]
double_numbers = []
</code>

<solution>
numbers = [3,8,13]
double_numbers = []

numbers.each do |number|
  double_numbers.push(number * 2)
end

puts double_numbers
</solution>
</codeblock>