Since we have placed the `setTimeout`
inside the `try {...}` block,
the given code does not
show the error message.

Include `try...catch` inside
`setTimeout` to show the error message.

<Editor type="exercise" lang="javascript">
<code>
try {
  setTimeout(function() {
  let firstName = "Sam";
  lastName;
  }, 1000);
} catch {
  console.log("Error!");
}
</code>

<solution>
setTimeout(function() {
  try {
    let firstName = "Sam";
    lastName;
  } catch {
    console.log("Error!");
  }
}, 1000);
</solution>
</Editor>