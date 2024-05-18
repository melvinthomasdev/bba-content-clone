Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  "full-name": "Sam Smith",
};

const user2 = null;

console.log(user1["full-name"]);
console.log(user2["full-name"]);
</code>
</codeblock>

The example given above,
throws an error because
`user2` does not have
the property `"full-name"`.

Optional chaining `?.` can also
be used to access a property
of an object using the bracket notation.

<codeblock language="javascript" type="lesson">
<code>
const user1 = {
  "full-name": "Sam Smith",
};

const user2 = null;

console.log(user1?.["full-name"]);
console.log(user2?.["full-name"]);
</code>
</codeblock>

In the example given above:

- `user1?.["full-name"]` accesses the
  `"full-name"` property of `user1`
  only if `user1` is not `null` or `undefined`.
  Since, `user1` is not `null` or `undefined`,
  it is displayed.

- `user2?.["full-name"]` accesses the
  `"full-name"` property of `user2`
  only if `user2` is not `null` or `undefined`.
  Since, `user2` is `null`,
  `undefined` is displayed.
