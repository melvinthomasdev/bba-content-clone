Use the `reduce()` method to find
the largest number of all the elements
in the `numbers` array.
Store the result in `largestNumber`.

For example:
```js
Input: numbers = [15, 20, 11, 70, 13, 3]

Output: 70
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const numbers = [5, 2, 11, 7, 13, 3];
const largestNumber = ;
console.log(largestNumber);
</code>

<solution>
const numbers = [5, 2, 11, 7, 13, 3];
const findLargest = (maxValue, currentValue) => currentValue > maxValue ? currentValue : maxValue
const largestNumber = numbers.reduce(findLargest);
console.log(largestNumber);
</solution>
</codeblock>
