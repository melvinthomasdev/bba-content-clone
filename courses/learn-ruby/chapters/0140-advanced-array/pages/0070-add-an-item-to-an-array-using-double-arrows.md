In the earlier lesson, we saw
that we can add values to an array
by using `push`.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,2,3,4]
numbers.push(5)
puts numbers
</code>
</codeblock>

Instead of using `push`, we can
also use `<<` to add to an array.
Here are some examples:

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,2,3,4]
numbers << 5
puts numbers
</code>
</codeblock>

We can also add another
array to an array.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,2,3,4]
numbers << [5,6]
puts numbers
</code>
</codeblock>