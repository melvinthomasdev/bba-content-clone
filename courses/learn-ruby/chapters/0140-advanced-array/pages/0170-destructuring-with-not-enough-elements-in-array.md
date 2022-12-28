Look at the following code:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3]
a, b, c, d, e = array
# a = 1; b = 2; c = 3; d = nil; e = nil
puts "a is #{a}"
puts "b is #{b}"
puts "c is #{c}"
puts "d is #{d}"
puts "e is #{e}"
</code>
</codeblock>

If there are not enough
values for variables,
then the variables who did
not get any value are assigned
`nil` value by Ruby.

If a variable is using `*`,
then it always get an array.

If there is no value for
the greedy variable,
then the final result
is an empty array:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3]
a, b, c, *d = array
# a = 1; b = 2; c = 3; d = []
</code>
</codeblock>