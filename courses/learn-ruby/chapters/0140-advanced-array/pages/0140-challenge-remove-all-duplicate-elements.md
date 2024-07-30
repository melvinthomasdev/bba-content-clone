We have three arrays. Remove the 
duplicate elements from each array, 
and display the updated arrays on 
the screen in the same order.

For example:
```ruby
Input:
input_array = [1, 2, 2, 3, 4, 4, 5]

Output:
[1, 2, 3, 4, 5]
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
input_array1 = ["apple", "banana", "apple", "cherry", "banana"]
input_array2 = [false, true, true, false, nil, nil]
input_array3 = []

# Write code below this line

</code>
<solution>
input_array1 = ["apple", "banana", "apple", "cherry", "banana"]
input_array2 = [false, true, true, false, nil, nil]
input_array3 = []

# Write code below this line

puts input_array1.uniq
puts input_array2.uniq
puts input_array3.uniq

</solution>
</codeblock>
