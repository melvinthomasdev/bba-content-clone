Given two words, determine if one is an anagram of another.

An anagram is a word, phrase, or name formed by rearranging the letters of another, such as spar, formed from rasp.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const isAnagram = (s1,s2) => {
  // your code here
};
</code>

<solution>
const isAnagram = (s1, s2) => {
  const arr1 = s1.toLowerCase().split("").sort().join("");
  const arr2 = s2.toLowerCase().split("").sort().join("");
  return arr1 === arr2;
};
</solution>

<testcases>
<caller>
console.log(isAnagram(s1,s2));
</caller>
<testcase>
<i>
const s1 = 'Paris';
const s2 = 'Pairs';
</i>
</testcase>
<testcase>
<i>
const s1 = 'racecar';
const s2 = 'carrace';
</i>
</testcase>
<testcase>
<i>
const s1 = 'Stressed';
const s2 = 'Desserts';
</i>
</testcase>
<testcase>
<i>
const s1 = 'Hello';
const s2 = 'Ollah';
</i>
</testcase>
</testcases>
</Editor>