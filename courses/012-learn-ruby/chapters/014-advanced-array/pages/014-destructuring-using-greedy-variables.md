During destructuring,
adding a star before a
variable name makes that
variable greedy and
that variable takes up all
the remaining values.

<Editor lang="ruby">
<code>
array = [1,2,3]

a, *b = array
# a = 1
# b = [2,3]
</code>
</Editor>

In the case given above, variable `b`
takes up both the values
**2** & **3** and puts them in an array.