To add a key-value pair to a Map,
we can use the `set` method.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

mapWithRandomProps.set([ 1, 2, 3, 4 ], "Property with array key");

console.log(mapWithRandomProps);
</code>
</codeblock>

In the example given above,
we have a map `mapWithRandomProps`.
`mapWithRandomProps.set([ 1, 2, 3, 4 ], "Property with array key")`
added a new property to the map
with the key `[ 1, 2, 3, 4 ]`
and the value `"Property with array key"`.
