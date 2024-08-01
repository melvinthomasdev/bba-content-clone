In the code given below, we
have four arrays.
Using double arrows, add **array2** to
**array1**. Similarly, using double
arrows, add **elements2** array to
**elements1** array.

Display the updated **array1** and
**elements1** arrays on the screen,
in that order.

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
# Write your code here
</code>
<solution>
array1 = [1, 2, 3]
array2 = [4, 5, 6]

elements1 = ["a", "b"]
elements2 = ["c", "d", "e"]

array1 << array2
elements1 << elements2

puts array1
puts elements1
</solution>
</codeblock>
