1. Create a function addThree, which accepts a number and increments it by 3 and then returns the result. (1 -> 1+3, 4 is returned)
2. Create another function named addThreeToArray which:
	- Accepts an array of numbers.
	- Returns a new array where 3 is added to each element.
3. Use this array to check if addThreeToArray is working perfectly.
`[3, 16, 9, 22, 71, 6]`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
	// your code here
</code>

<solution>
const addThree = (number) => number + 3;
const givenArray = [3, 16, 9, 22, 71, 6];

const addThreeToArray = (inputArray) => {
	const newArray = [];
	//As DRY principle states not to repeat ourself, we will be using the already created addThree function.
	for(index in inputArray){
		newArray[index] = addThree(inputArray[index]);
	};
	return newArray;
};

addThreeToArray(givenArray);
</solution>
<testcases>
<caller>
console.log(addThreeToArray(newArray));
</caller>
<testcase>
<i>
const newArray = [5, 12, 33, 72, 48, 89];
</i>
</testcase>
<testcase>
<i>
const newArray = [8, 32, 54, 61, 29, 12];
</i>
</testcase>
<testcase>
<i>
const newArray = [4, 134, 78, 91, 71, 73];
</i>
</testcase>
<testcase>
<i>
const newArray = [7, 24, 31, 72, 56, 81];
</i>
</testcase>
</testcases>
</codeblock>
