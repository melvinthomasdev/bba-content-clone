We have an object `user`.
Remove the `email`
and
`country` properties from the object.

Log the resulting `user` to the console.
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
let user = {
  name: "Sam",
  age: 25,
  email: "sam@example.com",
  country: "USA"
};

// Write your code below this line
</code>
<solution>
let user = {
  name: "Sam",
  age: 25,
  email: "sam@example.com",
  country: "USA"
};

// Write your code below this line
delete user.email;
delete user.country;

console.log(user);
</solution>
</codeblock>
