For a list of participants, and a given condition, we should find a list of only those whose passes a given condition.

1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function removeUnMatched(participants, condition) {
  // your code here
}
</code>

<solution>
function removeUnMatched(participants, condition) {
  return JSON.stringify(participants.filter((...items) => condition(...items)));
}
</solution>

<testcases>
<caller>
console.log(removeUnMatched(participants, condition));
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
</testcases>
</Editor>