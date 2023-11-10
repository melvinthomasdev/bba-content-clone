In this exercise, split
the names of friends into
an array.

After the split, the array
should have only two items -
**John** and  **Annie**.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
friends = "John and Annie"

array = 

puts array
</code>

<solution>
friends = "John and Annie"

array = friends.split(" and ")

puts array
</solution>
</codeblock>