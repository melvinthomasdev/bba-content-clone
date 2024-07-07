Store a copy of the `user` object
in `updatedUser` after
updating the value of
the `role` property to **"Admin"**.

Note the that `user` object
should not be mutated.

For example:
```js
Input: user = {
  name: "Linh Tran",
  age: 28,
  role: "Basic",
}
Output:
{
  name: "Linh Tran",
  age: 28,
  role: "Basic",
}
{
  name: "Linh Tran",
  age: 28,
  role: "Admin",
}
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const user = {
  name: "Sam Smith",
  age: 32,
  role: "Standard",
};

const updatedUser = ;

console.log(user);
console.log(updatedUser);
</code>

<solution>
const user = {
  name: "Sam Smith",
  age: 32,
  role: "Standard",
};

const updatedUser = { ...user, role: "Admin" };

console.log(user);
console.log(updatedUser);
</solution>
</codeblock>
