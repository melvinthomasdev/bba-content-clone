While destructuring, if the number of properties
in the object is more than
the number of variables,
the extra elements are simply
omitted.

In the example given below,
the object has **three**
properties, but we have
only two variables to store
them. The third property is omitted.

<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

let {fullName, age} = person;
console.log(fullName);
console.log(age);
</code>
</Editor>

If we want a way to include the
rest of the properties in a
variable, we can use the
**rest pattern**.

The rest pattern has three dots `...`
which are used as a prefix before
a variable, like `...everythingElse`.

In the example given below,
we are using one variable
to store the first property.

The second and the third properties
are stored in the `...otherProperties` variable.

<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

let {fullName, ...otherProperties} = person;
console.log(otherProperties.age);
console.log(otherProperties.isAdmin);
</code>
</Editor>