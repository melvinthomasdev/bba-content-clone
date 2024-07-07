The `padEnd()` method adds padding to a string
with another string until it reaches the given length.
This method applies padding to the end of the string.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Oliver".padEnd(10, "#");
console.log(firstName);
</code>
</codeblock>

This method accepts two arguments - **finalLength**
and
**paddingString**.
The first argument is the length of the resulting string
and
the second argument is the string used for padding.

In the example given above,
we are padding the string `"Oliver"`
with the **paddingString** `"#"`
until the length of the string
reaches the value given by **finalLength** `10`.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Oliver".padEnd(4, "#");
console.log(firstName);
</code>
</codeblock>

In the example given above,
the value of **finalLength** `4` is
less than the length of the original string.
Therefore,
it returns the original string without padding.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "OLIVER".padEnd(12, "abcdefghij");
console.log(firstName);
</code>
</codeblock>

In the example given above,
since the length of **paddingString** `"abcdefghij"`
is greater than
the value of the **finalLength** `12`,
it only pads using the left-most part.
The rest of the **paddingString** is skipped.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Sam".padEnd(10);
console.log(firstName);
</code>
</codeblock>

In the example given above,
since we do not provide the **paddingString** argument,
it takes the default value `" "`.
