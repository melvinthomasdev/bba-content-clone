Functions contain
a set of instructions
to perform a task.
They help
in avoiding
code duplication.

We can define a function
using the
`function` keyword,
followed by
its name
and
parentheses `()`.
The parentheses `()` may
include a list of values
separated by commas.

In the example given below,
we do not run the `greetUser` function.
Therefore, there is **no output** in the console.

<Editor lang="javascript">
<code>
function greetUser() {
  console.log("Welcome Sam");
}
</code>
</Editor>

To run the function
we need to call it
by appending
a parentheses to the function's
name
and
passing the right number
of values inside the
parentheses.

<Editor lang="javascript">
<code>
function greetUser() {
  console.log("Welcome Sam");
}
greetUser();
</code>
</Editor>