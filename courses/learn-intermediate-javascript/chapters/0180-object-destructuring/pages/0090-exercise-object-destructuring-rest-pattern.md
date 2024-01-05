In the following code,
the object `user` contains
all the information on a user.
Destructure the object `user`
to store the values of the properties
`dateOfBirth` and `phoneNumber`
in separate variables,
and
the other properties in
another object `publicInfo`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const user = {
  email: "sam@example.com",
  name: "Sam Smith",
  age: 32,
  dateOfBirth: "01/01/2000",
  phoneNumber: "911234567890",
}

console.log(publicInfo);
</code>

<solution>
const user = {
  email: "sam@example.com",
  name: "Sam Smith",
  age: 32,
  dateOfBirth: "01/01/2000",
  phoneNumber: "911234567890",
}

const { dateOfBirth, phoneNumber, ...publicInfo } = user;
console.log(publicInfo);
</solution>
</codeblock>