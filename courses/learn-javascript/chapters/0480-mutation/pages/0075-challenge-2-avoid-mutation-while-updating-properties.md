Add a new property `country`
with the value `USA` to the
`user` object without mutating it
and
store it in a variable named
`updatedUser`.

Log the value of `updatedUser`
to the console.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const user = {
  name: "Sam Smith",
  age: 32,
  role: "Standard",
};

// Write code below this line
</code>

<solution>
const user = {
  name: "Sam Smith",
  age: 32,
  role: "Standard",
};

// Write code below this line
const updatedUser = { ...user, country: "USA" };

console.log(updatedUser);
</solution>
</codeblock>
