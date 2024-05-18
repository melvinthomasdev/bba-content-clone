Given two words, determine if one is an anagram of another.

An anagram is a word, phrase, or name formed by rearranging the letters of another. For example "spar" can be rearranged to form "rasp" so "spar" and "rasp" are anagrams.

For example:
```js
Input:
const s1 = 'racecar';
const s2 = 'carrace';

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

const downcaseAndSortWord = word => word.toLowerCase().split("").sort().join("");
</solution>

<testcases>
<caller>
console.log(isAnagram({ s1,s2 }));
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
</codeblock>
