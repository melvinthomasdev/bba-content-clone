Using your knowledge on
conditionals, try solving
the challenge described
below. Try not to scroll
down or take a peek at
the solution.

We have grade and attendance
of a student.
The student will get a discount of **10%**
on their course fee only if:
- Student has  attendance **"75%"** or above.
- Student has grade **"A"**.

Write a program such that
even if one of the conditions
does not evaluate to `true`,
the student does not get
the discount and log to
the console
`Your course fee is: [courseFee].`
or else log
`Your course fee is: [discountedFee]. You got a discount of [discount]%.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const student = { 
  attendance: 78,
  grade: "A"
};
const discount = 10;
const courseFee = 1000;
// Write code here...
</code>
<solution>
const student = {
  nationality: "India",
  grade: "A",
};
const discount = 10;
const courseFee = 1000;

if (student.attendance > 74 && student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount) / 100;
  console.log(
    `Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`
  );
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</solution>
</codeblock>

Here, there is a possibility that
some of us solved the problem chaining 
if statements as seen in the code 
given below:

```js
if (student.attendance > 74) {
  if (student.grade === "A"){
    console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
  }
} else {
    console.log(`Your course fee is: ${courseFee}.`);
  }
```

Now take a look at the code snippet
below which is taken from the
solution the we have provided:
```js
if (student.attendance > 74 && student.grade === "A") {
  const discountedFee = courseFee - (courseFee * discount) / 100;
  console.log(
    `Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`
  );
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
```

As we can see, we have written
the same code in much simpler
terms by combining both if
conditions into a single one
by using the AND operator - `&&`.

Sometimes we need to confirm that
multiple conditions are `true`
and only then the code should be
executed.

If either of the conditions are
`false` or if both of them are
`false`, the `else` code block
should not get executed.
This can be done using `&&`
operator.

This behavior can be represented in a table
as shown below.

| student.attendance > 74  | student.grade === "A"      | Result |
| ------------------------ | -------------------------- | ------ |
| true                     | true                       | true   |
| true                     | false                      | false  |
| false                    | true                       | false  |
| false                    | false                      | false  |

Let's take the another example, in this
case the value of `student.grade` is now `B`,
making the student ineligible for the 10% discount.

<codeblock language="javascript" type="lesson">
<code>
const student ={
  attendance: 78,
  grade: "B",
};
const discount = 10;
const courseFee = 1000;

if (student.attendance > 74 && student.grade === "A") {
  const discountedFee = courseFee - (courseFee \* discount / 100);
  console.log(`Your course fee is: ${discountedFee}. You got a discount of ${discount}%.`);
} else {
  console.log(`Your course fee is: ${courseFee}.`);
}
</code>
</codeblock>
