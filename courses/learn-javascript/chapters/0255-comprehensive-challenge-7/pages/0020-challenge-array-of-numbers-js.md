Given is an array `arrayOfNumber`
which, as the name suggests, is an
array of numbers.

Create a function `arrayOperationsNumber`
which accepts `arrayOfNumber` as a
parameter and consists of the following:-

- Logs the sum of all numbers in
  `arrayOfNumber` to the console.

- Create a new array from `arrayOfNumber`
  in which all the elements of the array
  are a multiple of 3.

- Create a new array from `arrayOfNumber`
  which contains only **even** numbers and
  log it to the console.

- Create a new array from `arrayOfNumber`
  that contains `true` for **even** numbers
  and `false` for **odd** numbers and log it
  to the console.

For example:

```js
Input: testArray = [4, 5, 88, 21, 3, 28];

Output:
149
[21, 3]
[4, 88, 28]
[true, false, true, false, false, true]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write code here
</code>
<solution>
const arrayOperationsNumber = inputArray => {
  let sum = 0;
  inputArray.map(number => sum += number);

const arrayMultipleOf3 = inputArray.filter(
number => number % 3 === 0
);

const evenNumbersArray = inputArray.filter(
number => number % 2 === 0
);

const oddEvenArray = inputArray.map((num)=>{
if (num % 2 === 0){
return true;
} else {
return false;
}
});

console.log(sum);
console.log(arrayMultipleOf3);
console.log(evenNumbersArray);
console.log(oddEvenArray);
}

</solution>
<testcases>
<caller>
arrayOperationsNumber(testArray);
</caller>
<testcase>
<i>
const testArray = [4, 5, 88, 21, 3, 28]
</i>
</testcase>
<testcase>
<i>
const testArray = [6, 10, 81, 1, 37, 2]
</i>
</testcase>
<testcase>
<i>
const testArray = [41, 50, 91, 46, 3, 1]
</i>
</testcase>
<testcase>
<i>
const testArray = [0, 31, 83, 71, 44, 26]
</i>
</testcase>
</testcases>
</codeblock>
