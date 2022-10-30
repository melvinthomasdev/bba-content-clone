We can use object destructuring
to extract the properties from
objects and arrays nested
inside an object.

In the example given below,
the object `person` has another
object `personalInfo` nested
inside it.

We are using the same structure
to extract the properties
from `personalInfo`.

<Editor lang="javascript">
<code>
let person = {
  personalInfo: {
    fullName: "Adam Smith",
    age: 37,
  },
  position: "Software Developer",
  isAdmin: true
};

let {
  personalInfo: {
    fullName,
    age
  },
  position,
  isAdmin
} = person

console.log(fullName);
console.log(age);
</code>
</Editor>