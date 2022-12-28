Maps, just like object,
can be used to store data
as key-value pairs.
But they have a few differences:

- The keys of an object can only be
  of the type string, number or symbol.
  Whereas, the keys of a Map can be
  of any type.

- Map is an iterable data type.
  Object is not iterable.

- Map remembers the order in which
  each key-value pair was inserted.
  Objects do not.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"]
]);

console.log(mapWithRandomProps);
</code>
</codeblock>

In the example given above,
we created a new map using
the `new Map()` constructor.
We pass an array of key-value pairs
as argument to `new Map()`.
In the example given above,
we only pass one key-value pair,
i.e., `["name", "Sam Smith"]`.
The `"name"` is the key
and `"Same Smith"` is the value.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
  [{ name: "Adam" }, "Property with object key"],
  [[ 1, 2, 3, 4 ], "Property with object key"],
]);

console.log(mapWithRandomProps);
</code>
</codeblock>