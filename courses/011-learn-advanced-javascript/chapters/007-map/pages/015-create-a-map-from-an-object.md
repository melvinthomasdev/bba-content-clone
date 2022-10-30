We can use the `Object.entries()` method
to create a `Map` from an object.

<Editor lang="javascript">
<code>
let myObject = {
  name: "Sam Smith",
  age: 32
}
let myMap = new Map(Object.entries(myObject));
console.log(myObject);
console.log(myMap);
</code>
</Editor>

We cannot just pass an object directly into
`new Map()`. It needs a data that is iterable, like
an array. An object is not iterable, so we create
an array of all the properties of the object, using
`Object.entries` and then pass this in the
`new Map()`.