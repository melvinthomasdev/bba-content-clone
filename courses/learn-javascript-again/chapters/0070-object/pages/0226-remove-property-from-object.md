Use `delete` to remove a property 
from an object.

Take a look at an example:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Sam Smith",
  age: 37,
  isAdmin: true
};

delete person.age;
delete person[`isAdmin`];
console.log(person);
</code>
</codeblock>

You can see that we can use 
`delete` with both the dot notation 
as well as the bracket notation.
