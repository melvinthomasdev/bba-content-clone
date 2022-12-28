The `map.size` method
returns the number of
properties in the Map.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

console.log(mapWithRandomProps.size);
</code>
</codeblock>