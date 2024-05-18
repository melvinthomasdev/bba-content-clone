Modify the code given below to
set the default value
of `weight` as `150`.

For example:
```js
Input: fruit = { name: "Strawberry"}

Output: 150
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruit = {
  name: "Apple",
}

const { name, weight } = fruit;
console.log(weight);
</code>

<solution>
const fruit = {
  name: "Apple",
}

const { name, weight = 150 } = fruit;
console.log(weight);
</solution>
</codeblock>
