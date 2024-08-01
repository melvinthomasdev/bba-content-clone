In Ruby, there are situations where you need to convert data types to strings to perform certain operations, especially when working with numbers and arrays. Let’s explore this further.

## Converting Numbers to Strings

You will get an error
with the following code:

<codeblock language="ruby" type="lesson">
  <code>puts "Ruby is " + 24 + "years old now"</code>
</codeblock>

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

<codeblock language="ruby" type="lesson">
  <code>puts "Ruby is " + 24.to_s + " years old now"</code>
</codeblock>

## Converting Arrays to Strings

Arrays can also be converted to strings, especially when you want to print them in a readable format. Consider the following example:

<codeblock language="ruby" type="lesson">
<code>
array = [1, 2, 3, 4, 5, 6, 7, 8]

puts array
puts array.to_s

</code>
</codeblock>

Here, when we use `puts` directly on the array, it prints each element on a new line. But using `to_s` on these arrays ensures that, when we print them, the entire structure is shown in a single line as a string, making the output more readable and easy to understand.
