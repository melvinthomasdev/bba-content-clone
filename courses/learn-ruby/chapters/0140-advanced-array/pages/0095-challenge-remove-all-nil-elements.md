We have three arrays. Remove the 'nil' 
elements from each of these arrays. Also, 
display these arrays on the screen.

For example:
```ruby
Input:
input_array = [1, nil, 2, nil, 3, 4, nil, 5]

Output:
[1, 2, 3, 4, 5]
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
input_array1 = [1, nil, 2, nil, 3, 4, nil, 5]
input_array2 = [nil, nil, nil, 10, 20, 30]
input_array3 = [nil, "hello", nil, "world", nil]

# Write code below this line

# Write code above this line
</code>
<solution>
input_array1 = [1, nil, 2, nil, 3, 4, nil, 5]
input_array2 = [nil, nil, nil, 10, 20, 30]
input_array3 = [nil, "hello", nil, "world", nil]

# Write code below this line
puts input_array1.compact
puts input_array2.compact
puts input_array3.compact

# Write code above this line
</solution>
</codeblock>
