Using your knowledge on
conditionals, try solving
the challenge described
below. Try not to scroll
down or take a peek at
the solution.

We have grade and attendance
of a student.
The student will get a discount of ₹3000
on their course fee only if:
- Student have scored 75 or above.
- Student has done an internship.

Write a program such that
even if one of the conditions
does not evaluate to `true`,
the student does not get
the discount and log to
the console
`Your course fee is: [courseFee].`
or else log
`Your course fee is: [discountedFee]. We have discounted ₹3000 of it.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const courseFee = 10000;
const courseDiscountAmount = 3000;
const student = { 
  marks: 78,
  internshipDone: true
};
// Write code here...
</code>
<solution>
const courseFee = 10000;
const courseDiscountAmount = 3000;
const student = { 
  marks: 78,
  internshipDone: true
};
if (student.marks >= 75 && student.internshipDone) {
  const discountedFee = courseFee - courseDiscountAmount;
  console.log(`Your course fee is: ${discountedFee}.`);
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
if (student.marks >= 75) {
  if (student.internshipDone){
    const discountedFee = courseFee - courseDiscountAmount;
    console.log(`Your course fee is: ${discountedFee}.`);
  }
} else {
    console.log(`Your course fee is: ${courseFee}.`);
  }
```

Now take a look at the code snippet
below which is taken from the
solution the we have provided:
```js
if (student.marks >= 75 && student.internshipDone) {
  const discountedFee = courseFee - courseDiscountAmount;
  console.log(`Your course fee is: ${discountedFee}.`);
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
before a set of code is executed.

If either of the conditions are
`false` or if both of them are
`false`, the `else` code block
will get executed.
This can be done using `&&` operator.

This behavior can be represented in a table
as shown below.

| student.marks >= 75      | student.internshipDone     | Result |
| ------------------------ | -------------------------- | ------ |
| true                     | true                       | true   |
| true                     | false                      | false  |
| false                    | true                       | false  |
| false                    | false                      | false  |

