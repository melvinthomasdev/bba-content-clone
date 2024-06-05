Complete the JavaScript function to reverse the binary representation of a positive integer and return the decimal version of the binary string. The function accepts a positive integer.

For example:

```text
Input: num = 100

Output: 19

Binary representation of 100 is 1100100
Reverse of 1100100 is 0010011
Decimal form of 0010011 is 19
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const integerToReverseBinary = num => {
  // Write your code here
}
</code>

<solution>
  const integerToReverseBinary = num =>
  parseInt(num.toString(2).split('').reverse().join(''), 2);
</solution>

<testcases>
<caller>
console.log(integerToReverseBinary(num));
</caller>
<testcase>
<i>
const num = 1134;
</i>
</testcase>
<testcase>
<i>
const num = 30;
</i>
</testcase>
</testcases>
</codeblock>
