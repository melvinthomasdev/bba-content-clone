The `map.delete()` method removes
the `key value` pair for the provided `key` from the Map.
If it is able to delete the
data from the Map, it returns `true`.
If it is unable to find the data
and remove it from the Map, it
returns `false.

<Editor lang="javascript">
<code>
let myMap = new Map([
  ["name", "Sam Smith"],
  ["age", 32]
]);
myMap.delete("name");
console.log(myMap);
</code>
</Editor>