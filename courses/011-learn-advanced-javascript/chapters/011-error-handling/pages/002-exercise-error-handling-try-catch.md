The example given below results
in a **ReferenceError**. Click on
**Run Code** to see this.

Use `try...catch` to handle
the error in the code given below.

In the catch block, use `console.log`
to display the message `Error!`.

<Editor type="exercise" lang="javascript">
<code>
let firstName = "Sam";
lastName;
</code>

<solution>
try {
  let firstName = "Sam";
  lastName;
} catch {
  console.log("Error!");
}
</solution>
</Editor>