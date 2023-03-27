Given is an array of numbers `[58, 44, 30, 98, 86, 9, 5, 86, 92, 60]`

- Create a `sumArray` function that takes an array of number as a parameter, and
  calculate the sum of all its numbers
- Make a new array `multipleOf3` that contains each number which is a multiple
  by 3.
- Create a new array that contains only even numbers.
- Create a new array that should have true for even number and false for odd
  numbers.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
let numberArray = [58, 44, 30, 98, 86, 9, 5, 86, 92, 60];

const sumArray = inputArray => { let sum = 0; inputArray.map(number => sum +=
number); return sum; };

const multipleOf3 = numbers.filter(number => return number % 3 === 0);

const evenNumbersArray = numbers.filter(number => number % 2 === 0);

const oddEvenArray = numbers.map((num)=>{ if (num % 2 === 0){ return true } else
{ return false } });

console.log(sumArray(numberArray)); console.log(multipleOf3);
console.log(evenNumbersArray); console.log(oddEvenArray);

</solution>
</codeblock>
