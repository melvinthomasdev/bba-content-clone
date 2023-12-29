The `startsWith()` method
returns `true` if
a string starts with
the given **substring**
and
returns `false` otherwise.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam: I love mangoes.";
const isSentBySam = message.startsWith("Sam: ");
console.log(isSentBySam);
</code>
</codeblock>

In the example given above,
`"Sam loves mangoes."` starts
with the substring `"Sam: "`,
hence `message.startsWith("Sam: ")`
returns `true`.
