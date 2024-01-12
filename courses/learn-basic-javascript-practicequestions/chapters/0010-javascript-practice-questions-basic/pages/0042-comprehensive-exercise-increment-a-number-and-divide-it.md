The function `incrementAndDivide` should increment
a given number by 1 and then divide the resulting
number by 2. It should then return the final result.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const incrementAndDivide = (number) => {
  // your code here
};
</code>

<solution>
const incrementAndDivide = (number) => {
  number++;
  return number / 2;
};
</solution>

<testcases>
<caller>
console.log(incrementAndDivide(number));
</caller>
<testcase>
<i>
const number = 4321;
</i>
</testcase>
<testcase>
<i>
const number = 0;
</i>
</testcase>
<testcase>
<i>
const number = 123;
</i>
</testcase>
<testcase>
<i>
const number = -123;
</i>
</testcase>
</testcases>
</codeblock>
