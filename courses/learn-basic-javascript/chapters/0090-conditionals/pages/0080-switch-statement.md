A `switch` statement is used
when we have multiple
equality conditions leading to
different results.

To build a switch statement:

- We pass an expression
  to the `switch` statement,
  i.e., within the parentheses
  of `switch()`. We can call this
  the **switch expression**.

- It is followed by a number of
  **cases**. Each **case** contains
  a **value** and a **code block**.

- All `switch` statements
  must also contain a
  **default** block.

- The value of the **switch expression**
  is then compared with the value
  of each **case**,
  to see if they are equal.

- The **code block** of the first
  **case** whose value is equal
  to the value of the **switch expression**
  is executed.

- If the value of the **switch expression**
  does not match with any of the **cases**,
  then the **default** code block is executed.

In the example given below,
we get the role of a person
in a company, based on their name.
When the value of `name`
matches with a case,
the code block of that
case is executed.

<codeblock language="javascript" type="lesson">
<code>
const name = "Anna";

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
</codeblock>

The above code displays **"This is the admin."**
because the value of the `name` variable
is equal to the value of the case **"Anna"**
and the code block for that case
contains `console.log("This is the admin.")`
followed by a `break` statement.

The `break` statement is used to
exit the execution
of a `switch` statement.
If the `break` statement is not present
at the end of a code block,
then the `switch` statement
continues execution to the next case block,
irrespective of whether
the value of `name` is
matched with that case or not.

<codeblock language="javascript" type="lesson">
<code>
const name = "Anna";

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
</codeblock>

The above code displays both
**"This is the admin."** and **"This is the manager."**
because the code block
for the case **"Anna"**
does not contain a `break` statement.
You can try removing
all the `break` statements and
see the result for different
values of the `name` variable.

In the example given below,
since the value of `name`
does not match with any case value,
then the code block of
the **default** case gets executed
and we ge the output -
**"This person does not have a role."**

<codeblock language="javascript" type="lesson">
<code>
const name = "Peter";

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
</codeblock>

The `default` block should always
be written after all the **cases**.
