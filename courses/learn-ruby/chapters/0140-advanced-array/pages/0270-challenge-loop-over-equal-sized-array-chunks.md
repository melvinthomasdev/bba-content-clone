Write a program to calculate the sum of elements in
each slice of an array. Use the `each_slice` method to
iterate over the array in groups of 3.

Display the results as follows:
```
Slice 1: Sum = 60
Slice 2: Sum = 150
Slice 3: Sum = 240
```

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90]
# Write your code here
</code>

<solution>
numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90]

numbers.each_slice(3).with_index(1) do |slice, slice_number|
  sum = slice.sum
  puts "Slice #{slice_number}: Sum = #{sum}"
end
</solution>
</codeblock>
