Here is a list of attendance percentages of students from roll-numbers 1-10 respectively:

`["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"]`

Print out the attendance percentage of students with even roll numbers in the format:

`The attendance percentage of roll number: 2 is [attendance percentage value], roll number: 4 is [attendance percentage value], ... and roll number: 10 is [attendance percentage value].`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const attendancePercentages = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"];

//Write your code here
</code>
<solution>
const attendancePercentages = ["68", "44", "83", "78", "91", "33", "57", "89", "80", "32"];

console.log(`The attendance percentage of roll number: 2 is ${attendancePercentages[1]}, roll number: 4 is ${attendancePercentages[3]}, roll number: 6 is ${attendancePercentages[5]}, roll number: 8 is ${attendancePercentages[7]} and roll number: 10 is ${attendancePercentages[9]}.`);
</solution>
</codeblock>
