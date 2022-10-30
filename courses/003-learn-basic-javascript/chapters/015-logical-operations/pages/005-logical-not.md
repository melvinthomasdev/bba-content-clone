NOT `!` returns `true` if the value is `false`
and
`false` if the value is `true`.

<Editor lang="javascript">
<code>
let stundentGrade = "A";
let courseFee = 1000;

if (!(stundentGrade == "D")) {

  courseFee = courseFee - (courseFee * 0.02);
  console.log(`Your course fee is: ${courseFee}. You got a discount of 2%.`);

} else {

  console.log(`Your course fee is: ${courseFee}.`);

}
</code>
</Editor>

In the example given above,
all the students whose grade is not `D`
receive a discount of 2%.