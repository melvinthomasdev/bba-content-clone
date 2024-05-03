Complete the JavaScript function to replace all but the last number of characters with the specified mask character.

Hint: Use the regular expression `/./g` to match any character in the string.

For example:

```text
Input: num = 111111, maskLength = 3, mask = "*"

Output: ***111
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const generateMask = (num, maskLength, mask) => {
  // Write your code here
}
</code>

<solution>
const generateMask = (num, maskLength, mask) =>
  ('' + num).slice(0, -maskLength).replace(/./g, mask) + ('' + num).slice(-maskLength);
</solution>

<testcases>
<caller>
console.log(generateMask(num, maskLength, mask));
</caller>
<testcase>
<i>
const num = 1234567890;
const maskLength = 4;
const mask = "*";
</i>
</testcase>
<testcase>
<i>
const num = 99934523;
const maskLength = -2;
const mask = "$";</i>
</testcase>
</testcases>
</codeblock>
