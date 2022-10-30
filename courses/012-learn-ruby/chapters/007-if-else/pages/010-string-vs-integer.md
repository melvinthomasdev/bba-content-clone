There is a difference between
string 12 and the number 12.
They are not the same.

<Editor lang="ruby">
<code>
if "12" == 12
  puts "they are equal"
else
  puts "they are not equal"
end
</code>
</Editor>

## Converting String to Integer

How to convert string 12 to integer 12?
Ruby has a method called `to_i`.
It converts string into integer.

<Editor lang="ruby">
<code>
if "12".to_i == 12
  puts "they are equal"
else
  puts "they are not equal"
end
</code>
</Editor>

In the above example, we converted
the string 12 to the number 12
using `to_i`.