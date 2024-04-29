Complete the JavaScript function to determine whether two given strings are anagrams of each other. The function should return `true` if both strings are anagrams. Else, return `false`.

An anagram of a string is another string that contains the same characters, only the order of characters can be different.

For example:

```text
Input: stringOne = "heart", stringTwo = "earth"

Output: true
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const findMatchingItem = (stringOne, stringTwo) => {
  // write your code here
}
</code>

<solution>
const isAnagram = (stringOne, stringTwo) => {

    if (stringOne.length !== stringTwo.length) return false;

    const sortedStr1 = stringOne.split('').sort().join('');
    const sortedStr2 = stringTwo.split('').sort().join('');

    return sortedStr1 === sortedStr2;

}

</solution>

<testcases>
<caller>
console.log(isAnagram(stringOne, stringTwo));
</caller>
<testcase>
<i>
const stringOne = "listen";
const stringTwo = "silent";
</i>
</testcase>
<testcase>
<i>
const stringOne = "hello";
const stringTwo = "world";
</i>
</testcase>
</testcases>
</codeblock>
