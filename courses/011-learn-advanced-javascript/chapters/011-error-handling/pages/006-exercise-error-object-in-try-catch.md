The `try {...}` block in the given code
contains an error.

Access the name property
of the **error object**
in the `catch {...}` block.

Use `console.log` to show the name
of the error.

<Editor type="exercise" lang="javascript">
<code>
try {
  const num = 12;
  num = 13;
} catch {
  console.log();
}
</code>

<solution>
try {
  const num = 12;
  num = 13;
} catch (err) {
  console.log(err.name);
}
</solution>
</Editor>