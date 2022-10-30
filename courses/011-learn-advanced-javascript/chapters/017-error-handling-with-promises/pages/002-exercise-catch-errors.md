The code given below
does not handle the error
that occurs in the `.then`.

Use `.catch` to handle
the error
and
use the `console.log` statement
to show the error message.

Use `error.message` inside
the `console.log` to show
the error message
that we are throwing using `new Error`.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="1000">
<code>
let createPromise = new Promise((resolve, reject) => {
  resolve("No error!");
}).then((result) => {
  throw new Error("Error!");
}).catch(error => );
</code>

<solution>
let createPromise = new Promise((resolve, reject) => {
  resolve("No error!");
}).then((result) => {
  throw new Error("Error!");
}).catch(error => console.log(error.message));
</solution>
</Editor>