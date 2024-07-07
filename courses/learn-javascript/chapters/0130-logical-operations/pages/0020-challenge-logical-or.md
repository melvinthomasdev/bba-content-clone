Using the `||` operator
in the `if` condition,
check if the value of the
`personName` variable is `"Oliver"`
or if the value of the
`isAdmin` variable is `false`.

If at least one condition is satisfied,
execute the `if` code block.
Otherwise, execute the `else` code block.

For example:
```js
Input: personName = "Sam", isAdmin = true

Output: "Your coupon's value is: 50"
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const personName = "Oliver";
const isAdmin = false;

if () {
  console.log("Your coupon's value is: 100");
} else {
  console.log("Your coupon's value is: 50");
}
</code>

<solution>
const personName = "Oliver";
const isAdmin = false;

if (personName === "Oliver" || isAdmin === false) {
  console.log("Your coupon's value is: 100");
} else {
  console.log("Your coupon's value is: 50");
}
</solution>
</codeblock>
