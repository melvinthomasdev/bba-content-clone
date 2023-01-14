We can identify the type of any data,
using `typeof`.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
console.log(typeof "Hello World!");
</code>
</codeblock>

In the example given above,
we get the output **"String"**
because the data - `"Hello World"`
is of the type String.

Let's take a look at the results
we get when we use `typeof`
with other data types:

<codeblock language="javascript" type="lesson">
<code>
console.log(typeof 12345);
console.log(typeof 12.345);
console.log(typeof true);
console.log(typeof undefined);
</code>
</codeblock>

In the example given above,
we get the data types
of the corresponding data
in the output.

We also can use `typeof` to
find the data type of the value
stored in a variable.

<codeblock language="javascript" type="lesson">
<code>
const count = 12;
console.log(typeof count);

const isAdmin = true;
console.log(typeof isAdmin);

const user = { name: "Sam Smith", age: 32 };
console.log(typeof user);

let name ;
console.log(typeof name);
</code>
</codeblock>

In the above example,
we get the data type of
the values stored in
all the variables.
`typeof name` returns `undefined`
because we did not
assign any value to `name`.
