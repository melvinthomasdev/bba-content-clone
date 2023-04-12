Here is a list of attendance percentages of students from roll-numbers 1-10 respectively:

`["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]`

Print out the attendance percentage of students with even roll numbers in the format:

`The attendance percentage of roll number: 2 is [attendance percentage value], roll number: 4 is [attendance percentage value], ... and roll number: 10 is [attendance percentage value].`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const displayAverageAttendanceOfEvenRollNumbers = (attendancePercentages) => {
  //Write code here
};
</code>
<solution>
const displayAverageAttendanceOfEvenRollNumbers = (attendancePercentages) => {
  console.log(`The attendance percentage of roll number: 2 is ${attendancePercentages[1]}, roll number: 4 is ${attendancePercentages[3]}, roll number: 6 is ${attendancePercentages[5]}, roll number: 8 is ${attendancePercentages[7]} and roll number: 10 is ${attendancePercentages[9]}.`);
};
</solution>
<testcases>
<caller>
displayAverageAttendanceOfEvenRollNumbers(attendancePercentages)
</caller>
<testcase>
<i>
const attendancePercentages = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]
</i>
</testcase>
<testcase>
<i>
const attendancePercentages = ["50", "24", "83", "71", "100", "33", "19", "89", "87", "23"]
</i>
</testcase>
<testcase>
<i>
const attendancePercentages = ["41", "44", "10", "29", "40", "38", "75", "98", "08", "83"]
</i>
</testcase>
</testcases>
</codeblock>
