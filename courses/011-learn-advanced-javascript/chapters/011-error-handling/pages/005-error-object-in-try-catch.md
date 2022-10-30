In case of an error,
JavaScript generates an **error object**.
The error object contains
the details about the error.
When we use a `try...catch` block,
this error is caught by the **try**
block and then passed to the **catch** statement
as an argument.

<Editor lang="javascript">
<code>
try {
  newVariable;
} catch (err) {
  console.log(err.name);
  console.log(err.message);
}
</code>
</Editor>

The **name** property in the built-in
error object gives the name of the error
and
the **message** property
gives the details about the error.

In the example given below,
the **err** variable stores the error object.
We can access its properties
using the **dot operator**.