Use `try...catch...finally`
to check the `try {...}` block for errors,
`catch {...}` block to show the error message
and
the `finally {...}` block to run at the end.

Use `console.log` to show
the message `Error` for the `catch {...}` block
and
the message `Finally` for the `finally {...}` block.

<Editor type="exercise" lang="javascript">
<code>
try {
  let number = 12;
  number();
} catch (err) {

} finally {

}
</code>

<solution>
try {
  let number = 12;
  number();
} catch (err) {
  console.log("Error");
} finally {
  console.log("Finally");
}
</solution>
</Editor>