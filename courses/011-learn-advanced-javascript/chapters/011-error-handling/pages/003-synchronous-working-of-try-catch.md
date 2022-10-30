If we want to catch the errors that occur
in schedulers like `setTimeout`,
then we must include `try...catch`
inside them.

In the example given below,
the `try {...}` block is placed
inside the `setTimeout`.
It catches the errors that occur in the code.

<Editor lang="javascript">
<code>
setTimeout(function() {
  try {
    aaaa; // This line will cause an error
  } catch {
    console.log("Error message shown after 1 sec.");
  }
}, 1000);
</code>
</Editor>

If we place the `setTimeout` inside
the `try...` block,
it will not be able to catch the errors.
