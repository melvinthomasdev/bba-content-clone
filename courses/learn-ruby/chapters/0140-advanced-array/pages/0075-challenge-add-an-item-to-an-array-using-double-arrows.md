In the code given below, add the second array
to the first array using double
arrows.

Display the modified first array on the screen.

```ruby
Input:
array1 = ["cat", "dog"]
array2 = ["fish", "bird"]

Expected Output:
"cat"
"dog"
"fish"
"bird"
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
array1 = [1, 2, 3]
array2 = [4, 5, 6]

elements1 = ["a", "b"]
elements2 = ["c", "d", "e"]

# Write code below this line

# Write code above this line
</code>
<solution>
array1 = [1, 2, 3]
array2 = [4, 5, 6]

elements1 = ["a", "b"]
elements2 = ["c", "d", "e"]

# Write code below this line

puts array1 << array2
puts elements1<< elements2
# Write code above this line
</solution>
</codeblock>
