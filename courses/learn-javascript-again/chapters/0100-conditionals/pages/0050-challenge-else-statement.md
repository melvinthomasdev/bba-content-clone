We have two variables,
`number` and `message`.

We also have an `if` statement
that checks if the value of
`number` is greater than `3`.
If the condition is `true`,
it stores `"Number is greater than 3"`
in the `message` variable.

Add an `else` statement,
which stores `"Number is not greater than 3"`
in the `message` variable.

For example:
```js
Input: number = 6

Output: "Number is greater than 3"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const number = 2;
let message;

if (number > 3) {
  message = "Number is greater than 3";
}

console.log(message);
</code>

<solution>
const number = 2;
let message;

if (number > 3) {
  message = "Number is greater than 3";
} else {
  message = "Number is not greater than 3";
}

console.log(message);
</solution>
</codeblock>
