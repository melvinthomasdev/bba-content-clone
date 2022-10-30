Create a `promise`
and
store it in the variable `createPromise`.

Inside the first  `.then`
use `console.log` to show the value `7`.
Also create a promise inside it.

You must also multiply
the value with `2`
in the newly created promise.
**Do not forget to return**
**the newly created promise.**
The promise must resolve in `500` milliseconds.

Use the second `.then`
to show the updated value.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="2000">
<code>
let createPromise = new Promise(function (resolve, reject) {

  setTimeout(() => resolve(7), 500);

}).then(function(result) {

}).then(function(result) {

});
</code>

<solution>
let createPromise = new Promise(function (resolve, reject) {

  setTimeout(() => resolve(7), 500);

}).then(function(result) {

  console.log(result);

  return new Promise(function(resolve, reject) {

    setTimeout(() => resolve(result * 2), 500);

  });

}).then(function(result) {

  console.log(result);

});
</solution>
</Editor>