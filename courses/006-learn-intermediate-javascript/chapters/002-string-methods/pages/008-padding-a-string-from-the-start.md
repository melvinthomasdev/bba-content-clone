The `padStart()` method adds padding to a string
with another string until it reaches the required length.
It applies padding from the start of the string.

<Editor lang="javascript">
<code>
let myString = "Sam".padStart(10, "*");
console.log(myString);
</code>
</Editor>

The method takes two arguments - **finalLength**
and
**paddingString**.
The first argument is the length of the resulting string
and
the second argument is the string used for padding.

In the example given above, we are padding
the string `Sam` with the **paddingString** `*`
until the length of `Sam` reaches the value given by **finalLength** i.e. `10`.

<Editor lang="javascript">
<code>
let myString = "Hello".padStart(3, "*");
console.log(myString);
</code>
</Editor>

In the example given above,
the value of **finalLength** is
less than the length of the original string.
Therefore, it returns the original string without padding.

<Editor lang="javascript">
<code>
let myString = "Sam".padStart(5, "abcdefgh");
console.log(myString);
</code>
</Editor>

In the example given above,
since the length of **paddingString** is greater than
the value of **finalLength**,  it only pads the left-most part. The rest of the **paddingString** is skipped.

<Editor lang="javascript">
<code>
let myString = "Sam".padStart(10);
console.log(myString);
</code>
</Editor>


In the example given above,
since we do not provide the **paddingString** argument,
it takes the default value `" "`.