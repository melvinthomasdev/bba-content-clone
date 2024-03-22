Write a function `doubledArray`
that takes an array of numbers
as input and returns a new array
where each number is doubled.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const numberArray = [1, 2, 3, 4, 5];

// Write code below this line

const doubledNumberArray = doubledArray(numberArray);
console.log(doubledNumberArray);
</code>
<solution>
const numberArray = [1, 2, 3, 4, 5];

// Write code below this line

const doubledArray = (inputArray) => {
  // Using Array.from() to create a new array
  return Array.from(inputArray, num => num * 2);
};

const doubledNumberArray = doubledArray(numberArray);
console.log(doubledNumberArray);
</solution>
</codeblock>
