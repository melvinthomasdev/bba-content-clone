In the code below, we have
a function `findMaxOfThree`.
This function takes three
numbers as parameters.

Your task is to update the
`findMaxOfThree` function to
determine the maximum value
among the three numbers
and
log it to the console.

For Example:
`findMaxOfThree(5, 12, 8)` should
give an output `12`.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
function findMaxOfThree(a, b, c) {
  // Write code below
};

findMaxOfThree(5, 10, 3);
findMaxOfThree(8, 2, 15);
findMaxOfThree(4, 4, 4); 
</code>

<solution>
function findMaxOfThree(a, b, c) {
  // Write code below
  let maximumValue = a > b ? (a > c ? a : c) : (b > c ? b : c);
  console.log(maximumValue);
};

findMaxOfThree(5, 10, 3);
findMaxOfThree(8, 2, 15);
findMaxOfThree(4, 4, 4); 
</solution>
</codeblock>
