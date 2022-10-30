Create a `promise`
and
store it in the variable
`createPromise`.

Use `console.log` to show
the message `Message: Success`
one second after the promise
completes successfully.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="2000">
<code>
let createPromise = ;

createPromise.then(
  (res) => console.log(res)
);
</code>

<solution>
let createPromise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve("Message: Success"), 1000)
});

createPromise.then(
  (res) => console.log(res)
);
</solution>
</Editor>