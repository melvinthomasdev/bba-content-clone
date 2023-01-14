We can use the OR operator - `||`,
to confirm if at least
one condition is `true`
before executing a block of code.

For example, let's say we have
the location and grade of a student.
The student will get
a discount of **5%**
on their course fee either if
the student is from **"India"**
or if the student has the grade **"A"**.
Therefore to get the discount,
at least one of the
conditions must be `true`:

1. Student is from **"India"**.
2. Student has grade **"A"**.

Only if both the conditions
evaluate to `false`,
the student does not get the discount.
We can perform this check
in a single `if` statement
as shown in the code below:

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "India",
  grade: "B",
};
const discount = 5;
const courseFee = 1000;

if (student.nationality === "India" || student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

In the example given above,
the `if` statement has two conditions -
`student.nationality === "India"`
and `student.grade === "A"`,
combined with the `||` operator.
This means that the code block
of the `if` statement will
be executed if at least
one of the conditions are `true`.
If both of them are `false`
the `else` code block will get executed.
This can be represented in a table
as shown below.

| student.nationality === "India" | student.grade === "A" | Result |
| ------------------------------ | -------------------- | ------ |
| true                           | true                 | true   |
| true                           | false                | true   |
| false                          | true                 | true   |
| false                          | false                | false  |

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "Japan",
  grade: "B",
};
const discount = 5;
const courseFee = 1000;

if (student.nationality === "India" || student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

In the example given above,
the value of the
`student.nationality` variable is `"Japan"`
and the value of the
`student.grade` variable is `"B"`.
Since both the conditions
in the `if` statement are `false`,
the student is not eligible for the discount
and the `else` block gets executed.

We can also use the `||` operator to confirm
a variable is neither `null` nor `undefined`.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "Japan"
};
const discount = 5;
const courseFee = 1000;

if (student.grade === null || student.grade === undefined) {
  console.log("Student grade must be provided");
} else if (student.nationality === "India" || student.grade === "A") {
  discountedFee = courseFee - (courseFee * discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

In the example given above,
since the value of
the `student.grade` variable
is `undefined`,
we get the output
**"Student grade must be provided"**.
We would get the same output
if the value of
the `student.grade` variable
was `null`.

We can use a shorthand
for the above comparison.
In the example given below,
`student.grade === null` is a shorthand for
comparing `student.grade === null || student.grade === undefined`.

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "Japan",
  grade: null,
};
const discount = 5;
const courseFee = 1000;

if (student.grade === null) {
  console.log("Student grade must be provided");
} else if (student.nationality === "India" || student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>