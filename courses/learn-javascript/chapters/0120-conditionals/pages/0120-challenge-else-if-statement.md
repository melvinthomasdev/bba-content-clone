We have two variables,
`number` and `message`.
We also have an `if` statement
which checks if the value of
`number` is greater than `3`.
If the condition is `true`,
it stores `"number is greater than 3"`
in the `message` variable.

We also have an `else` statement
which stores `"number is lesser than 3"`
in the `message` variable
if the condition in the `if` statement
results in `false`.

Add an `else if` statement in between
the `if` and `else` statements,
to store `"number is equal to 3"`
in the `message` variable,
if the value of the `number` variable
is equal to `3`.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const number = 3;
let message;

if (number > 3) {
  message = "Number is greater than 3";
} else {
  message = "Number is lesser than 3";
}

console.log(message);
</code>

<solution>
const number = 3;
let message;

if (number > 3) {
  message = "Number is greater than 3";
} else if (number === 3) {
  message = "Number is equal to 3";
} else {
  message = "Number is lesser than 3";
}

console.log(message);
</solution>
</codeblock>
