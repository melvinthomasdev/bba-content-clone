Print the multiplication
table of 6.

The output should look like this:

```js
6 * 1 = 6
6 * 2 = 12
6 * 3 = 18
6 * 4 = 24
6 * 5 = 30
6 * 6 = 36
6 * 7 = 42
6 * 8 = 48
6 * 9 = 54
6 * 10 = 60
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Print multiplication table of 6
</code>

<solution>
const multiplier = 6;

const multiplicands = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

multiplicands.forEach(multiplicand =>
  console.log(`${multiplier} * ${multiplicand} = ${multiplicand * multiplier}`)
);
</solution>
</codeblock>
