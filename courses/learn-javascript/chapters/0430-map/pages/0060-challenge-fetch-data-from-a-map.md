Use the `map.get()` method
to get the value of
the **"name"** key of `fruit`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = new Map([
  ["name", "apple"]
]);
const fruitName = ;
console.log(fruitName);
</code>

<solution>
const fruit = new Map([
  ["name", "apple"]
]);
const fruitName = fruit.get("name");
console.log(fruitName);
</solution>
</codeblock>