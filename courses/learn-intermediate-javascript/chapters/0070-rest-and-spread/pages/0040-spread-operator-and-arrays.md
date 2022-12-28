We can use the spread operator
to insert the elements of an array
into another array.

<codeblock language="javascript" type="lesson">
<code>
const studentMarks = [72, 84, 96];
const studentMarksCopy = [...studentMarks];

console.log(studentMarksCopy);
</code>
</codeblock>

In the example given above,
we are using the spread operator
to insert the elements from `studentMarks`
into `studentMarksCopy`.

In addition,
we can also add other elements to an array,
along with the spread operator,
as show in the example below.

<codeblock language="javascript" type="lesson">
<code>
const studentMarks = [72, 84, 96];
const updatedStudentMarks = [100, ...studentMarks, 90, 78];

console.log(updatedStudentMarks);
</code>
</codeblock>

Similarly,
we can insert elements from multiple arrays at once.

<codeblock language="javascript" type="lesson">
<code>
const studentMarksSem1 = [72, 84, 96];
const studentMarksSem2 = [100, 90, 78];
const allStudentMarks = [...studentMarksSem1, ...studentMarksSem2];

console.log(allStudentMarks);
</code>
</codeblock>