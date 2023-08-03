The `padStart()` method adds padding to a string
with another string until it reaches the required length.
It applies padding from the start of the string.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Sam".padStart(10, "*");
console.log(firstName);
</code>
</codeblock>

The method takes two arguments - **finalLength**
and
**paddingString**.
The first argument is the length of the resulting string
and
the second argument is the string used for padding.

In the example given above, we are padding
the string `"Sam"` with the **paddingString** `"*"`
until the length of the string reaches
the value given by **finalLength** `10`.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Oliver".padStart(3, "*");
console.log(firstName);
</code>
</codeblock>

In the example given above,
the value of **finalLength** `3` is
less than the length of the original string `6`.
Therefore, it returns the original string without padding.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Sam".padStart(5, "abcdefgh");
console.log(firstName);
</code>
</codeblock>

In the example given above,
since the length of the **paddingString** `"abcdefgh"`
is greater than
the value of **finalLength** `5`,
it only pads using the
left-most part of the **paddingString**.
The rest of the **paddingString** is skipped.

<codeblock language="javascript" type="lesson">
<code>
const firstName = "Sam".padStart(10);
console.log(firstName);
</code>
</codeblock>

In the example given above,
since we do not provide the **paddingString** argument,
it takes the default value `" "`.
