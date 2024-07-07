The `map.has()` method can be used
to check if a Map has a property
with the given key.

The `map.has()` method takes
one argument -
the key to be searched for.
The `map.has()` method returns
`true` if the key exists and
`false` if it doesn't.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

const doesMapHaveNameKey = mapWithRandomProps.has("name");
console.log(doesMapHaveNameKey);
</code>
</codeblock>