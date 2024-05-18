We can join two strings using the `concat` method.
It does not change the existing strings.

<codeblock language="javascript" type="lesson">
<code>
const firstWord = "Big";
const secondWord = "Binary";

const orgName = firstWord.concat(secondWord);
console.log(orgName);
</code>
</codeblock>

In the example given above,
the `concat()` method returns the values of
`firstWord` and `secondWord` combined,
in that same order.

Note: The preferred way to join strings is **string interpolation**.

<codeblock language="javascript" type="lesson">
<code>
const firstWord = "Big";
const secondWord = "Binary";

const orgName = `${firstWord}${secondWord}`;
console.log(orgName);
</code>
</codeblock>