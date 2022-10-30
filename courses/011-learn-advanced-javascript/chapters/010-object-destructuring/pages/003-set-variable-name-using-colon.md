We can use a colon, `:` to copy
any object property into
a variable with a different name.


<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

let {fullName: name, age, isAdmin: admin} = person;
console.log(`Hello everyone, I am ${name}. My admin status is: ${admin}`);
</code>
</Editor>

In this example, the `fullName`
property is copied into the `name`
variable and the `isAdmin` property is
copied into the `admin` variable.

The `age` property is copied
to the variable with the same name.