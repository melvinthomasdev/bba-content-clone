Use the `map.delete()` method
to remove the key-value pair,
which has the key - `color` from the `fruit` Map.

For example:
```js
Input:
fruit = new Map([
  ["name", "strawberry"],
  ["color", "red"],
])

Output:
Map(1) {'name' => 'apple'}
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = new Map([
  ["name", "apple"],
  ["color", "red"],
]);

console.log(fruit);
</code>

<solution>
const fruit = new Map([
  ["name", "apple"],
  ["color", "red"],
]);
fruit.delete("color")
console.log(fruit);
</solution>
</codeblock>
