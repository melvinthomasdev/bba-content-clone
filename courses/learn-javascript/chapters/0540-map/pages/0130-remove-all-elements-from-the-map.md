The `map.clear()` method
removes all the properties from the Map.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

mapWithRandomProps.clear();
console.log(mapWithRandomProps);
</code>
</codeblock>