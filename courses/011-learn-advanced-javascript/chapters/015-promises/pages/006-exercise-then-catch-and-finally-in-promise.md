Create a `promise`
and
store it in the variable `createPromise`.
In the `promise`, use `setTimeout`
with a delay of `1000` milliseconds.

In the code given below,
add `.finally` before `.then`
to always show the message `Promise runs`.

Use `console.log` to show
the message, `Message: Success`
when the promise completes
without any error.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="2000">
<code>
let createPromise = new Promise(function (resolve, reject) {
  // Add delay here
});

createPromise
  .then(
    (result) => console.log(result),
    (error) => console.log(error)
);
</code>

<solution>
let createPromise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve("Message: Success"), 1000)
});

createPromise
  .finally(() => console.log("Promise runs"))
  .then(
    (result) => console.log(result),
    (error) => console.log(error)
);
</solution>
</Editor>