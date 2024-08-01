We have an array
and
we need to print the
double of each item
in this array.

We can do this in so
many ways.

First let's see how we do this
with the `for` loop. There are
two different ways that we can
use:

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,4,8,9,41]

for i in 0...numbers.size do
  puts numbers[i]*2
end
</code>
</codeblock>

We can also use the **for loop**
a bit differently as shown below:

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,4,8,9,41]

for number in numbers do
  puts number*2
end
</code>
</codeblock>

## Using each is the best way

In JavaScript and some
other programming languages,
**for loops** are used a lot.
However, in Ruby the most
preferred way of iterating
through items in an
array is by using `each`.

<codeblock language="ruby" type="lesson">
<code>
numbers = [1,4,8,9,41]

numbers.each do |number|
  puts number*2
end
</code>
</codeblock>

You can see that this is a
simpler approach to achieving
the same result.