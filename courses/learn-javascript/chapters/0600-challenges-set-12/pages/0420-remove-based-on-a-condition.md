For a list of participants, and a given condition, we should find a list of only those who pass the given condition.

For example:
```js
Input:
// Names with a vowel present
const participants = ["Sam", "Gwynyth", "Carlos", "Tywyn"];
const condition = name =>  (name.match(/[aeiou]/ig));

Output:
['Sam', 'Linh']
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const removeUnMatched = ({ participants, condition }) => {
  // your code here
}
</code>

<solution>
const removeUnMatched = ({ participants, condition }) =>
  participants.filter(condition);
</solution>

<testcases>
<caller>
console.log(removeUnMatched({ participants, condition }));
</caller>
<testcase>
<i>
// Names with less than 6 letters
const participants = ["Alban", "Barlow", "Walters"];
const condition = name => name.length < 6;
</i>
</testcase>
<testcase>
<i>
// Names without a vowel present
const participants = ["Gwynyth", "Ryn", "Cyndy", "Rahmath"];
const condition = name =>  !(name.match(/[aeiou]/ig));
</i>
</testcase>
<testcase>
<i>
// Names with more than 7 letters
const participants = ["Barcelona", "Beatles", "Patrick", "Kardashian"];
const condition = name => name.length > 7;
</i>
</testcase>
<testcase>
<i>
// Names with a vowel present
const participants = ["Sam", "Lao", "Linh", "Bryn"];
const condition = name =>  (name.match(/[aeiou]/ig));
</i>
</testcase>
</testcases>
</codeblock>
