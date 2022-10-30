A `switch` statement is used when we have multiple conditions leading to different results.

Different **cases** can provide us different **values** in a switch statement:

- We pass in a value to the `switch` statement.

- This expression is then compared, with the value of each `case` statement, to see if there's a **matching** value.

- If a matching case is found, then the code block of that case executes.

- If no match is found, then the **default** code block executes.

In the example given below,
we get the role of people in a company,
based on their name.
When the value of `name` matches with a case,
the code block of that case executes.

<Editor lang="javascript">
<code>
let name = "Anna";

switch(name) {
  case "Oliver":
    console.log("This is the owner.");
    break;
  case "Anna":
    console.log("This is the admin.");
    break;
  case "Mike":
    console.log("This is the manager.");
    break;
  default:
    console.log("This person does not have a role.");
    break;
}
</code>
</Editor>

The `break` keyword is used to exit the execution of a `switch` statement. If the `break` keyword is not present at the end of a code block, then the `switch` statement continues execution, irrespective of whether the value of `name` is matched or not.

<Editor lang="javascript">
<code>
let name = "Anna";

switch(name) {
  case "Oliver":
    console.log("This is the owner.");
    break;
  case "Anna":
    console.log("This is the admin.");
  case "Mike":
    console.log("This is the manager.");
    break;
  default:
    console.log("This person does not have a role.");
    break;
}
</code>
</Editor>

In the example given below,
when the value of `name` does not match with any case value, then the code block of the **default** case executes.

<Editor lang="javascript">
<code>
let name = "Peter";

switch(name) {
  case "Oliver":
    console.log("This is the owner.");
    break;
  case "Anna":
    console.log("This is the admin.");
    break;
  case "Mike":
    console.log("This is the manager.");
    break;
  default:
    console.log("This person does not have a role.");
    break;
}
</code>
</Editor>