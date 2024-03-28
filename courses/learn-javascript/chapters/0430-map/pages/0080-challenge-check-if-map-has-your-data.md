Use the `map.has()` method
to check whether the key `fruitName`
is present in the `fruits` Map.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruits = new Map([
  ["fruitName", "apple"]
]);
const fruitNameKeyExists = ;
console.log(fruitNameKeyExists);
</code>

<solution>
const fruits = new Map([
  ["fruitName", "apple"]
]);
const fruitNameKeyExists = fruits.has("fruitName");
console.log(fruitNameKeyExists);
</solution>
</codeblock>