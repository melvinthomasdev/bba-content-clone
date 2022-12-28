If an object has nested objects,
cloning the object
using the spread operator
might lead to unwanted outputs.
Consider the following examples:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: {
    firstName: "Sam",
    lastName: "Smith"
  },
  age: 32
};

const userClone = { ...user };

userClone.name.firstName = "Oliver";
console.log(user.name);
console.log(userClone.name);
</code>
</codeblock>

Here, changing the `userClone.name.firstName` property
also changes it in the `user.name.firstName` property.
This is because, the `name` property
of both `user` and `userClone`
hold the same address.
In other words,
`user.name` is a shallow clone
of `userClone.name`.

This means that,
when we use the `...` operator
to create a clone of an object,
any nested objects will be shallow cloned.

If we don't want our cloned object to contain
shallow clones of the nested objects,
we need to use a different
approach for cloning:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: {
    firstName: "Sam",
    lastName: "Smith"
  },
  age: 32
};

const userClone = JSON.parse(JSON.stringify(user));

userClone.name.firstName = "Oliver";
console.log(user.name);
console.log(userClone.name);
</code>
</codeblock>

In the example given above:

The `JSON.stringify(user)` converts
`user` object into a JSON string.
Then, the `JSON.parse` converts
that JSON string back into an object.

Now, when we make a change to the
`userClone.name.firstName` property,
the change does not affect
the `user.name.firstName` property.
