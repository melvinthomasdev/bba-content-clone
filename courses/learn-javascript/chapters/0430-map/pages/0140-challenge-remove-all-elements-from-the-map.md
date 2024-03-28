Use the `map.clear()` method
to remove all the elements
from the `fruit` Map.

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