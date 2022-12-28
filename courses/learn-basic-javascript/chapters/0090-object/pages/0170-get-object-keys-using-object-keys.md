We can get all the **keys**
of an object using `Object.keys()`.
It returns the keys
as an array of strings.

In the example given below,
we are getting all the **keys**
stored in the `person` object.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

console.log(Object.keys(person));
</code>
</codeblock>