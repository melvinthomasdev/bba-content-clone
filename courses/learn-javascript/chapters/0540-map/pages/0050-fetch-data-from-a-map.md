The `map.get()` method
returns the value of a key.
We need to pass the key as argument.
If the key is not present,
it returns `undefined`.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

console.log(mapWithRandomProps.get(true));
console.log(mapWithRandomProps.get(false));
</code>
</codeblock>