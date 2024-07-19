Using the `&&` operator
in the `if` condition,
check if the value of the
`name` variable is **Sam Smith**
and the value of the
`isAdmin` variable is `true`.

If both the conditions are satisfied,
the `if` code block
should get executed.
Otherwise, the `else` code block
should get executed.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const name = "Sam Smith";
const isAdmin = true;

if () {
  console.log("Your coupon's value is: 100");
} else {
  console.log("Your coupon's value is: 50");
}
</code>

<solution>
const name = "Sam Smith";
const isAdmin = true;

if (name === "Sam Smith" && isAdmin) {
  console.log("Your coupon's value is: 100");
} else {
  console.log("Your coupon's value is: 50");
}
</solution>
</codeblock>
