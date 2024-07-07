Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const JSONString = '{ "username": "sam.smith", "password": "654321" }';
const inputData = JSON.parse(JSONString);

if (inputData.username === "sam.smith" && inputData.password === "123456") {
  console.log("You are logged in successfully");
} else {
  console.log("Invalid credentials");
}
</code>
</codeblock>

In the example given above,
if the credentials match the expected values
we show a message using `console.log`.
Even if the credentials are wrong,
we show a message using `console.log`.
What if we want to show an error,
when the credentials are wrong?

In JavaScript,
we can show a custom error
using the `throw` keyword.

<codeblock language="javascript" type="lesson">
<code>
const JSONString = '{ "username": "sam.smith", "password": "654321" }';
const inputData = JSON.parse(JSONString);

if (inputData.username === "sam.smith" && inputData.password === "123456") {
  console.log("You are logged in successfully");
} else {
  throw "Invalid credentials";
}
</code>
</codeblock>

In the example given above,
if the credentials are wrong
a custom error is thrown.

Let's wrap the example given above
in a `try` block
and
see what happens if we access the
error inside the `catch` block.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JSONString = '{ "username": "sam.smith", "password": "654321" }';
  const inputData = JSON.parse(JSONString);

  if (inputData.username === "sam.smith" && inputData.password === "123456") {
    console.log("You are logged in successfully");
  } else {
    throw "Invalid credentials";
  }
} catch (error) {
  console.log(typeof error);
  console.log(error);
}
</code>
</codeblock>

In the example given above,
we see that the custom error
is not an Error object.
It is a string.

To throw an Error object
we need to use `new Error()`.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JSONString = '{ "username": "sam.smith", "password": "654321" }';
  const inputData = JSON.parse(JSONString);

  if (inputData.username === "sam.smith" && inputData.password === "123456") {
    console.log("You are logged in successfully");
  } else {
    throw new Error("Invalid credentials");
  }
} catch (error) {
  console.log(typeof error);
  console.log(error.name);
  console.log(error.message);
}
</code>
</codeblock>