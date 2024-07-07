Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
try {
  console.log("Transaction starts");

  const transaction = {
    from: "Adam Smith",
    to: "Sam Smith",
    amount: "100000",
  };

  console.log(`Transferred ${transaction.amount} to ${transaction.to}`);

  console.log("Transaction ended");
} catch (error) {
  console.log("Something went wrong");
}
</code>
</codeblock>

In the example given above,
the code in `try` was executed
without any errors.

<codeblock language="javascript" type="lesson">
<code>
try {
  console.log("Transaction starts");

  const transaction = {
    from: "Adam Smith",
    to: "Sam Smith",
    amount: "100000",
  };

  console.log(`Transferred ${transaction.amount} to ${transfer.to}`);

  console.log("Transaction ended");
} catch (error) {
  console.log("Something went wrong");
}
</code>
</codeblock>

In the example given above,
there was an error in the `try` code block
since we had used
an undefined variable `transfer`.
Because of that,
the output starts with **"Transaction starts"**
but does not have **"Transaction ended"**
at the end.

Here, we want **"Transaction ended"**
to be displayed at the end
regardless of if an error
occurred in the `try` block or not.
In such situations,
we use the `finally` block.

<codeblock language="javascript" type="lesson">
<code>
try {
  console.log("Transaction starts");

  const transaction = {
    from: "Adam Smith",
    to: "Sam Smith",
    amount: "100000",
  };

  console.log(`Transferred ${transaction.amount} to ${transfer.to}`);
} catch (error) {
  console.log("Something went wrong");
} finally {
  console.log("Transaction ended");
}
</code>
</codeblock>

In the example given above:

- `console.log("Transaction starts")` displayed
  the message **"Transaction starts"**.

- There was an error because in `transfer.to`
  the `transfer` object was not defined.
  Hence the `catch` block was executed,
  which displayed the message **"Something went wrong"**.

- Then the `finally` block was executed,
  which displayed the message **"Transaction ended"**.

The `finally` block will also be executed
if the `try` block is executed
without any errors.

<codeblock language="javascript" type="lesson">
<code>
try {
  console.log("Transaction starts");

  const transaction = {
    from: "Adam Smith",
    to: "Sam Smith",
    amount: "100000",
  };

  console.log(`Transferred ${transaction.amount} to ${transaction.to}`);
} catch (error) {
  console.log("Something went wrong");
} finally {
  console.log("Transaction ended");
}
</code>
</codeblock>

In the example given above:

- `console.log("Transaction starts")` displayed
  the message **"Transaction starts"**.

- Since there was no error in the `try` block,
  the **"Transferred 100000 to Sam Smith"**
  message was displayed.

- Then the `finally` block was executed,
  which displayed the message **"Transaction ended"**.

So to summarize,
the `finally` block can be used
whenever we want to execute
a particular set of statements
independent of what happens
in the `try` or `catch` blocks.
