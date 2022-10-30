We can use `try...catch` to
catch the errors in a block of code.
We test our code for errors
in the `try {...}` block
and
handle the error
in the `catch {...}` block.

In general, when the code block has an error,
the code execution stops immediately.
But, when we use `try...catch`,
we can continue executing our code even when
there is an error in the code.

In the example given below,
since there are no errors,
the `try {...}` block executes
and
ignores the `catch {...}` block.

<Editor lang="javascript">
<code>
try {
  console.log("No error in this block of code!")
} catch {
  console.log("This message will not show");
}
</code>
</Editor>

In the example given below,
the `try {...}` block executes
till there is an error.

<Editor lang="javascript">
<code>
try {
  console.log("No error at this point");
  const newVariable = 0;
  newVariable = 10;
  console.log("This message will not show because we're assigning a const variable a new value");
} catch {
  console.log("Error message: There is an error");
}
</code>
</Editor>

Since `newVariable` is a `const`, we
cannot store a different value in it
like we are doing in this example.
This results in an error.
When we encounter the error,
the `catch {..}` block executes.

But, `try...catch` works only with valid JavaScript code.
