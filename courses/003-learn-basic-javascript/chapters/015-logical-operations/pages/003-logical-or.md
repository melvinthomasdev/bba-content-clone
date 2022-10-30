We can use OR `||` to confirm
at least one condition is `true`
before executing a block of code.

<Editor lang="javascript">
<code>
let studentFrom = "India";
let stundentGrade = "B";
let courseFee = 1000;

if (studentFrom == "India" || stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.05);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 5%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
to get the discount,
either the student should be from `India`
or
received an `A` grade.

When both conditions are `false`,
the student does not get any discount.
The code inside the `else` statement executes.

<Editor lang="javascript">
<code>
let studentFrom = "Japan";
let stundentGrade = "B";
let courseFee = 1000;

if (studentFrom == "India" || stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.05);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 5%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
we change the value of `studentFrom` to `Japan`
and
`stundentGrade` to `B`.
Since both the conditions in the `if` statement
are not satisfied,
the student is not eligible for any discount.

We can also use OR `||` to confirm
a variable is neither `null` nor `undefined`.

<Editor lang="javascript">
<code>
let studentFrom = "Japan";
let stundentGrade;
let courseFee = 1000;

if (stundentGrade === null || stundentGrade === undefined) {
  console.log(`Student grade must be provided`);

} else if (studentFrom == "India" || stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.05);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 5%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
if the value store in
the `stundentGrade` variable
is either `null` or `undefined`
we get the output **Student grade must be provided**.

However, we can use a shorthand
for the above comparison.
In the example given below,
`stundentGrade == null` is a shorthand for
comparing `stundentGrade === null || stundentGrade === undefined`.

<Editor lang="javascript">
<code>
let studentFrom = "Japan";
let stundentGrade = null;
let courseFee = 1000;

if (stundentGrade == null) {
  console.log(`Student grade must be provided`);

} else if (studentFrom == "India" || stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.05);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 5%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>