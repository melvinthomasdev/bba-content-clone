The `slice()` method is used to extract a part of a string.
It takes two arguments:

- **start-index** -
  The index of the string from which the substring is to be extracted.

- **end-position** -
  The index of the string up to which the substring is to be extracted.
  The character in this index won't be included in the substring.
  The default value of this argument is the length of the string.

<codeblock language="javascript" type="lesson">
<code>
const message = "My email is sam@example.com. Please send an invite to that email.";
const email = message.slice(12, 27);
console.log(email);
</code>
</codeblock>

In the example given above,
`message.slice(12, 27)`
extracts a substring starting from the index `12`
to the index `26`, from the value of `message`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam: My email is sam@example.com. Please send an invite to that email.";
const content = message.slice(5);
console.log(content);
</code>
</codeblock>

In the example given above,
`message.slice(5)`
extracts a substring starting from the index `5`
to the last index of the string `69`, from the value of `message`.

We can also pass negative values as the argument.
A negative value means the index is equal to
the length of the string minus the absolute value of that argument.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam: My email is sam@example.com. Please send an invite to that email.";
const content = message.slice(5, -7);
console.log(content);
</code>
</codeblock>

In the example given above,
`message.slice(5, -7)` is the same as writing,
`message.slice(5, message.length - 7)`.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam: My email is sam@example.com. Please send an invite to that email.";
const content = message.slice(5, message.length - 7);
console.log(content);
</code>
</codeblock>

Let's take a look at another example where
only the first argument is passed
and
it's a negative value.

<codeblock language="javascript" type="lesson">
<code>
const message = "Sam: My email is sam@example.com. Please send an invite to that email.";
const content = message.slice(-14);
console.log(content);
</code>
</codeblock>

In the example given above,
`message.slice(5)`
extracts a substring starting from the index equal to `message.length - 14` or `56`
to the last index of the string `69`, from the value of `message`.
