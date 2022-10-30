Given a sentence determine whether it is a pangram in the lowercase English alphabet.

A pangram is a string that contains every letter of the alphabet at least once.

1. Input string can be upper or lower case.
2. Consider pangram in the lowercase English alphabet only.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const isPangram = (str) => {
  // your code here
};
</code>

<solution>
const isPangram = (str) => {
  const arr = [..."abcdefghijklmnopqrstuvwxyz"];
  const hash = new Map();
  arr.forEach((e) => hash.set(e, 0));
  const strArr = [...str.toLowerCase()];
  strArr.forEach((e) => {
    if (hash.has(e)) hash.delete(e);
  });
  if (hash.size === 0) return true;
  else return false;
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
<testcase>
<i>
const str = "When zombies arrive, quickly fax Judge Pat";
</i>
</testcase>
<testcase>
<i>
const str = "The five boxing wizards jump quickly";
</i>
</testcase>
</testcases>
</Editor>