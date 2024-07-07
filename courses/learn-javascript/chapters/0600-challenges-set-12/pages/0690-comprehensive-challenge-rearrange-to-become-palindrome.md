Complete the JavaScript function to determine whether or not a string can be rearranged to become a palindrome.

For example:

```text
Input: str = "malalamya"

Output: true

"malalamya" can be rearranged to "malayalam" which is palindrome.
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const canFormPalindrome = str => {
  // Write your code here
}
</code>

<solution>
const canFormPalindrome = str => {
  const charCount = [...str].reduce((acc, char) => {
    acc[char] = (acc[char] || 0) + 1;

    return acc;
  }, {});

  return (
    Object.values(charCount).filter(count => count % 2 !== 0).length <= 1
  );
};

</solution>

<testcases>
<caller>
console.log(canFormPalindrome(str));
</caller>
<testcase>
<i>
const str = "aaaabb";
</i>
</testcase>
<testcase>
<i>
const str = "hello";
</i>
</testcase>
<testcase>
<i>
const str = "carrace";
</i>
</testcase>
</testcases>
</codeblock>
