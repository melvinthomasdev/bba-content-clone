Given a variable `numberAsString` of the data type string,
complete the function `numberManipulation` to perform the
following operations and display the result in the console
in the provided format.

1. Convert the string to a numeric value.
2. Round the numeric value.
3. Calculate the square of the rounded number.
4. Reverse the squared number.

Given the value is `"15.8"`, the format to display the values are:

`Numeric value of the string is 15.8`

`Rounded value of the number is 16`

`Square of the rounded number is 256`

`Reverse of the squared number is 652`


<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function numberManipulation(input) {
// Write code here
}
</code>
<solution>
function numberManipulation(input) {
  const number = Number(input);
  console.log(`Numeric value of the string is ${number}`);

  const rounded = Math.round(number);
  console.log(`Rounded value of the number is ${rounded}`);

  const squared = rounded ** 2;
  console.log(`Square of the rounded number is ${squared}`)

  const reversedNumber = parseInt(squared.toString().split("").reverse().join(""));
  console.log(`Reverse of the squared number is ${reversedNumber}`)
}
</solution>
<testcases>
<caller>
comprehensiveExercise(input);
</caller>
<testcase>
<i>
const input = "8.911";
</i>
</testcase>
<testcase>
<i>
const input = "11.11";
</i>
</testcase>
<testcase>
<i>
const input = "7.1717";
</i>
</testcase>
<testcase>
<i>
const input = "5.555";
</i>
</testcase>
</testcases>
</codeblock>
