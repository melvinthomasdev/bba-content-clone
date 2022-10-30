The `catch {...}` block gets all the exceptions
that occur in the `try {...}` block.

In the example given below,
the `generateError()` function is not
defined. But we try to call it, which
results in an error.
Now, there is no error in the JSON data.
Yet, in the error message, it says **JSON Error**.

You can see that it is not ideal to
have a single statement like that
to cover different situations that can
result in errors.

<Editor lang="javascript">
<code>
let myJson = '{ "name": "Sam Smith", "age": 32 }';

try {
  user = JSON.parse(myJson);
  if (!user.name) {
    throw new SyntaxError("User name not present");
  }
  generateError();
} catch (err) {
  console.log("JSON Error: " + err.message);
}
</code>
</Editor>

We can avoid such situations
using the **rethrowing technique**.
It throws the errors that are not handled
in the `catch {...}` block.

In the example given below,
we use `instanceof`
to check the type of error.
Here, we are handling only the `ReferenceError`.
The `catch {...}` block simply re-throws
the other errors that
may occur in the code. This
re-throwing makes it that we
handle the errors that concern
us in this block of code and the ones
that we do not care about, will get
passed down in the call stack.

<Editor lang="javascript">
<code>
try {
  generateError();
} catch (err) {
  if (err instanceof ReferenceError) {
    console.log("ReferenceError: " + err.message);
  } else {
    throw err;
  }
}
</code>
</Editor>

Here's another example:

<Editor lang="javascript">
<code>
let myJson = '{ "age": 32 }';

try {
  user = JSON.parse(myJson);
  if (!user.name) {
    throw new SyntaxError("User name not present");
  }
  generateError();
} catch (err) {
  if (err instanceof SyntaxError) {
    console.log("JSON Error: " + err);
  } else {
    throw err;
  }
}
</code>
</Editor>