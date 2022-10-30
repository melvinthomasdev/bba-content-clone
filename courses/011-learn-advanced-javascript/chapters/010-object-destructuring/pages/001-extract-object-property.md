Object destructuring allows us to
extract properties of objects
and
copy them into variables.

In the example given below,
the object **person** stores many properties.
We extract the **age** property
from the object and put it in
a variable named **age**.

<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

let {age} = person;
console.log(`Adam's age is ${age}`);
</code>
</Editor>

We can extract
multiple properties from
an object at the same time:

<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

let {fullName, age, isAdmin} = person;
console.log(`${fullName} is ${age} years old. Is he an admin? ${isAdmin}.`);
</code>
</Editor>