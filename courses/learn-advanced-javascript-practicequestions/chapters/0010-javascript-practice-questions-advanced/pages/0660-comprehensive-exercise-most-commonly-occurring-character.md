The function `mostCommonCharacter` should return the most commonly occurring character in a string.

1. If there are 2 or more such characters, then return the character which comes first alphabetically.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const mostCommonCharacter = str => {
  // your code here
};
</code>

<solution>
const mostCommonCharacter = str => {
  const arr = [..."abcdefghijklmnopqrstuvwxyz"];
  const hash = new Map();
  arr.forEach(e => hash.set(e, 0));
  const strArr = [...str.toLowerCase()];
  strArr.forEach(e => hash.set(e, hash.get(e) + 1));
  return [...hash].reduce((a, e) => (e[1] > a[1] ? e : a))[0];
};
</solution>

<testcases>
<caller>
console.log(mostCommonCharacter(str));
</caller>
<testcase>
<i>
const str = "abcddefg";
</i>
</testcase>
<testcase>
<i>
const str = "heggbdeff";
</i>
</testcase>
<testcase>
<i>
const str = "KABBAB";
</i>
</testcase>
<testcase>
<i>
const str = "aFsFeeccfFfa";
</i>
</testcase>
</testcases>
</codeblock>