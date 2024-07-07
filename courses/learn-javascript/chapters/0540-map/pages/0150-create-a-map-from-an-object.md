We can use the `Object.entries()` method
to create a `Map` that contains
all the properties of an object.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "Sam Smith",
  age: 32,
}

const userMap = new Map(Object.entries(user));

console.log(user);
console.log(userMap);
</code>
</codeblock>

We cannot pass an object directly into `new Map()`,
to create a map containing all the properties of that object.
`new Map()` only accepts an iterable,
like an array.
Since an object is not iterable,
we create an array of all the key-value pairs of the object,
using the `Object.entries` method
and
pass that to `new Map()`.
