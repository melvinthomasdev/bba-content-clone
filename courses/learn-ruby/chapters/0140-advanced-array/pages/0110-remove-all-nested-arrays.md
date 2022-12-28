We have an array which
contains other arrays.
We want to keep all the
items of the arrays,
but we want to remove
all the arrays themselves.

Ruby provides `flatten`
to do this job.

<codeblock language="ruby" type="lesson">
<code>
array1 = [1, [2, 3, 4], 5, 6, [7,8]]

array2 = array1.flatten

puts array1
puts array2
</code>
</codeblock>

As we can see, **array2** only has numbers
and does not have any arrays.

`flatten` does not
change the original array.

**array1** still contains
the nested arrays.
