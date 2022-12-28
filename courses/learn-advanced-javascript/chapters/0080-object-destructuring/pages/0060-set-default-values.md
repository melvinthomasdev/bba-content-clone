Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
};

const { name, email } = user;

console.log(`Contact ${name} via ${email}`);
</code>
</codeblock>

In the example above,
we destructured the object `user`
to copy the values of the properties
`name` and `email`.
The variable `name` is assigned
the value `"Adam Smith"`.
Since the `user` object
does not have an `email` property,
the `email` variable is `undefiend`.
That is why we get `"undefined"`
in the output.

To prevent such undesired outputs,
we can assign a default value
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
};

const { name, email = "hello@example.com" } = user;

console.log(`Contact ${name} via ${email}`);
</code>
</codeblock>

In the example above,
the variable `name` is assigned
the value `"Adam Smith"`
and
since the `user` object
does not have an `email` property,
the `email` variable is assigned
its default value `"hello@example.com"`.

We can have default values for
variables whose names are specified
while destructuring,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
};

const { name, email: emailAddress = "hello@example.com" } = user;

console.log(`Contact ${name} via ${emailAddress}`);
</code>
</codeblock>