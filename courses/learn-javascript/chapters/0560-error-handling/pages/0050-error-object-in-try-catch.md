In JavaScript, an error is
represented by an object.
The object contains two properties:

- `name` - which is the name of the error.

- `message` - provides a description of the error.

When an error is caught inside a `try` block,
the `catch` block gets executed.
We can access the error object
inside the `catch` block
as shown in the example given below.

<codeblock language="javascript" type="lesson">
<code>
try {
  console.log(newVariable);
} catch (error) {
  console.log(error.name);
  console.log(error.message);
}
</code>
</codeblock>

In the example given above,
the `error` variable stores the error object.
