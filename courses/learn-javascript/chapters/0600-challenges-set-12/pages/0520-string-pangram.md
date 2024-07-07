For the given sentence determine whether it's a pangram in the lowercase English alphabet or not.

A pangram is a string that contains every letter of the alphabet at least once.

1. The input string can be in upper or lower case.
2. Consider pangram in the lowercase English alphabet only.
3. If the given string is a pangram print "Pangram" else print "Not a pangram"

For example:
```js
Input:
const str = "Brown jars prevented the mixture from freezing too quickly";

Output:
Not a pangram
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isPangram = str => {
  // your code here
};
</code>

<solution>
const isPangram = str => {
  const alphabets = [..."abcdefghijklmnopqrstuvwxyz"];
  return alphabets.every(alphabet => str.toLowerCase().includes(alphabet))
    ? "Pangram"
    : "Not a pangram";
};
</solution>

<testcases>
<caller>
console.log(isPangram(str));
</caller>
<testcase>
<i>
const str = "The quick brown fox jumps over a lazy dog";
</i>
</testcase>
<testcase>
<i>
const str = "We promptly judged antique ivory buckles for the next prize";
</i>
</testcase>
<testcase>
<i>
const str = "Welcome to the gym";
</i>
</testcase>
<testcase>
<i>
const str = "Brown jars prevented the mixture from freezing too quickly";
</i>
</testcase>
</testcases>
</codeblock>
