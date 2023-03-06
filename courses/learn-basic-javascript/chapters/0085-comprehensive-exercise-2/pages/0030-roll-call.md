Given is the list of average attendance of students from roll-numbers 1-10 respectively.
`
["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]
`
Display the average attendance of roll numbers 6, 7 and 10 expected as:

```
The average attendance of:
- Roll number 6 is X%.
- Roll number 7 is Y%.
- Roll number 10 is Z%.
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
</code>
<solution>
const studentAttendance = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"];

const getAverageAttendance = (attendance) => {
  return `The average attendance of:
    - Roll number 6 is ${attendance[5]}%.
    - Roll number 7 is  ${attendance[6]}%.
    - Roll number 10 is  ${attendance[9]}%.`;
};
getAverageAttendance(studentAttendance);
</solution>
<testcases>
<caller>
console.log(getAverageAttendance(newAttendance))
</caller>
<testcase>
<i>
const newAttendance = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]
</i>
</testcase>
<testcase>
<i>
const newAttendance = ["50", "24", "83", "71", "100", "33", "19", "89", "87", "23"]
</i>
</testcase>
<testcase>
<i>
const newAttendance = ["41", "44", "10", "29", "40", "38", "75", "98", "08", "83"]
</i>
</testcase>
</testcases>
</codeblock>
