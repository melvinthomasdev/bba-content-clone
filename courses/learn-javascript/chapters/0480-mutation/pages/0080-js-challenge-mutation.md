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

We are not displaying answer to this exercise.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://bigbinaryacademy.slack.com/join/shared_invite/zt-23dvxwolx-U9LYYbv4ycmODEA1cbNFgA#/shared-invite/email) to join the community.
