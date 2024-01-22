Use the `Object.entries()` method to
convert the `fruit` object to a map.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = {
  name: "apple",
  color: "red",
}

const fruitMap = ;

console.log(fruitMap);
</code>

<solution>
const fruit = {
  name: "apple",
  color: "red",
}

const fruitMap = new Map(Object.entries(fruit));

console.log(fruitMap);
</solution>
</codeblock>