Given two sentences, determine if one is an anagram of another.

An anagram is a word, phrase, or name formed by rearranging the letters of another. For example "spar" can be rearranged to form "rasp" so "spar" and "rasp" are anagrams.

For example:
```js
Input:
const s1 = 'Coins kept';
const s2 = 'In Pockets';

Output:
true
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const isAnagram = ({ s1,s2 }) => {
  // your code here
};
</code>

<solution>
const isAnagram = ({ s1, s2 }) => downcaseAndSortWord(s1) === downcaseAndSortWord(s2)

const downcaseAndSortWord = word => word.toLowerCase().split("").sort().join("").trim();
</solution>

<testcases>
<caller>
console.log(isAnagram({ s1,s2 }));
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
</codeblock>
