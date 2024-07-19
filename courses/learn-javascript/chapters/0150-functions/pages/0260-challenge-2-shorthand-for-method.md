Create a function named `getFullName`
that takes `firstName`
and
`lastName` as parameters.

This function should return the
full name by joining `firstName`
and
`lastName` values separated by a space.

Create an object named `userInformation`
using shorthand property that has the
following properties:
- `firstName`
- `lastName`
- `getFullName`

Finally, display the full name
of the user to the console.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const personFirstName = "Eve";
const personLastName = "Smith";
// Write code below
</code>

<solution>
const personFirstName = "Eve";
const personLastName = "Smith";
// Write code below
const getFullName = (firstName, lastName) => {
  return firstName + " " + lastName;
};

const userInformation = {
  personFirstName,
  personLastName,
  getFullName
};

console.log(
  userInformation.getFullName(userInformation.personFirstName, userInformation.personLastName)
);
</solution>
</codeblock>
