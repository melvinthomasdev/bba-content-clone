The Nullish Coalescing operator, denoted as `??`,
returns the left-hand operand
provided that the left-hand operand
is not `null` or `undefined`.
Otherwise, it returns the right-hand operand.

<codeblock language="javascript" type="lesson">
<code>
console.log("Hello Sam Smith" ?? "Hello Guest");

console.log(null ?? "Hello Guest");

console.log(undefined ?? "Hello Guest");

console.log(0 ?? 234);

console.log(false ?? true);

console.log(undefined ?? null);

console.log(null ?? null);
</code>
</codeblock>

In the example given above:

- `"Hello Sam Smith" ?? "Hello Guest"`
  returns the left-hand operand - `"Hello Sam Smith"`
  because it is neither `null` nor `undefined`.

- `null ?? "Hello Guest"`
  returns the right-hand operand - `"Hello Guest"`
  because the left-hand operand is `null`.

- `undefined ?? "Hello Guest"`
  returns the right-hand operand - `"Hello Guest"`
  because the left-hand operand is `undefined`.

- `0 ?? 234`
  returns the left-hand operand - `0`
  because it is neither `null` nor `undefined`.

- `false ?? true`
  returns the left-hand operand - `false`
  because it is neither `null` nor `undefined`.

- `undefined ?? null`
  returns the right-hand operand - `null`
  because the left-hand operand is `undefined`.

- `null ?? null`
  returns the right-hand operand - `null`
  because the left-hand operand is `null`.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  name: "Sam Smith",
  age: 32,
  role: "Admin",
};
console.log(`${user1.name} is a ${user1.role} user.`);

const user2 = {
  name: "Oliver Smith",
  age: 32,
};
console.log(`${user2.name} is a ${user2.role} user.`);
</code>
</codeblock>

In the above example,
since `user1.role`
is neither `undefined` nor `null`,
we get a proper output -
**"Sam Smith is a Admin user."**
However, `user2.role` is `undefined`.
Hence, we get an unwanted output -
**"Oliver Smith is a undefined user."**

Let's say the default value of
the role property should be **"Standard"**.
We can rewrite the example given above
to make use of the `??` operator,
to display the default value
if the `role` property is `undefined` or `null`:

<codeblock language="javascript" type="lesson">
<code>
const defaultRole = "Standard";

const user1 = {
  name: "Sam Smith",
  age: 32,
  role: "Admin",
};
console.log(`${user1.name} is a ${user1.role ?? defaultRole} user.`);

const user2 = {
  name: "Oliver Smith",
  age: 32,
};
console.log(`${user2.name} is a ${user2.role ?? defaultRole} user.`);
</code>
</codeblock>

In the example given above,
since `user1.role` is neither
`undefined` nor `null`,
we see the value **"Admin"** in the output -
**"Sam Smith is a Admin user."**.
Since `user2.role` is `undefined`,
we see the default value **"Standard"**
in the output -
**"Oliver Smith is a Standard user."**.
