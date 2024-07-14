You are given an array `arrayOfNumbers` which contains a series of numbers.

Create a function `arrayOperationsNumber` that accepts `arrayOfNumbers` as a parameter and performs the following operations,

- Logs the sum of all numbers in the given array to the console.
- Creates a new array from given array containing only elements that are multiples of 3.
- Creates a new array from given array containing only even numbers and logs it to the console.
- Creates a new array from given array that contains true for even numbers and false for odd numbers then logs it to the console.

For example:

```js
Input: arrayOfNumbers = [4, 5, 88, 21, 3, 28];

Output:
149
[ 21, 3 ]
[ 4, 88, 28 ]
[ true, false, true, false, false, true ]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
const arrayOperationsNumber = arrayOfNumbers => {

  const sum = arrayOfNumbers.reduce((accumulator, currentValue) => accumulator + currentValue, 0);

  const arrayofMultiplesOfThree = arrayOfNumbers.filter(number => number % 3 === 0);

  const evenNumbersArray = arrayOfNumbers.filter(number => number % 2 === 0);

  const oddEvenArray = arrayOfNumbers.map((num) => num % 2 === 0 ? true : false);

  console.log(sum);
  console.log(arrayofMultiplesOfThree);
  console.log(evenNumbersArray);
  console.log(oddEvenArray);
}
</solution>
<testcases>
<caller>
arrayOperationsNumber(arrayOfNumbers);
</caller>
<testcase>
<i>
const arrayOfNumbers = [4, 5, 88, 21, 3, 28]
</i>
</testcase>
<testcase>
<i>
const arrayOfNumbers = [6, 10, 81, 1, 37, 2]
</i>
</testcase>
<testcase>
<i>
const arrayOfNumbers = [41, 50, 91, 46, 3, 1]
</i>
</testcase>
<testcase>
<i>
const arrayOfNumbers = [0, 31, 83, 71, 44, 26]
</i>
</testcase>
</testcases>
</codeblock>
