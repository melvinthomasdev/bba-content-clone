The code below causes an error.
Change the position of the `console.log`
statement in such a way
that the code works.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const displayTotalMarks = () => {
  const studentMarks = [92, 78, 94, 86];
  const totalMarks = studentMarks.reduce((partialSum, mark) => partialSum + mark, 0);
}

displayTotalMarks();
console.log(`Total Marks: ${totalMarks}`);
</code>

<solution>
const displayTotalMarks = () => {
  const studentMarks = [92, 78, 94, 86];
  const totalMarks = studentMarks.reduce((partialSum, mark) => partialSum + mark, 0);
  console.log(`Total Marks: ${totalMarks}`);
}

displayTotalMarks();
</solution>
</codeblock>