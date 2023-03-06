- Write a program that accepts two parameter a number `n` and a string with values either "sum" or "product".
- Based on the second parameter, find and print to the screen, the sum or product of 1...n.
- If user enters any other value than `sum` or `product` log `Not a valid Input` to the console.
- Use the given code to test your solution.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
sumOrProductOfN(8, 'sum');
sumOrProductOfN(60, 'product');
sumOrProductOfN(41, 'hello');
</code>

<solution>
const sumOrProductOfN = (num, operator) => {
	if (operator === 'sum') {
		let sum = 0;
		for (i = num; i > 0; i--) {
			sum += i;
		}
		return sum;
	} else if (operator === 'product') {
		let product = 1;
		for (i = num; i > 0; i--) {
			product *= i;
		}
		return product;
	} else {
		return "Enter a valid Input";
	}
};
sumOrProductOfN(8, 'sum');
sumOrProductOfN(60, 'product');
sumOrProductOfN(41, 'hello');
</solution>
<testcases>
<caller>
console.log(sumOrProductOfN(number, newOperator));
</caller>
<testcase>
<i>
const number = 12;
const newOperator = "product";
</i>
</testcase>
<testcase>
<i>
const number = 32;
const newOperator = "sum";
</i>
</testcase>
<testcase>
<i>
const number = 1;
const newOperator = "alert";
</i>
</testcase>
<testcase>
<i>
const number = 5;
const newOperator = "prompt";
</i>
</testcase>
</testcases>
</codeblock>
