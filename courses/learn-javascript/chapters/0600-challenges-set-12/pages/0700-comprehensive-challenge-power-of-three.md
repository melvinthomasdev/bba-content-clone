Complete the JavaScript function to check whether a given integer is a power of three or not.

For example:

```text
Input: num = 27

Output: true
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isPowerOfThree = num => {
  // Write your code here
}
</code>

<solution>
const isPowerOfThree = num => (Math.log10(num) / Math.log10(3)) % 1 == 0;
</solution>

<testcases>
<caller>
console.log(isPowerOfThree(num));
</caller>
<testcase>
<i>
const num = 1;
</i>
</testcase>
<testcase>
<i>
const num = 81;
</i>
</testcase>
<testcase>
<i>
const num = 10;
</i>
</testcase>
</testcases>
</codeblock>
