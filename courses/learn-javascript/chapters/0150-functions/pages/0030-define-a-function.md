A function is created using
the `function` keyword.
The basic structure of a
function includes the
function name, parentheses,
and a code block enclosed
in curly braces.

Let's define a simple function:

<codeblock language="javascript" type="lesson">
<code>
function displayValidationError() {
  console.log("The user details are not valid.");
}
</code>
</codeblock>

In the above example,
`displayValidationError`
is the name of the function,
and the code block within `{}`
is called the function body.

However, simply defining a
function does not trigger the
execution of its code.
To execute a function, we need
to call it by writing the
function's name followed
by the `()` parentheses:

<codeblock language="javascript" type="lesson" showRunCodeButton="false">
<code>
displayValidationError()
</code>
</codeblock>

This `displayValidationError()` is called
function call or function invocation.

<codeblock language="javascript" type="lesson">
<code>
function displayValidationError() {
  console.log("The user details are not valid.");
}

displayValidationError();
</code>
</codeblock>

In the above code, we are able to
display the output by defining the
function and then invoking it.
Try adding another statement
containing `displayValidationError()`
to run the function twice.
