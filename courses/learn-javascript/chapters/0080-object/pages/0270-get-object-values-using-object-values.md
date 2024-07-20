We can get all the **values**
of an object using `Object.values()`.
It returns the values
as an array of different types.

In the example given below,
we are getting all the **values**
stored in the `person` object.

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

const result = Object.values(person);
console.log(result);
</code>
</codeblock>