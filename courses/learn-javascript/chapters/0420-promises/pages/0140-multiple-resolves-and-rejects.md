Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const showGreeting = () => new Promise((resolve, reject) => {
  resolve("Hello World!");

  reject("This statement will be ignored");

  resolve("This statement will be ignored as well");
});

showGreeting().then(message => console.log(message));
</code>
</codeblock>

In the example given above, only the first `resolve()` call is executed. That means once a `resolve()` or `reject()` is executed, the promise is settled and any subsequent `resolve()` or `reject()` calls are ignored.

You might have noticed that the function passed as argument to the `Promise` in the above example does not have any asynchronous operations. It is not necessary that the function passed as argument to a `Promise` should contain asynchronous operations.
