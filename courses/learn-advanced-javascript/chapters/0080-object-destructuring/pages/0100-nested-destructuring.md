It is possible to destructure
objects and arrays that are nested
inside an object or an array.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
  contactInfo: {
    email: "adam@example.com",
    phone: "911234567890",
  }
}

const { contactInfo: { email } } = user;
console.log(email);
</code>
</codeblock>

In the example given above,
we destructure not just the `user` object,
but also the nested `contactInfo` object
to obtain the value of
the property `user.contactInfo.email`
and
store it in a variable `email`.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Adam Smith",
  emails: [
    "adam@example.com",
    "adam@personalmail.com",
  ],
}

const { emails: [ primaryEmail ] } = user;
console.log(primaryEmail);
</code>
</codeblock>

In the example given above,
we destructure not just the `user` object,
but also the `emails` property
to obtain the first element of `user.emails`
and
store it in a variable `primaryEmail`.

<codeblock language="javascript" type="lesson">
<code>
const teamMembers = [
  { name: "Adam Smith", age: 32 },
  { name: "Sam Smith", age: 23 },
]

const [{ name: firstPersonName }, { name: secondPersonName }] = teamMembers;
console.log(firstPersonName);
console.log(secondPersonName);
</code>
</codeblock>

In the example given above,
we destructured the `teamMembers` array,
and store the values of the `name` properties
of both the elements of the array
and
in the variables
`firstPersonName` and `secondPersonName`,
respectively.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [
  [1, 3, 5, 7],
  [2, 4, 6, 8],
]

const [[oddNumber], [evenNumber]] = numbers;
console.log(oddNumber);
console.log(evenNumber);
</code>
</codeblock>

In the example given above,
we destructured the `numbers` array,
as well as the
two arrays nested inside `numbers`.
The first elements of both the nested arrays
are stored in the variables
`oddNumber` and `evenNumber`,
respectively.
