It's hard to read a
big number sometimes.
We can't use a comma,
since it's a number.

<codeblock language="ruby" type="lesson">
<code>
num1 = 1867496675
num2 = 186_749_6675

puts num1
puts num2
</code>
</codeblock>

Ruby allows us to use an
underscore to make it
easier to understand
big numbers.

We are allowed to put an
underscore anywhere in a
number. Ruby ignores all
underscores in a number.

<codeblock language="ruby" type="lesson">
<code>
num1 = 100_0
num2 = 10_00
num3 = 1_000

puts num1 + num2 + num3
</code>
</codeblock>