The function `isDivisible`
should determine whether
the given number
is divisible by `6` or not.

If the number is divisible by `6`, return `true`.
Otherwise, return `false.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isDivisible = number => // write your code here
</code>

<solution>
const isDivisible = number => number % 6 === 0
</solution>

<testcases>
<caller>
console.log(isDivisible(number));
</caller>
<testcase>
<i>
const number = 10;
</i>
</testcase>
<testcase>
<i>
const number = 1122;
</i>
</testcase>
<testcase>
<i>
const number = 963;
</i>
</testcase>
<testcase>
<i>
const number = 468;
</i>
</testcase>
</testcases>
</codeblock>