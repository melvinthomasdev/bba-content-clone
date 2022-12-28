Sometimes we need to confirm that
multiple conditions are `true`
before executing a block of code.
In such cases,
we can use the AND operator - `&&`.

For example, let's say we have
the location and grade of a student.
The student will get
a discount of **10%**
on their course fee only if
the student is from **"India"**
and has the grade **"A"**.
Therefore to get the discount,
two conditions must be `true`:

1. Student is from **"India"**.
2. Student has grade **"A"**.

Even if one of the conditions
does not evaluate to `true`,
the student does not get the discount.
We can perform this check
in a single `if` statement
as shown in the code below:

<codeblock language="javascript" type="lesson">
<code>
const student = {
  nationality: "India",
  grade: "A",
}
const discount = 10;
const courseFee = 1000;

if (student.nationality === "India" && student.grade === "A") {
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
combined with the `&&` operator.
This means that the code block
of the `if` statement will only
be executed if both the conditions are `true`.
If either of them are `false` or
if both of them are `false`,
the `else` code block will get executed.
This can be represented in a table
as shown below.

| student.nationality === "India" | student.grade === "A" | Result |
| ------------------------------ | -------------------- | ------ |
| true                           | true                 | true   |
| true                           | false                | false  |
| false                          | true                 | false  |
| false                          | false                | false  |

<codeblock language="javascript" type="lesson">
<code>
const student ={
  nationality: "India",
  grade: "B",
};
const discount = 10;
const courseFee = 1000;

if (student.nationality === "India" && student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>

In the example given above,
the value of `student.grade` is now `B`,
making the student ineligible
for the 10% discount.
