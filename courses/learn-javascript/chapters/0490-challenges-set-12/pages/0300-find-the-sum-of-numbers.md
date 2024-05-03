Find the sum of all the numbers that are input to the function.

1. There is no limit to the number of arguments for the function.
2. Find out the sum of the numbers that are input.
3. The length of the arguments will vary.

For example:
```js
Input:
numbers = [322, 788, 764, 34, 546, 98, 65];

Output:
2617
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sum = () => {
  // write your code here
}
</code>

<solution>
const sum = (...numbers) => numbers.reduce((sum, number) => sum + number, 0)
</solution>

<testcases>
<caller>
console.log(sum(...numbers));
</caller>
<testcase>
<i>
const numbers = [3, 4, 5, 10, 8, 12, 23];
</i>
</testcase>
<testcase>
<i>
const numbers = [12, 31, 11, 76, 19, 87, 12];
</i>
</testcase>
<testcase>
<i>
const numbers = [32, 98, 54, 34, 21, 98, 65];
</i>
</testcase>
<testcase>
<i>
const numbers = [322, 788, 764, 34, 546, 98, 65];
</i>
</testcase>
</testcases>
</codeblock>
