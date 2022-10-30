The function `marksInRange` should return the object that satisfies the upper and lower limit conditions.

1. Return stringified object.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
const marksInRange = (marksArr,upper_limit,lower_limit) => {
  // your code here
}
</code>

<solution>
const marksInRange = (marksArr, upper_limit, lower_limit) => {
  return JSON.stringify(
    marksArr.filter((e) => e.marks >= lower_limit && e.marks <= upper_limit)
  );
};
</solution>

<testcases>
<caller>
console.log(marksInRange(marksArr,upper_limit,lower_limit));
</caller>
<testcase>
<i>
const marksArr = [
  { student: "Phoebe", marks: 44 },
  { student: "Ross", marks: 78 },
  { student: "Monica", marks: 89 },
];
const lower_limit = 50;
const upper_limit = 80;
</i>
</testcase>
<testcase>
<i>
const marksArr = [
  { student: "Bruce", marks: 32 },
  { student: "Tony", marks: 42 },
  { student: "Natasha", marks: 52 },
  { student: "Steve", marks: 62 },
  { student: "Thor", marks: 72 },
  { student: "Clint", marks: 82 },
];
const lower_limit = 42;
const upper_limit = 72;
</i>
</testcase>
<testcase>
<i>
const marksArr = [
  { student: "Frodo", marks: 31 },
  { student: "Sam", marks: 51 },
  { student: "Oliver", marks: 71 },
  { student: "Pippin", marks: 91 },
];
const lower_limit = 32;
const upper_limit = 50;
</i>
</testcase>
</testcases>
</Editor>