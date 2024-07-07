When there is an error in our code,
execution stops immediately at that point.

<codeblock language="javascript" type="lesson">
<code>
const INVALID_JSON_STRING = '{ username: "sam.smith", password: "123456" }';
const inputData = JSON.parse(INVALID_JSON_STRING);

if (inputData.username === "sam.smith" && inputData.password === "123456") {
  console.log("You are logged in successfully");
} else {
  console.log("Invalid credentials");
}
</code>
</codeblock>

In the example given above,
the execution stops at `JSON.parse(INVALID_JSON_STRING)`
because the value of `INVALID_JSON_STRING`
was not a valid JSON string.
Instead of getting either the
**"You are logged in successfully"** message
or
the **"Invalid credentials"** message,
the program terminates immediately
by raising an error
without continuing further in the block.

While these errors maybe meaningful for us,
it will be confusing for the consumers.
Consumers are the end users who uses
our application after we create it.
Thus it would be better to show a message
like **"Something went wrong"**
to the consumers.

We can use `try...catch`
to handle this gracefully.
`try...catch` has two blocks of code:

- The `try` code block contains the
  code that may throw an error on execution.

- The `catch` block contains the code
  to be executed when there is an error
  in execution of the `try` block.

Using the `try` block
to prevent an error from
stopping the execution of a script
is referred to as **catching** that error.

<codeblock language="javascript" type="lesson">
<code>
try {
  const INVALID_JSON_STRING = '{ username: "sam.smith", password: "123456" }';
  const inputData = JSON.parse(INVALID_JSON_STRING);

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
when the execution of the code
`JSON.parse(INVALID_JSON_STRING)`
within the `try` code block,
throws an error,
the code inside the `catch` block gets executed,
and
we get the output **"Something went wrong"**.

Similarly, when any error gets thrown
within the `try` code block,
the `catch` code block gets executed.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JSON_STRING = '{ "username": "sam.smith", "password": "123456" }';
  const inputData = JSON.parse(JSON_STRING);

  if (input.username === "sam.smith" && inputData.password === "123456") {
    console.log("You are logged in successfully");
  } else {
    console.log("Invalid credentials");
  }
} catch {
  console.log("Something went wrong")
}
</code>
</codeblock>

In the example above,
it is the usage of an undefined
variable `input` that throws an error.
Thus in the above example,
the `catch` block gets executed.

<codeblock language="javascript" type="lesson">
<code>
try {
  const JSON_STRING = '{ "username": "sam.smith", "password": "123456" }';
  const inputData = JSON.parse(JSON_STRING);

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

In the example above,
there are no errors
in the `try` code block.
Hence the `catch` block
is not executed.
In simple terms,
the `catch` block code will
only get executed
if an error is raised in the `try` block.
The execution in `try` block stops immediately
at whichever line an error is raised.
