Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  name: "Adam Smith",
  email: "adam@example.com",
  phone: "911234567890"
};

const { name, ...contactInfo } = person;
console.log(name);
console.log(contactInfo);
</code>
</codeblock>

In the example given above,
we are storing the value of `person.name`
in the variable `name`.
The remaining properties are stored
in the `contactInfo` variable,
using the rest operator - `...`,
i.e., three dots.

The rest operator must always
come last.
Otherwise it will cause an error.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  name: "Adam Smith",
  email: "adam@example.com",
  phone: "911234567890"
};

const { ...contactInfo, name } = person;
console.log(name);
console.log(contactInfo);
</code>
</codeblock>