The object `fruit` in the code below,
contains the properties
`name`, `color` and `weight`.

Use object destructuring
to copy the values of all the properties
and
assign them to separate variables.

```js
Output:
`The Apple is red and it weighs 100 grams.`
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = {
  name: "Apple",
  color: "red",
  weight: 100
}

console.log(`The ${name} is ${color} and it weighs ${weight} grams.`);
</code>

<solution>
const fruit = {
  name: "Apple",
  color: "red",
  weight: 100
}

const { name, color, weight } = fruit;
console.log(`The ${name} is ${color} and it weighs ${weight} grams.`);
</solution>
</codeblock>
