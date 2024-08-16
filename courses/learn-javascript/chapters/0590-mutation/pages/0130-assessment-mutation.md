Update the function `arrayOfSquares` in a way that it should return a new array containing the squares of each number in the input array passed to it.

For example:

```js
Input: [1, 2, 3];

Output: [1, 4, 9];
```

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

For example:

```js
Input: numbers = [20, 15, 35, 10, 25];

Output: [10, 15, 20, 25, 35];
```

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

We are not displaying the answer for this challenge.

We do this because we want you to challenge yourself
and
not give in to the temptation of looking at the solution.

We also don't want to leave you stuck, so if you feel
you have tried enough and are still unable to solve
this challenge, feel free to ask in our **community**.

[Here is the link](https://join.slack.com/t/bigbinaryacademy/shared_invite/zt-2kj86untg-wCGh2GPBA2I3iWZk4ke~tg) to join the community.
