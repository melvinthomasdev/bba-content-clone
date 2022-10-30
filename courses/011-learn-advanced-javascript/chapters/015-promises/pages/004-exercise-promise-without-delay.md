Create a `promise`
and
store it in the
variable **createPromise**.

In the promise, use `console.log` to show
the message `Message: Success`.
The promise completes
without any delay.

<Editor type="exercise" lang="javascript" evaluateAsync="true">
<code>
let createPromise = ;

createPromise.then(
  (res) => console.log(res)
);
</code>

<solution>
let createPromise = new Promise(function (resolve, reject) {
  resolve("Message: Success")
});

createPromise.then(
  (res) => console.log(res)
);
</solution>
</Editor>