The function `marksInRange` should return the object that satisfies the upper and lower limit conditions.

1. Return stringified object.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const marksInRange = ({ marksArr,upperLimit,lowerLimit }) => {
  // your code here
}
</code>

<solution>
const marksInRange = ({ marksArr, upperLimit, lowerLimit }) =>
  JSON.stringify(
    marksArr.filter(e => e.marks >= lowerLimit && e.marks <= upperLimit)
  );
</solution>

<testcases>
<caller>
console.log(marksInRange({ marksArr,upperLimit,lowerLimit }));
</caller>
<testcase>
<i>
const marksArr = [
  { student: "Phoebe", marks: 44 },
  { student: "Ross", marks: 78 },
  { student: "Monica", marks: 89 },
];
const lowerLimit = 50;
const upperLimit = 80;
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
const lowerLimit = 42;
const upperLimit = 72;
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
const lowerLimit = 32;
const upperLimit = 50;
</i>
</testcase>
</testcases>
</codeblock>