We can use `Object.fromEntries()` method
to create an object containing
all the properties of a map.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
  [{ name: "Oliver" }, "Property with object key"],
  [[ 1, 2, 3, 4 ], "Property with object key"]
]);

const objectWithRandomProps = Object.fromEntries(mapWithRandomProps);
console.log(objectWithRandomProps);
</code>
</codeblock>

In the example given above,
an object `objectWithRandomProps`
was created with all the key-value pairs
of the `mapWithRandomProps` map.
All the keys were converted into strings,
before adding them as a key in the object.

In the example above,
`mapWithRandomProps` has a key
which is an array `[ 1, 2, 3, 4 ]`.
In objectWithRandomProps,
that key is converted to `"1,2,3,4"`,
which is a string containing all the elements
separated by a comma.
All array keys behave the same way.

In the example above,
`mapWithRandomProps` has a key
which is an object `{ name: "Oliver" }`.
In `objectWithRandomProps`,
that key is converted to `"[object Object]"`.
All object keys behave the same way.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  [{ name: "Oliver" }, "Property with object key"],
  [{ age: 32 }, "Another property with object key"],
]);

const objectWithRandomProps = Object.fromEntries(mapWithRandomProps);
console.log(objectWithRandomProps);
</code>
</codeblock>

In the example give above,
`mapWithRandomProps` has two keys
that are of the object type.
Hence this is what happens
when the conversion from map
to object happens.

- The `{ name: "Oliver" }` key will be converted
  to `"[object Object]"`
  and
  added to `objectWithRandomProps`.
  So now,
  `objectWithRandomProps` contains the property -
  `"[object Object]": "Property with object key"`.

- The `{ age: 32 }` key will also be converted
  to `"[object Object]"`
  and
  added to `objectWithRandomProps`.
  But since a property with that key
  `"[object Object]"` was already added,
  it's value in `objectWithRandomProps`
  will be updated to `"Property with object key"`.
