Use the ternary operator
to store **Adult** in the `status` variable
if the `age` is greater than or equal to `18`.
Otherwise, store **Minor**.

Use `console.log` to show the value of `status`.

<Editor lang="javascript" type="exercise">
<code>
let age = 17;
let status = ;

console.log(status);
</code>

<solution>
let age = 17;
let status = (age >= 18) ? "Adult" : "Minor";

console.log(status);
</solution>
</Editor>