Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user1 = { name: "Sam" };
const user2 = { name: "Sam" };

console.log(user1 === user2);
</code>
</codeblock>

In the example given above,
both `user1` and `user2`
store the same key-value pairs -
`{ name: "Sam" }`.
But they are not equal.
This is because:

- `const user1 = { name: "Sam" }`
  stores `{ name: "Sam" }` in
  a memory location
  and
  assigns the address of that
  memory location to `user1`.

- `const user2 = { name: "Sam" }`
  stores `{ name: "Sam" }` in
  a different memory location
  and
  assigns the address of that
  memory location to `user2`.

- So the address stored in `user1`
  is different from
  the address stored in `user2`.
  That is why `user1 === user2` is `false`.

Now, look at this example:

<codeblock language="javascript" type="lesson">
<code>
const user1 = { name: "Sam" };
const user2 = user1;

console.log(user1 === user2);
</code>
</codeblock>

In the example given above,
the variables `user1` and `user2`
hold the address to the same memory location.
So, when we compare them,
we have the same address
in both the variables.
This is why `user1 === user2` is `true`.
