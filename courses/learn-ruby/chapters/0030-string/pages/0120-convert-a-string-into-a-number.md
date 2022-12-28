**12** is a number.
However **"12"** is not a number,
because it is in quotes and
that makes it a string.
If we try to add a number
to a string, then we will get an error.

<codeblock language="ruby" type="lesson">
<code>
# We will get error here
puts "12" + 2
</code>
</codeblock>

If we want to convert a string
into an integer, then we need
to use the `to_i` method.
`to_i` is a short form for **to integer**.

Let's fix the last example
by using `to_i`.

<codeblock language="ruby" type="lesson">
<code>
puts "12".to_i + 2
</code>
</codeblock>