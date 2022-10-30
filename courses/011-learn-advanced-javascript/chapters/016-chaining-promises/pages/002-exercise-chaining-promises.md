Create a `promise`
and
store it in the variable `createPromise`.

Chain promises in the following manner:

- Use the first `.then` to show the value `7`,
multiply it with `2`.
**Do not forget to return the value**.

- Use the second `.then`
to show the updated value.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="2000">
<code>
let createPromise = new Promise(function (resolve, reject) {

  setTimeout(() => resolve(7), 500);

})
</code>

<solution>
let createPromise = new Promise(function (resolve, reject) {

  setTimeout(() => resolve(7), 500);

}).then(function(result) {

  console.log(result);
  return result * 2;

}).then(function(result) {

  console.log(result);

})
</solution>
</Editor>