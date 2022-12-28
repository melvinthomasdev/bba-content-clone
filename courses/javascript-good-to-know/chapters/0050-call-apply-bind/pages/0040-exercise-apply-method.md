​
Invoke the `displayMarksBreakdown` function such that,
the `this` keyword refers to `student`.
Pass the three elements of `marks` as arguments
for the three arguments in the `displayMarksBreakdown` function.
​
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const student = { name: "Sam Smith" };

const marks = [69, 70, 81];

function displayMarksBreakdown(sem1, sem2, sem3) {
  console.log(`Marks breakdown for ${this.name}:`);
  console.log(`Semester 1 mark: ${sem1}`);
  console.log(`Semester 2 mark: ${sem2}`);
  console.log(`Semester 3 mark: ${sem3}`);
}
</code>

<solution>
const student = { name: "Sam Smith" };

const marks = [69, 70, 81];

function displayMarksBreakdown(sem1, sem2, sem3) {
  console.log(`Marks breakdown for ${this.name}:`);
  console.log(`Semester 1 mark: ${sem1}`);
  console.log(`Semester 2 mark: ${sem2}`);
  console.log(`Semester 3 mark: ${sem3}`);
}

displayMarksBreakdown.apply(student, marks);
</solution>
</codeblock>
​

​
