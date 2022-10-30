The `else if` statement is used along with the `if` and `else` statements. It is used to execute blocks of code conditionally when there are more than two conditions.

In the example give below,
the value of the `number` variable is `0`.

- The `if` statement checks if the number is greater than 0.

- The `else if` statement checks if the number is equal to 0.

- The `else` condition executes when none of the previous conditions is met.

Since the value of `number` is 0, the code in the `else if` block executes.

<Editor lang="javascript">
<code>
let number = 0;

if (number > 0) {
  console.log("The number is positive.");
} else if (number == 0) {
  console.log("The number is 0.");
} else {
  console.log("The number is negative.");
}
</code>
</Editor>

We can change the value of `number` to -1 and see that the code inside the `else` statement executes.

<Editor lang="javascript">
<code>
let number = -1;

if (number > 0) {
  console.log("The number is positive.");
} else if (number == 0) {
  console.log("The number is 0.");
} else {
  console.log("The number is negative.");
}
</code>
</Editor>

Depending upon the number of conditions, we can add as many `else if` statements as needed. They must be added between the `if` and `else` statements.