The working of the `if` statement
depends on whether
an expression evaluates to
`true` or `false`.

The values such as
number `0`,
`false`,
`null`,
`undefined`,
`NaN`,
the empty string `""`
and
the BigInt `0n`
evaluates to `false`.
These values are called
**falsy** values.

Don't try to understand *BigInt* right
now. We're not going to use it for a long
time. We will talk about it when we
really need to use it.

<Editor lang="javascript">
<code>
let storeValue = "";
if(storeValue) {
  console.log(`This message is not visible.`);
} else {
  console.log(`Success!`);
}
</code>
</Editor>

In the example given above,
you can replace the empty string `""`
with any other **falsy** value
and
get the same output.

All the values except
the **falsy** values
are **truthy** values.

<Editor lang="javascript">
<code>
let storeValue = true;
if(storeValue) {
  console.log(`The variable stores true!`);
} else {
  console.log(`You won't see this message!`);
}
</code>
</Editor>