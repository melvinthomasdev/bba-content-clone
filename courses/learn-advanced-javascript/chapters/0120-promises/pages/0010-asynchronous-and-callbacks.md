Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount }) =>
  setTimeout(() => console.log(`Transferring ${amount} to ${to}`), 5000);

const onSuccess = () => console.log("Transfer Complete");

transferMoney({ to: "Sam", amount: 10000 });
onSuccess();
</code>
</codeblock>

In the example given above,
even though `onSuccess`
is invoked after the invocation of
`transferMoney({ to: "Sam", amount: 10000 })`,
the messages are displayed
in a different order.

This is because of the `setTimeout`
in the `transferMoney` function.
It starts a timer which runs in the background.
After 5 seconds it displays the message.
While the timer is running,
`onSuccess` is executed.
Such code that runs in the background
while the rest of the code is being executed
is called **asynchronous code**.

We can use **callback functions**
to make sure that
`onSuccess`
is invoked after we the execution of
`transferMoney({ to: "Sam", amount: 10000 })`
is completed.

<codeblock language="javascript" type="lesson">
<code>
const transferMoney = ({ to, amount, callback }) => {
  setTimeout(() => {
    console.log(`Transferring ${amount} to ${to}`);
    callback();
  }, 5000);
}

const onSuccess = () => console.log("Transfer Complete");

transferMoney({
  to: "Sam",
  amount: 10000,
  callback: onSuccess
});
</code>
</codeblock>

In the example given above,
the message from `onSuccess`
is displayed after the message from `transferMoney`.

A **callback function** is a function
that is invoked towards the end of the
execution of another function.
In the example given above,
`onSuccess`
is the callback function.

Callback functions can be hard to manage
and
can lead to code that is
difficult to read and understand.
Hence, **Promises** are preferred
over **callback functions**
in such situations.
We'll learn more about **Promises**
in the upcoming chapters.
