You will get an error
with the following code:

<Editor lang="ruby">
<code>
puts "Ruby is " + 24 + "years old now"
</code>
</Editor>

The error message says,
`no implicit conversion of Integer into String`.

In simple English, Ruby is saying
that we cannot add an
integer with a string.

This makes sense.
We should be able to add two numbers.
We should be able to add two strings.
However, we should **not** be allowed
to add a string and a number.

To solve this problem, we need to convert
the integer into a string.
Ruby provides the `to_s` method
to convert an integer to string.
`to_s` stands for "to string".
Let's use `to_s` on 24 to make it a string.

<Editor lang="ruby">
<code>
puts "Ruby is " + 24.to_s + " years old now"
</code>
</Editor>