Use `&&` in the `if` condition
to confirm that `personName` stores `Sam Smith`
and
`isAdmin` stores `true`.

If both the conditions are satisfied,
show the message in the first `console.log()`statement.
Otherwise, show the message in
the second `console.log()`statement.

<Editor lang="javascript" type="exercise">
<code>
let personName = "Sam Smith";
let isAdmin = true;

if () {

  console.log(`Your coupon's value is: 100`);

} else {

  console.log(`Your coupon's value is 50`);

}
</code>

<solution>
let personName = "Sam Smith";
let isAdmin = true;

if (personName == "Sam Smith" && isAdmin == true) {

  console.log(`Your coupon's value is: 100`);

} else {

  console.log(`Your coupon's value is: 50`);

}
</solution>
</Editor>