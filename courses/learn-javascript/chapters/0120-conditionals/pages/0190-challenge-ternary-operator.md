Use the ternary operator
to store **"Adult"**
in the `status` variable
if the value of the `age` variable
is greater than or equal to `18`.
Otherwise, store **"Minor"**
in the `status` variable.

Use `console.log` to show
the value of the `status` variable.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const age = 17;
const status = ;

console.log(status);
</code>

<solution>
const age = 17;
const status = (age >= 18) ? "Adult" : "Minor";

console.log(status);
</solution>
</codeblock>
