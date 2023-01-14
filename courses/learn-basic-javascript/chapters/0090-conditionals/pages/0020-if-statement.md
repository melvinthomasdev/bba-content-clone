We can use the `if` statement
to execute a block of code
when the given condition
evaluates to `true`.
Let's see how the `if` statement
is used in the example below.

<codeblock language="javascript" type="lesson">
<code>
const age = 12;
const votingAge = 18;

if (age < votingAge) {
  console.log("Person is not eligible to vote");
}
</code>
</codeblock>

In the example given above:

- The `if` keyword is followed
  by the **condition** to be checked
  inside the `()` parentheses.

- The condition can be
  any valid JavaScript expression
  that can result in a Boolean value,
  i.e., `true` or `false`.

- The condition is followed by
  the **code block** defined
  within the curly braces `{}`.
  That code block will only be executed
  if the **condition** evaluates to
  a Boolean value `true`.

- Since the condition
  `age < votingAge` evaluates to `true`,
  the code block is executed
  and
  we get the output,
  **"Person is not eligible to vote"**.

In the following example,
the given condition `age >= votingAge`
evaluates to `false`.
Hence the code inside
the block is not executed,
and there is **no message in the output**.

<codeblock language="javascript" type="lesson">
<code>
const age = 12;
const votingAge = 18;

if (age >= votingAge) {
  console.log("Person is eligible to vote");
}
</code>
</codeblock>