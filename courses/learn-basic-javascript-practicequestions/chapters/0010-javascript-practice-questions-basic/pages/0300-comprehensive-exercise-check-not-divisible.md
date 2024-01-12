The **checkNotDivisible** function takes two parameters,
**number** and **divisor**.
It checks whether the number is not divisible by the
specified divisor based on the following conditions.

1. If both number and divisor are valid numbers, and the divisor is not zero,
    - If the number is not divisible by the divisor, it returns **Not divisible**.
    - If the number is divisible by the divisor, it returns **Divisible**.
2. If the input is invalid or the divisor is zero, it returns **Invalid input**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function checkNotDivisible(number, divisor) {
  // write your code here
}
</code>

<solution>
function checkNotDivisible(number, divisor) {
  if (typeof number === 'number' && typeof divisor === 'number' && divisor !== 0) {
    if (number % divisor !== 0) {
      return `Not divisible`;
    } else {
      return `Divisible`;
    }
  } else {
    return `Invalid input`;
  }
}
</solution>

<testcases>
<caller>
console.log(checkNotDivisible(number, divisor));
</caller>
<testcase>
<i>
const number = 17;
const divisor = 5;
</i>
</testcase>
<testcase>
<i>
const number = 20;
const divisor = 4;
</i>
</testcase>
<testcase>
<i>
const number = "abc";
const divisor = 3;
</i>
</testcase>
<testcase>
<i>
const number = 15;
const divisor = 0;
</i>
</testcase>
</testcases>
</codeblock>
