Create a function `addThree`,
which accepts a `number` and
increments it by 3 and returns
the result.
For example: `1 -> 1 + 3, 4 is returned`

Create another function
`addThreeToArray` which accepts
an array of numbers as a parameter
and logs a new array where
3 is added to each element
to the console.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here
</code>
<solution>
const addThree = (number) => number + 3;

const addThreeToArray = (inputArray) => {
	const newArray = [];
	//As DRY principle states not to repeat ourself, we will be using the already created addThree function.
  inputArray.forEach((element, index) => {
		newArray[index] = addThree(element)
  })
	console.log(newArray);
};
</solution>
<testcases>
<caller>
addThreeToArray(testArray);
</caller>
<testcase>
<i>
const testArray = [5, 12, 33, 72, 48, 89];
</i>
</testcase>
<testcase>
<i>
const testArray = [8, 32, 54, 61, 29, 12];
</i>
</testcase>
<testcase>
<i>
const testArray = [4, 134, 78, 91, 71, 73];
</i>
</testcase>
<testcase>
<i>
const testArray = [7, 24, 31, 72, 56, 81];
</i>
</testcase>
</testcases>
</codeblock>
