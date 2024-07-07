The `catch` block gets executed
for any error that is thrown
in the `try` block.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JsonString = '{ username: "sam.smith", "password": "123456" }';
  const inputData = JSON.parse(JsonString);

  if (inputData.username === "sam.smith" && inputData.password === "123456") {
    console.log("You are logged in successfully");
  } else {
    console.log("Invalid credentials");
  }
} catch {
  console.log("Something went wrong")
}
</code>
</codeblock>

In the example given above,
no matter what error occurs
withing the `try` block,
we will get the output
**"Something went wrong"**.

We can use `instanceof` to
find what type of error
was thrown in the `try` block
and
display a different output
for a specific type of error.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JsonString = '{ username: "sam.smith", "password": "123456" }';
  const inputData = JSON.parse(JsonString);

  if (inputData.username === "sam.smith" && inputData.password === "123456") {
    console.log("You are logged in successfully");
  } else {
    console.log("Invalid credentials");
  }
} catch (error) {
  if (error instanceof SyntaxError) {
    console.log("Invalid user input");
  } else {
    throw error;
  }
}
</code>
</codeblock>

In the example above,
the JSON string being parsed is invalid
and
it throws a type of error - **SyntaxError**.
Inside the `catch` block,
we use `instanceof` to check
if the `error` object
is an instance of `SyntaxError`.
If the condition
`error instanceof SyntaxError` is true,
we display **"Invalid user input"**.
Otherwise, we throw the error.

In the example given above,
we use `try...catch` to catch errors
that occur in the `try` block.
However, we handle only a particular
instance of an error.
All unhandled errors are thrown again.
This is known as **re-throwing an error**.

The `instanceof` operator is explained
in the [`instanceof`](https://courses.bigbinaryacademy.com/learn-javascript/instanceof/classes/) section
of the [`Learn JavaScript`](https://courses.bigbinaryacademy.com/learn-javascript/) course.
