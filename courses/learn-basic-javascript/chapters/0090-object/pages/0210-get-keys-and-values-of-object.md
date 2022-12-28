We can get all the **key-value pairs**
of an object using `Object.entries()`.
It returns the key-value pairs
as an array of arrays.

Consider the example given below:

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

console.log(Object.entries(person));
</code>
</codeblock>

In the example given above:

- `Object.entries(person)`
  returns an array in which
  all the elements are also arrays.
  In other words, `Object.entries(person)`
  returns an array with many
  arrays nested in it.

- Each nested array contains
  the key and the value of
  a property of `person`,
  in that same order.
  The keys will be strings.

- Since the first property of `person`
  is `fullName: "Adam Smith"`,
  the first nested array
  contains the elements -
  `"fullName"` and `"Adam Smith"`.
