Use `||` in the `if` condition
to confirm that `personName` stores `Oliver`
and
`isAdmin` stores `false`.

If at least one condition is satisfied,
show the message in the first `console.log()`statement.
Otherwise, show the message in
the second `console.log()`statement.

<Editor lang="javascript" type="exercise">
<code>
let personName = "Oliver";
let isAdmin = false;

if () {

  console.log(`Your coupon's value is: 100`);

} else {

  console.log(`Your coupon's value is: 50`);

}
</code>

<solution>
let personName = "Oliver";
let isAdmin = false;

if (personName == "Oliver" || isAdmin == false) {
  
  console.log(`Your coupon's value is: 100`);

} else {

  console.log(`Your coupon's value is: 50`);

}
</solution>
</Editor>