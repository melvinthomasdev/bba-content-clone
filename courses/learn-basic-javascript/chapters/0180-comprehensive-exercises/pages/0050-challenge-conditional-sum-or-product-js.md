Create a program `sumOrProductOfN`
that accepts two parameters a
number `n` and a string `operator`
with values which can be
either `sum` or `product`.

Based on the `operator` parameter,
find and print to the screen,
the `sum` or `product` of 1 to `n`.

If user enters any other value than 
`sum` or `product` log `Not a valid Input`
to the console.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
// Write your code here
</code>
<solution>
const sumOrProductOfN = (n, operator) => {
	if (operator === 'sum') {
		let sum = 0;
		for (i = n; i > 0; i--) {
			sum += i;
		}
		console.log(sum);
	} else if (operator === 'product') {
		let product = 1;
		for (i = n; i > 0; i--) {
			product *= i;
		}
		console.log(product);
	} else {
		console.log("Not a valid Input");
	}
};
</solution>
<testcases>
<caller>
sumOrProductOfN(testNumber, testOperator);
</caller>
<testcase>
<i>
const testNumber = 12;
const testOperator = "product";
</i>
</testcase>
<testcase>
<i>
const testNumber = 32;
const testOperator = "sum";
</i>
</testcase>
<testcase>
<i>
const testNumber = 1;
const testOperator = "alert";
</i>
</testcase>
<testcase>
<i>
const testNumber = 5;
const testOperator = "prompt";
</i>
</testcase>
</testcases>
</codeblock>
