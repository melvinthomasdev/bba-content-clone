A Function is a code block
that can be executed
multiple times.

This may sound similar
to a loop but
functions are used for
a totally different purpose.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "",
  nationality: "Japan",
  age: 20,
  voterIDNumber: "",
};

const isIndianCitizen = user.nationality === "India";

if (!user.name || !isIndianCitizen) {
  console.log("The user details are not valid.");
}

if (isIndianCitizen && user.age >= 18 && !user.voterIDNumber) {
  console.log("The user details are not valid.");
}
</code>
</codeblock>

In the example given above,
the statement
`console.log("The user details are not valid.")`
is repeated twice.
However, we cannot replicate
this logic using a loop.

We can define a function
using the
`function` keyword
followed by
the name of the function.
The name is followed by
the `()` parentheses
and
then a code block
within `{}`.

Let's define a small function
that displays the error message
**"The user details are not valid."**.

<codeblock language="javascript" type="lesson">
<code>
function displayValidationError() {
  console.log("The user details are not valid.");
}
</code>
</codeblock>

In the example given above,
`displayValidationError`
is the name of the function
and
the code block within `{}`
is called the function body.

In the example given above,
we won't get an output
because we need to call the function
in order to execute
the function's code block.

In order to do that
we need to write a separate
statement with the function's name
followed by the `()` parentheses.

<codeblock language="javascript" type="lesson">
<code>
function displayValidationError() {
  console.log("The user details are not valid.");
}

displayValidationError();
</code>
</codeblock>

The `displayValidationError()`
statement is what's often termed as
a function call or a function invocation.
Try adding another
statement containing
`displayValidationError()`
to run the function twice.

Now, we can replace the
repeated `console.log()`
statement from the first example
with the function calls.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "",
  nationality: "Japan",
  age: 20,
  voterIDNumber: "",
};

const isIndianCitizen = user.nationality === "India";

function displayValidationError() {
  console.log("The user details are not valid.");
}

if (!user.name || !isIndianCitizen) {
  displayValidationError();
}

if (isIndianCitizen && user.age >= 18 && !user.voterIDNumber) {
  displayValidationError();
}
</code>
</codeblock>

We can also assign a function to a variable,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = function () {
  console.log("The user details are not valid.");
}

displayValidationError();
</code>
</codeblock>

In the example given above,
we are assigning a function with no name
to the variable `displayValidationError`.
Here, the variable name
serves as the function name.

Functions are used
to modularize code
and
avoid code duplication.
