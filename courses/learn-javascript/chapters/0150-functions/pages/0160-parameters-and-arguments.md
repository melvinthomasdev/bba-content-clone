While defining a function,
if we include a list of variables
in between the `()` parentheses,
they are called **parameters**.

Let's define a new
`displayValidationError` function,
with parameters this time.

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage) => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}
</code>
</codeblock>

In the example above,
`invalidFieldName, additionalMessage`
are the function parameters.
They are used inside the
`console.log` so that
the message displayed
can be modified based on
the value of the parameters.

To call a function
that has parameters,
we need to provide the values
in the function call.
These are called **arguments**.

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage) => { // parameters
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

displayValidationError("name", "Please provide a valid name."); // arguments
</code>
</codeblock>

In the example given above,
we pass two arguments -
`"name"`, and
`"Please provide a valid name."`.
This means that
the parameter `invalidFieldName`
gets the value `"name"`,
and the parameter `additionalMessage`
gets the value
`"Please provide a valid name."`.

Let's use this new definition
of `displayValidationError` in the example
from the beginning of this chapter.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  name: "",
  age: 20,
  voterIDNumber: "",
};

const displayValidationError = (invalidFieldName, additionalMessage) => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

if (!user.name) {
  displayValidationError("name", "Please provide a valid name.");
}

if (user.age >= 18 && !user.voterIDNumber) {
  displayValidationError("Voter ID Number", "Voter ID Number is required for ages 18 and above.");
}
</code>
</codeblock>

It is important to note that
**parameters** are the list of variables
wrapped in parentheses `()`
in a function definition.
In the example above,
`(invalidFieldName, additionalMessage)`
are parameters of the function `displayValidationError`.
**Arguments** are the values passed
in a function call.
In the above example,
`displayValidationError("name", "Please provide a valid name.")`
is a function call
and
`"name", "Please provide a valid name."`
are the arguments.

Consider the following function,
which has only one parameter.

<codeblock language="javascript" type="lesson">
<code>
const displayAge = (age) => {
  console.log(`The user is ${age} years old.`);
}

displayAge(24);
</code>
</codeblock>

For arrow functions
with only one parameter,
we don't need the
parentheses `()`
around the parameters,
as shown below.

<codeblock language="javascript" type="lesson">
<code>
const displayAge = age => {
  console.log(`The user is ${age} years old.`);
}

displayAge(24);
</code>
</codeblock>