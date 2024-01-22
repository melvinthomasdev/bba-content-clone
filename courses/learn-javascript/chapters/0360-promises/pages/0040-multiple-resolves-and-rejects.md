Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const showGreeting = new Promise((resolve, reject) => {
  resolve("Hello World!");

  reject("This statement will be ignored");

  console.log("This message will be displayed on the console")

  resolve("This statement will be ignored as well");
});

showGreeting.then(message => console.log(message));
</code>
</codeblock>

In the example given above,
only the first `resolve()` call
is executed.
Once a `resolve()` or `reject()`
call is executed,
all other `resolve()` or `reject()`
calls will not be executed.

Note that the function passed
as argument to the `Promise`
does not have any
asynchronous operations.
It is not necessary that
the function passed as argument
to a `Promise` should contain
asynchronous operations.
