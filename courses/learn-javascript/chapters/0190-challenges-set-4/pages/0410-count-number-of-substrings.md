Complete the JavaScript function to count the number of substrings in a given string that contain exactly k distinct characters. The function takes two parameters: a string and an integer. The `str` contains only lowercase alphabets. It should return the count of substrings with exactly k distinct characters.

For example:

```text
Input: str = xyz, k = 2
Output: 2
substrings with 2 Distinct Characters are {"xy", "yz"}
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const countSubstrings = (str, k) => {
  // write your code here
}
</code>

<solution>
const countSubstrings = (str, k) => {
  const n = str.length;
  let count = 0;

  for (let i = 0; i < n; i++) {
    const distinctChars = new Set();
    for (let j = i; j < n; j++) {
      distinctChars.add(str[j]);
      if (distinctChars.size === k) {
        count++;
      }
      if (distinctChars.size > k) {
        break;
      }
    }
  }

  return count;

}

</solution>

<testcases>
<caller>
console.log(countSubstrings(str, k));
</caller>
<testcase>
<i>
const str = "abcc";
const k = 2;
</i>
</testcase>
<testcase>
<i>
const str = "aabab";
const k = 3;
</i>
</testcase>
<testcase>
<i>
const str = "stristr";
const k = 4;
</i>
</testcase>
</testcases>
</codeblock>
