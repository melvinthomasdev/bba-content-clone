We can get all the **values**
of an object using `Object.values()`.
It returns the values
as an array

In the example given below,
we are getting all the **values**
stored in the `person` object.

<Editor lang="javascript">
<code>
let person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true  
};

console.log(Object.values(person));
</code>
</Editor>