The `padEnd()` method also adds padding to a string
with another string until it reaches the given length.
The method applies padding from the end of the string.

<Editor lang="javascript">
<code>
let myString = "Oliver".padEnd(10, "#");
console.log(myString);
</code>
</Editor>

This method also accepts two arguments - **finalLength**
and
**paddingString**.
The first argument gives the length of the resulting string
and
the second argument gives the string used for padding.

In the example given above, we are padding
the string `Oliver` with the **paddingString** `#`
until the length of `Oliver` reaches the value given by **finalLength** i.e. `10`.

<Editor lang="javascript">
<code>
let myString = "Oliver".padEnd(4, "#");
console.log(myString);
</code>
</Editor>

In the example given above,
the value of **finalLength** is
less than the length of the original string.
Therefore, it returns the original string without padding.

<Editor lang="javascript">
<code>
let myString = "OLIVER".padEnd(12, "abcdefghij");
console.log(myString);
</code>
</Editor>

In the example given above,
since the length of **paddingString** is greater than
the value of **finalLength**,  it only pads the left-most part. The rest of the **paddingString** is skipped.

<Editor lang="javascript">
<code>
let myString = "Sam".padEnd(10);
console.log(myString);
</code>
</Editor>

In the example given above,
since we do not provide the **paddingString** argument, it takes the default value `" "`.