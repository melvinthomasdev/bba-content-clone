Let's look at an example.
This code snippet checks if a value is neither
`null` nor `undefined` using the
`||` operator.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "Japan"
};
const courseFee = 1000;

if (student.grade === null || student.grade === undefined) {
  console.log("Student grade must be provided");
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

Since we do not have a `grade`
key in the `student` object,
value of `student.grade`
will be undefined, and
therefore we get the output
"Student grade must be provided".

We would get the same output
if the value of the
`student.grade` variable was `null`.
