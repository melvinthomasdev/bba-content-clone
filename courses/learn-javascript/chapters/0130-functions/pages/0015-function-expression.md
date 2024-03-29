A function can be assigned to a variable in an expression.

Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = function () {
  console.log("The user details are not valid.");
}

displayValidationError();
</code>
</codeblock>

In the above example, we are assigning
a function with no name to
the variable `displayValidationError`.
Here, the variable name serves
as the function name.
This function, without a name,
is called an anonymous function.
