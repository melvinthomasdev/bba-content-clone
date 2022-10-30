Given two sentences, determine if one is an anagram of another.

An anagram is a word, phrase, or name formed by rearranging the letters of another, such as spar, formed from rasp.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const isAnagram = (s1,s2) => {
  // your code here
};
</code>

<solution>
const isAnagram = (s1, s2) => {
  const arr1 = s1.toLowerCase().split("").sort().join("").trim();
  const arr2 = s2.toLowerCase().split("").sort().join("").trim();
  return arr1 === arr2;
};
</solution>

<testcases>
<caller>
console.log(isAnagram(s1,s2));
</caller>
<testcase>
<i>
const s1 = 'The earthquakes';
const s2 = 'The queer shakes';
</i>
</testcase>
<testcase>
<i>
const s1 = 'Older and Wiser';
const s2 = 'I learned Words';
</i>
</testcase>
<testcase>
<i>
const s1 = 'Coins kept';
const s2 = 'In Pockets';
</i>
</testcase>
<testcase>
<i>
const s1 = 'William Shakespeare';
const s2 = 'I am a weakish speller';
</i>
</testcase>
</testcases>
</Editor>