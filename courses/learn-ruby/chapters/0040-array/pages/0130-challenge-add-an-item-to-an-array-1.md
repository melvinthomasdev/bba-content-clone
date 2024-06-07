We have an array full of numbers.

Create another array with
the double of these numbers
and
display it on the console.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
numbers = [3,8,13]
double_numbers = []

# Write code below this line


# Write code above this line
puts double_numbers
</code>

<solution>
numbers = [3,8,13]
double_numbers = []

# Write code below this line
numbers.each do |number|
  double_numbers.push(number * 2)
end

# Write code above this line
puts double_numbers
</solution>
</codeblock>
