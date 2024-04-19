Use the `map.clear()` method
to remove all the elements
from the `fruit` Map.

For example:
```js
Input:
fruit = new Map([
  ["name", "strawberry"],
  ["color", "red"],
])

Output:
Map(0) {size: 0}
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
fruit.clear();
console.log(fruit);
</solution>
</codeblock>
