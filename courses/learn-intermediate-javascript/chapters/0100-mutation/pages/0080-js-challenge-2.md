Update the function `arrayOfSquares` in a way that it should return a new array containing the squares of each number in the input array passed to it.
Example:
`[1,2,3] => [1,4,9]`;

<codeblock language="javascript" type="exercise" testMode="fixedInput" showSolution="false">
<code>
const arrayOfSquares = numberList => {
  // Write your code here
};
console.log(arrayOfSquares([-1, -2, -3]));
</code>
<solution>
const arrayOfSquares = numberList => {
  return numberList.map(num => num**2); 
};
console.log(arrayOfSquares([-1, -2, -3]));
</solution>
</codeblock>


Update the function `updateAsAscending` that accepts an array of numbers as a parameter to return a new array such that the numbers are in ascending order.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const updateAsAscending = numbers => {
  //Write your code here
};
console.log(updateAsAscending([42, 48, 49, 111, 222, 333, 0, 5]));
</code>
<solution>
function updateAsAscending(numbers) {
  return numbers.sort((a, b) => a - b);
};

console.log(updateAsAscending([42, 48, 49, 111, 222, 333, 0, 5]));
</solution>
</codeblock>
