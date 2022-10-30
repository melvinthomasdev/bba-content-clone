We can use the `Object.assign` method to
also add a property while cloning an object.
If the property name already exists,
it gets overwritten.

In the example given below,
the value of the `age` property
in the `user` object gets
overwritten to `45`.

<Editor lang="javascript">
<code>
let user = {
  name: "Sam",
  age: 32
};
Object.assign(user, { age: 45 });
console.log(user);
</code>
</Editor>