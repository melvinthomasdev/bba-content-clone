Use `map.size` method to find
the number of properties in the `fruit` Map.
Store the value in `noOfProps`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = new Map([
  ["name", "apple"],
  ["color", "red"]
]);

const noOfProps = ;
console.log(noOfProps);
</code>

<solution>
const fruit = new Map([
  ["name", "apple"],
  ["color", "red"]
]);

const noOfProps = fruit.size;
console.log(noOfProps);
</solution>
</codeblock>