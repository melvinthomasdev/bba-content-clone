The `else if` statement
is used along with the
`if` and `else` statements.
It is used to execute
blocks of code conditionally
when there are more than
two conditions.

In the example given below:

- The `if` statement checks
  if the value of `number`
  is greater than `0`.

- The `else if` statement checks
  if the value of `number`
  is equal to `0`.

- The `else` code block executes
  when none of the previous
  conditions are `true`.

Since the value of the `number` variable
is `0`:

- The `if` condition results
  in `false`, so it's code block
  is not executed.

- The `else if` condition results
  in `true`, so it's code block
  gets executed.

Hence the output will be **"The number is 0."**.

<codeblock language="javascript" type="lesson">
<code>
const number = 0;

if (number > 0) {
  console.log("The number is positive.");
} else if (number === 0) {
  console.log("The number is 0.");
} else {
  console.log("The number is negative.");
}
</code>
</codeblock>

If we change the value of the `number` variable
to `-1`:

- The `if` condition results
  in `false`, so it's code block
  is not executed.

- The `else if` condition results
  in `false`, so it's code block
  is not executed.

- Since all the above conditions
  resulted in `false`,
  the `else` code block gets executed.

Hence the output will be **"The number is negative."**.

<codeblock language="javascript" type="lesson">
<code>
const number = -1;

if (number > 0) {
  console.log("The number is positive.");
} else if (number === 0) {
  console.log("The number is 0.");
} else {
  console.log("The number is negative.");
}
</code>
</codeblock>

If we change the value of the
`number` variable to `7`,
the `if` condition results in `true`,
so it's code block gets executed.

Hence the output will be **"The number is positive."**.

<codeblock language="javascript" type="lesson">
<code>
const number = 7;

if (number > 0) {
  console.log("The number is positive.");
} else if (number === 0) {
  console.log("The number is 0.");
} else {
  console.log("The number is negative.");
}
</code>
</codeblock>

Depending upon the number of conditions,
we can add as many `else if`
statements as needed.
They must be added between the `if`
and `else` statements.

<codeblock language="javascript" type="lesson">
<code>
const number = -9;

if (number > 9) {
  console.log("The number is positive with multiple digits.");
} else if (number > 0) {
  console.log("The number is positive with single digit.");
} else if (number === 0) {
  console.log("The number is 0.");
} else if (number > -10) {
  console.log("The number is negative with single digit.");
} else {
  console.log("The number is negative with multiple digits.");
}
</code>
</codeblock>