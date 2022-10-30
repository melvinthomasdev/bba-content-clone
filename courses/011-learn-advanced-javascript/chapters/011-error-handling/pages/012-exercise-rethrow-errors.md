Use the **rethrowing technique** to
handle only `TypeError` in the code.

Rethrow all other types of errors
that may occur in the code.

The error message should be **TypeError**.

<Editor type="exercise" lang="javascript">
<code>
try {
  let number = 12;
  number();
} catch (err) {

}
</code>

<solution>
try {
  let number = 12;
  number();
} catch (err) {
  if (err instanceof TypeError) {
    console.log("TypeError");
  } else {
    throw err;
  }
}
</solution>
</Editor>