During destructuring,
adding a star before a
variable name makes that
variable greedy and
that variable takes up all
the remaining values.

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3]

a, *b = array

# b = [2,3]
# a = 1


puts b
puts a
</code>
</codeblock>

In the case given above, variable `b`
takes up both the values
**2**
and
**3**
and
puts them in an array.
