Use a `for...in` loop to show
all the **values** stored
in each property
of the `person` object.

Use `console.log` to print the output.

<Editor lang="javascript" type="exercise">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true  
};
</code>

<solution>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true  
};

for (let property in person) {
  console.log(person[property]);
}
</solution>
</Editor>