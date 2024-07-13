Update the function **convertToArrayAndTriple** that takes a string as input and returns a real array where each number is three times the original.

For example:
```js
Input: `"5678"`

Output: `[ 15, 18, 21, 24 ]`
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const convertToArrayAndTriple = (string) => {
  // Write your code here
};

console.log(convertToArrayAndTriple("123"));
console.log(convertToArrayAndTriple("1593"));
</code>
<solution>
const convertToArrayAndTriple = (string) => {
  return Array.from(string, number => Number(number) * 3)
};

console.log(convertToArrayAndTriple("123"));
console.log(convertToArrayAndTriple("1593"));
</solution>
</codeblock>
