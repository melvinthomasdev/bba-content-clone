`undefined` is a data type in JavaScript.

<codeblock language="javascript" type="lesson">
<code>
const name = undefined;
console.log(name);
</code>
</codeblock>

A variable declared using `let`,
whose value hasn't
been assigned yet,
has `undefined` as
its default value.

<codeblock language="javascript" type="lesson">
<code>
let name = "Oliver";
console.log(name);

let age;
console.log(age);
</code>
</codeblock>

In the above example, `name`
is assigned a value **"Oliver"**
and hence `console.log(name)`
displays `"Oliver"`.

However, `age` does not have
any value assigned to it.
That is why `console.log(age)`
displays `undefined`,
which is the default value.

Note that a variable
declared using `const`
should always have a value
assigned to it.
It won't get
automatically assigned
with `undefined`
if no value is
given during declaration.
If we don't provide any value,
then we'll get a **Syntax Error**
like in the following example.

<codeblock language="javascript" type="lesson">
<code>
const age;
console.log(age);
</code>
</codeblock>