The `JSON.stringify()` method
accepts three arguments -

- The value to be converted into a JSON string.

- Either an array or a function
  that can be used to filter
  the properties of the first argument
  and
  include only those properties
  in the JSON string.

- Either the number of spaces
  or
  the string to be used for
  indentation of the JSON string.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7,
};

const userInfoJson = JSON.stringify(user, ["firstName", "lastName"]);

console.log(userInfoJson);
</code>
</codeblock>

In the example given above,
we pass the array
`["firstName", "lastName"]`
as the second argument to `JSON.stringify()`.
This filters the output
to include only the properties
whose keys are mentioned in the array.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7,
};

const checkIfStringValue = (key, value) => typeof value === "string" ? undefined : value;

const nonStringPropsJson = JSON.stringify(user, checkIfStringValue);

console.log(nonStringPropsJson);
</code>
</codeblock>

In the example given above,
we pass the function `checkIfStringValue`
as the second argument to `JSON.stringify()`.
This filters the output
to include only the properties
whose values are not of the type **"string"**.
The function passed as the second argument -
`checkIfStringValue`,
is invoked for
each property of the object.
For each invocation,
two arguments `key` and `value`
are passed.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7,
};

const checkIfStringValue = (key, value) => typeof value === "string" ? undefined : value;

const nonStringPropsJson = JSON.stringify(user, checkIfStringValue);
console.log(nonStringPropsJson);

const nonStringPropsWithIndentationJson = JSON.stringify(user, checkIfStringValue, 5);
console.log(nonStringPropsWithIndentationJson);
</code>
</codeblock>

In the above example,
`JSON.stringify(user, checkIfStringValue, 5)`
has a third argument `5`.
The third argument indicates
the number of spaces to be used
for indentation of the JSON string.

To add indentation to result
of `JSON.stringify`
without the second argument
that filters the properties,
we can pass `null` as the
second argument.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7,
  projects: ["BB Academy", "BigBinary Blog"],
};

const stringifiedUserInfo = JSON.stringify(user, null, 5);

console.log(stringifiedUserInfo);
</code>
</codeblock>

It is possible to indent the JSON string
returned by `JSON.stringify`
using a specific string,
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const user = {
  firstName: "Sam",
  lastName: "Smith",
  isAdmin: true,
  numberOfYears: 7,
  projects: ["BB Academy", "BigBinary Blog"],
};

const stringifiedUserInfo = JSON.stringify(user, null, "===");

console.log(stringifiedUserInfo);
</code>
</codeblock>