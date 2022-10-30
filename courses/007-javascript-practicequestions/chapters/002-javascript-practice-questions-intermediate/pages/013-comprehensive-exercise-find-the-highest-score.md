The function `highestScore` should return the highest score from an array of scores.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function highestScore(scores) {
  // your code here
}
</code>

<solution>
function highestScore(scores) {
  return Math.max(...scores);
}
</solution>

<testcases>
<caller>
console.log(highestScore(scores));
</caller>
<testcase>
<i>
const scores = [20, 32, 51, 103, 88, 26];
</i>
</testcase>
<testcase>
<i>
const scores = [24, 3, 15, 52, 4, 9, 55, 18, 45, 10];
</i>
</testcase>
<testcase>
<i>
const scores = [32, 78, 9, 109, 69, 9, 1, 12];
</i>
</testcase>
</testcases>
</Editor>