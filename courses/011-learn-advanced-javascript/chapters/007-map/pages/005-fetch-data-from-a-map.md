The `map.get()` method
returns the value of a key.
If the key is not present,
it returns `undefined`.

<Editor lang="javascript">
<code>
let myMap = new Map([
  ["name", "Sam Smith"]
]);
let result = myMap.get("name");
console.log(result);
</code>
</Editor>