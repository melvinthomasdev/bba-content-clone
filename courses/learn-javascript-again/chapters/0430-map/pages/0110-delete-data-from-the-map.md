The `delete()` method removes
the key-value pair for
the provided `key` from a map.
The `delete()` method returns `true`
if a property with that `key` exists
and
it was able to delete that property.
If a property with that `key`
does not exist,
it returns `false`.

<codeblock language="javascript" type="lesson">
<code>
const mapWithRandomProps = new Map([
  ["name", "Sam Smith"],
  [true, "Property with boolean key"],
  [12.34, "Property with float key"],
]);

const isNamePropDeleted = mapWithRandomProps.delete("name");
console.log(isNamePropDeleted);
console.log(mapWithRandomProps);
</code>
</codeblock>