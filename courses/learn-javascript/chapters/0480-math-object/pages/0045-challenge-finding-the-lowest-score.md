We have the scores of the math
test taken by `Sam`, `Eve`,
`Renu`
and `Lao` in an array.

Implement a function, `calculateMinimum`,
which takes this array as an argument
and
finds the minimum value.

The output should include
the minimum value,
and
the index of the minimum 
value in the array.
Log the output to the console.

```js
Output:
`The minimum value is 40 at index 1.`
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const scores = [65, 40, 80, 72];

// Write code below this line

</code>
<solution>
const scores = [65, 40, 80, 72];

// Write code below this line
const calculateMinimum = (array) => {
  return Math.min(...array);
};

let result = calculateMinimum(scores);

let minIndex = scores.indexOf(result);
console.log(`The minimum value is ${result} at index ${minIndex}.`);
</solution>
</codeblock>