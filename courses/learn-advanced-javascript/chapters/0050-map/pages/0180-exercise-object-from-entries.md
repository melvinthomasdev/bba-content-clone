Use the `Object.fromEntries()` method
to create an object `fruit`
containing all the properties
of the map `fruitMap`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruitMap = new Map([
  ["name", "apple"],
  ["color", "red"],
]);
const fruit = ;
console.log(fruit);
</code>

<solution>
const fruitMap = new Map([
  ["name", "apple"],
  ["color", "red"],
]);
const fruit = Object.fromEntries(fruitMap);
console.log(fruit);
</solution>
</codeblock>