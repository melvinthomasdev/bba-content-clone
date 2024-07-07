Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
try {
  setTimeout(() => aaaa, 2000);
} catch {
  console.log("Error message shown after 2 sec.");
}
</code>
</codeblock>

In the example given above,
even though the code that
threw the error - `() => aaaa`,
is inside the `try` code block,
we still get an error.

If we want to catch the errors that occur
in schedulers like `setTimeout` and `setInterval`,
then we must use `try...catch`
inside the definition of the function
passed as argument.

<codeblock language="javascript" type="lesson">
<code>
setTimeout(() => {
  try {
    aaaa; // This line will cause an error
  } catch {
    console.log("Error message shown after 2 sec.");
  }
}, 2000);
</code>
</codeblock>