Sometimes we need to confirm
multiple conditions are `true`
before executing a block of code.
In such cases, we can use AND `&&`.

<Editor lang="javascript">
<code>
let studentFrom = "India";
let stundentGrade = "A";
let courseFee = 1000;

if (studentFrom == "India" && stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.1);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 10%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
if the student is from `India`
and
received an `A` grade,
then the student gets a discount of 10%.
Therefore to get the discount,
both the conditions must be `true`.

Even if one condition does not evaluate to `true`,
the student does not get any discount.

<Editor lang="javascript">
<code>
let studentFrom = "India";
let stundentGrade = "B";
let courseFee = 1000;

if (studentFrom == "India" && stundentGrade == "A") {

  courseFee = courseFee - (courseFee * 0.1);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 10%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
we change the value of `stundentGrade` to `B`,
making the student ineligible for any discount.