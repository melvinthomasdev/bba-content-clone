We can store default values
for the destructuring using `=`.

These default values are used
only if the value we are looking
for is missing in the object.


<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
};

let {fullName, age = 20} = person;

console.log(fullName);
console.log(age);
</code>
</Editor>

In the example, we store the
default value `20` in the
`age` variable.
Since the `age` property is
missing in the `person`
object, the default value is used.