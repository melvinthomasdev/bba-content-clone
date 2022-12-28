We have an array and we
want to double each of the numbers
that it holds.
It can be done like this:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3,4,5]

array2 = []
array.each do |item|
  array2.push(item * 2)
end

puts array2
</code>
</codeblock>

Let's assume that someone made a mistake
and put that `array2` inside the `do end` block
as shown below:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3,4,5]

array.each do |item|
  array2 = []
  array2.push(item * 2)
end

puts array2
</code>
</codeblock>

If we run the above code,
we will get an error. Why?

We are getting an error
because the variable `array2`
is declared inside
the `do end` block.

A variable that is born inside a `do end` block
is not visible outside of the `do end` block.

It means a variable has a scope.
If we try to access a variable
outside of its scope,
then we will get an error.

If a variable is born inside
a `do end` block, then that variable's
scope is limited to that `do end` block.
Outside of that `do end`
block, no one knows about that variable.

So how do we fix the previous error?
We need to take variable `array2` outside
of the `do end` block as shown below:

<codeblock language="ruby" type="lesson">
<code>
array = [1,2,3,4,5]

array2 = []
array.each do |item|
  array2.push(item * 2)
end

puts array2
</code>
</codeblock>