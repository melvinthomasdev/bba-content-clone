The NOT operator - `!`,
when applied to a value or expression
returns `false` if the
condition evaluates to `true`
and
returns `true` if the
condition evaluates to `false`.

For example,
let's say we have
an object `user`
with two properties -
`name` and `isAdmin`.
Let's say we need to display
**"You do not have access to this feature"**,
if the value of `user.isAdmin`
is `false`.
The following example
shows how to use
the `!` operator
to perform this check:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Oliver Smith",
  isAdmin: false,
};

if (!user.isAdmin) {
  console.log("You do not have access to this feature");
}
</code>
</codeblock>

In the example given above,
`user.isAdmin` is `false`
and
the condition `!user.isAdmin`
returns `true`.
If the value of `user.isAdmin`
was `true`,
then the condition `!user.isAdmin`
would result in `false`.
This can be represented by a table
as shown below.

| user.isAdmin | Result |
| ------------ | ------ |
| true         | false  |
| false        | true   |

In general,
the condition `!user.isAdmin`
returns `true`
if the value of
`user.isAdmin` is **falsy**
and
returns `false`
if the value of
`user.isAdmin` is **truthy**.
The condition `!user.isAdmin`
is equivalent to
`user.isAdmin === false`.

The condition `!user.name`,
can be used to check if
`user.name` has a value,
i.e., the value is **truthy**.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "",
  isAdmin: false,
};

if (!user.name) {
  console.log("Invalid user name");
}

if (!user.isAdmin) {
  console.log("You do not have access to this feature");
}
</code>
</codeblock>

In the above example,
since `user.name`
having the value
`""`
is **falsy**,
`!user.name` results in `true`.
That is why we get the output
**"Invalid user name"**.
