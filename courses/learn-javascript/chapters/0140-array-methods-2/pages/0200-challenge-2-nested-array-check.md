Write a function `nestedArrayCheck`
that takes an input and returns a
string indicating whether the input
is an array or a nested array,
and
if nested, how many levels of nesting
it contains.

- If the input is a non-array value, return "Input is not an array".
- If the input is a single-dimensional array, return "Input is an array".
- If the input is a nested array, return "Input is a nested array with X levels", where X is the number of levels of nesting.

For example:
```js
Input:
arr = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]

Output: "Input is a nested array with 3 levels"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const arr1 = [1, 2, 3];
const arr2 = [[1, 2], [3, 4], [5, 6]];
const arr3 = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
const notArr = 5;

// Write code below this line

console.log(nestedArrayCheck(arr1));
console.log(nestedArrayCheck(arr2));
console.log(nestedArrayCheck(arr3));
console.log(nestedArrayCheck(notArr));
</code>
<solution>
const arr1 = [1, 2, 3];
const arr2 = [[1, 2], [3, 4], [5, 6]];
const arr3 = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];
const notArr = 5;

// Write code below this line
const nestedArrayCheck = (input) => {
  if (!Array.isArray(input)) {
    return "Input is not an array";
  }

  let levels = 1;
  let current = input;
  while (Array.isArray(current[0])) {
    current = current[0];
    levels++;
  }

  if (levels === 1) {
    return "Input is an array";
  } else {
    return `Input is a nested array with ${levels} levels`;
  }
};

console.log(nestedArrayCheck(arr1));
console.log(nestedArrayCheck(arr2));
console.log(nestedArrayCheck(arr3));
console.log(nestedArrayCheck(notArr));
</solution>
</codeblock>
