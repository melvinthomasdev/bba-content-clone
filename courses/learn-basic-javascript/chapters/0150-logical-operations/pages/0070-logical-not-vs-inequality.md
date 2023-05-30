Let's say we have the
`grade` and `nationality`
of a `student`
and we need to display
**"You get a 10% discount on your course fee"**
for any value of `student.grade`
other than **"D"**.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  grade: "A",
  nationality: "Indian",
};

if (!(student.grade === "D")) {
  console.log("You get a 10% discount on your course fee");
}
</code>
</codeblock>

The condition
`!(student.grade === "D")`
in the example above,
is logically correct.
However, we should prefer
using the `!==` operator
for such conditions,
where there is only
one expression in the condition
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  grade: "A",
  nationality: "Indian",
};

if (student.grade !== "D") {
  console.log("You get a 10% discount on your course fee");
}
</code>
</codeblock>

Let's say we need to display
**"You get a 10% discount on your course fee"**
when `student.grade` is not `"D"`
and
`student.nationality` is not `"India"`.
Since we need to make
two comparisons here,
it is fine to use the
`!` operator
as shown below.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  grade: "A",
  nationality: "Indian",
};

if (!(student.grade === "D" && student.nationality === "India")) {
  console.log("You get a 10% discount on your course fee");
}
</code>
</codeblock>