In the code below,
we have a **number**.
If the double of the number
is within the range **40 to 80**,
then print **Large number**.

On the other hand, if the double
of number is within the range **0 to 40**,
then print **Small number**.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
number = 11

# Write code below this line
</code>

<solution>
number = 11

# Write code below this line
double_of_number = 2 * number
range = (40..80)
is_in_range = range.include? double_of_number

if is_in_range
  puts "Large number"
else
  puts "Small number"
end
</solution>
</codeblock>
