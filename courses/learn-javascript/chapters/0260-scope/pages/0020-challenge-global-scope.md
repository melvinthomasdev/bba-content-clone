The code given below shows an error -
`studentMarks is not defined`.
Move the definition of `studentMarks`
to fix that error.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const displayTotalMarks = () => {
  const studentMarks = [92, 78, 94, 86];
  const totalMarks = studentMarks.reduce((partialSum, mark) => partialSum + mark, 0);
  console.log(`Total Marks: ${totalMarks}`);
}

const marksAbove90 = studentMarks.filter(mark => mark > 90);
console.log(`Marks above 90: ${marksAbove90}`);
displayTotalMarks();
</code>

<solution>
const studentMarks = [92, 78, 94, 86];

const displayTotalMarks = () => {
  const totalMarks = studentMarks.reduce((partialSum, mark) => partialSum + mark, 0);
  console.log(`Total Marks: ${totalMarks}`);
}

const marksAbove90 = studentMarks.filter(mark => mark > 90);
console.log(`Marks above 90: ${marksAbove90}`);
displayTotalMarks();
</solution>
</codeblock>