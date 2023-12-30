`JSON.parse()` converts a
JSON string back into an object.
This is also called parsing a JSON string.

<codeblock language="javascript" type="lesson">
<code>
const userInfoJSON = '{"firstName":"Sam","lastName":"Smith","isAdmin":true,"numberOfYears":7}';

const user = JSON.parse(userInfoJSON);
console.log(user);
</code>
</codeblock>

`JSON.parse()` takes two arguments:

- The JSON string to be converted.

- A function that can be used to
  transform the property being parsed.
  The is invoked on each property
  being parsed.
  Each invocation has two parameters -
  `key` and `value`.

<codeblock language="javascript" type="lesson">
<code>
const userInfoJSON = '{"firstName":"Sam","lastName":"Smith","isAdmin":true,"numberOfYears":7}';

const toggleBooleanValues = (key, value) => typeof value === "boolean" ? !value : value;

const user = JSON.parse(userInfoJSON, toggleBooleanValues);
console.log(user);
</code>
</codeblock>

In the above example,
`toggleBooleanValues` is passed as
the second argument to `JSON.parse`.
The function transforms properties
with boolean values by performing
the `NOT` operation on the value.

If the string passed as
the first argument to `JSON.parse`
is not a valid JSON string,
it throws an error.

<codeblock language="javascript" type="lesson">
<code>
const userInfoJSON = '{firstName:"Sam"}';

const user = JSON.parse(userInfoJSON);
console.log(user);
</code>
</codeblock>

In the above example,
the key `firstName` is not
wrapped in double quotes
in the `userInfoJSON` string.
Hence, `JSON.parse` throws an error.