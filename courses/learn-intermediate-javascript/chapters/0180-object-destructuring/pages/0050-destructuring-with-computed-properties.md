Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  12: "Adam",
  13: "Samantha"
};

const keyName = 12;
const { [keyName]: twelfthPerson } = person;

console.log(twelfthPerson);
</code>
</codeblock>

In the example above,
we stored the key name of the property
we want to destructure in `keyName`.
Then we destructured the property
using the bracket notation.
`{ [keyName]: twelfthPerson } = person`
is same as writing
`{ 12: twelfthPerson } = person`.

Note that we renamed
the destructured property
because `12` is not a valid variable name.

Similarly, we can also destructure properties
using expressions,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  12: "Adam",
  13: "Samantha"
};

const { [3 * 4]: twelfthPerson } = person; // Same as { 12: twelfthPerson } = person

console.log(twelfthPerson);
</code>
</codeblock>