Write a code to print the result obtained from the calculation of the provided two numbers, based on the provided operator.

* The `valueOne` and `valueTwo` variables are numbers to which you need to apply the `operator` variable.

* The supported operators are `+`, `-`, `*`, and `/`.

* For anything else received, print `Invalid Operator`.

Make sure your code is flexible enough to work with any value of the `valueOne`, `valueTwo` and `operator` variable that meets these requirements.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const calculateAndLogValue = (valueOne, valueTwo, operator) => {
	// write your code here
}
</code>

<solution>
const calculateAndLogValue = (valueOne, valueTwo, operator) => {
  switch (operator) {
      case '+':
        result = valueOne + valueTwo;
        break;
      case '-':
        result = valueOne - valueTwo;
        break;
      case '*':
        result = valueOne * valueTwo;
        break;
      case '/':
        result = valueOne / valueTwo;
        break;
      default:
        result = 'Invalid Operator';
  }
  console.log(result);
}
</solution>
<testcases>
<caller>
calculateAndLogValue(valueOne, valueTwo, operator);
</caller>
<testcase>
<i>
const valueOne = 6;
const valueTwo = 7;
const operator = '+';
</i>
</testcase>
<testcase>
<i>
const valueOne = 10;
const valueTwo = 3;
const operator = '-';
</i>
</testcase>
<testcase>
<i>
const valueOne = 8;
const valueTwo = 3;
const operator = '*';
</i>
</testcase>
<testcase>
<i>
const valueOne = 75;
const valueTwo = 25;
const operator = '&';
</i>
</testcase>
<testcase>
<i>
const valueOne = 13;
const valueTwo = 27;
const operator = '$';
</i>
</testcase>
</testcases>
</codeblock>
