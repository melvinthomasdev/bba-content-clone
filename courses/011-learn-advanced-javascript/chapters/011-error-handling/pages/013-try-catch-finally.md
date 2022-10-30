In the programming flow, we sometimes
need some part of the code to execute
even if there is an error. In a `try...catch` block,
we place a new statement called `finally` which
holds that part of our code which will
definitely run. It doesn't care whether
the `try` catch resulted in an error or not.

In the example given below,
the `try {...}` block has no errors.
Therefore, at first, the `try {...}` block executes.
After that, the `finally {...}` block executes.
It skips the `catch {...}` block.

<Editor lang="javascript">
<code>
try {
  let number = 12;
  console.log("Try block executes");
} catch (err) {
  console.log("Catch block executes");
} finally {
  console.log("Finally block executes");
}
</code>
</Editor>

In the example given below,
the `try {...}` block has an error.
Therefore, all three code blocks get
executed.

<Editor lang="javascript">
<code>
try {
  console.log("Try block executes");
  generateError();
} catch (err) {
  console.log("Catch block executes");
} finally {
  console.log("Finally block executes");
}
</code>
</Editor>