Let's take the final definition
of `displayValidationError`
from the previous chapter:

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage) => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

displayValidationError("name", "Please provide a valid name.");
</code>
</codeblock>

Let's consider
the following example
where we do not pass
the second argument
while invoking the `displayValidationError`
function.

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage) => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

displayValidationError("name");
</code>
</codeblock>

In the above example,
the second parameter
`additionalMessage`
received the value - `undefined`.
That is why the output has
**"undefined"** in the end.
Any argument that is omitted
will be set as `undefined`
in the corresponding function parameter.

There might come a scenario
where a function has
an "optional" parameter,
i.e.,
a parameter to which
we don't always need to
pass a value.
In such cases, we can use
**default parameters**.
**Default parameters** are
function parameters that
use a specified value as the default value
if a function call passes
`undefined` to that parameter.

Let's modify the
`displayValidationError`
such that we can avoid
the `"undefined"` in the message
in case the value of
`additionalMessage`
is `undefined`.

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage = "") => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

displayValidationError("name");
</code>
</codeblock>

Here, we can see
an important difference
between `undefined`
and `null`.

<codeblock language="javascript" type="lesson">
<code>
const displayValidationError = (invalidFieldName, additionalMessage = "") => {
  console.log(`The user ${invalidFieldName} is not valid. ${additionalMessage}`);
}

displayValidationError("name", undefined);
displayValidationError("name");
displayValidationError();
displayValidationError("name", null);
</code>
</codeblock>

In the above example:

- `displayValidationError("name", undefined)` -
  This passes `undefined` to the `additionalMessage` parameter
  and
  hence `additionalMessage` will be set as
  `""`, the default value.

- `displayValidationError("name")` -
  Since the second argument is omitted,
  `additionalMessage` will receive `undefined`.
  Hence, `additionalMessage` will be set as
  `""`, the default value.

- `displayValidationError()` -
  Since both the arguments are omitted,
  both `invalidFieldName` and `additionalMessage`
  will receive `undefined`.
  Since `invalidFieldName` does not have a default value,
  it's value will remain as `undefined`.
  However, `additionalMessage` will be assigned the default value `""`.

- `displayValidationError("name", null)` -
  `invalidFieldName` gets the value `"name"`
  and
  `additionalMessage` gets the value `null`.

Even though both
`undefined` and `null`
literally convey
the lack of a value,
`null` is still
considered as a value
in JavaScript.
That is why
`additionalMessage`
doesn't use
the default value
even though
`null` was passed to it.
