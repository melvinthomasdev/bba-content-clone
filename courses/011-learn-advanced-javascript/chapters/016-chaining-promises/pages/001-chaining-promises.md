Sometimes we need to perform
a series of
asynchronous actions.

In such cases,
we can **chain promises**.

<Editor lang="javascript">
<code>
let promise = new Promise(function(resolve, reject) {

  setTimeout(() => resolve(1), 1000);

}).then(function(result) {

  console.log(result);
  return result * 5;

}).then(function(result) {

  console.log(result);
  return result * 5;

}).then(function(result){

  console.log(result);

});
</code>
</Editor>

In the example given above,
the promise resolves after one second
with the value `1`.
The first `.then` shows the value `1`,
multiplies it with `5`
and
returns the updated value.
The second `.then` takes
the value `5`
and
shows it.
It also multiplies the value with `5`
and
returns the updated value `25`.
The third `.then` simply shows the value `25`.

<!-- However,
if we add multiple
`.then` to a single promise
the updated value is not passed to the next `.then`.


<Editor lang="javascript">
<code>
let promise = new Promise(function(resolve, reject) {
  setTimeout(() => resolve(1), 1000);
});

promise.then(function(result) {
  console.log(result);
  return result * 5*;
});

promise.then(function(result) {
  console.log(result);
  return result * 5*;
});

promise.then(function(result) {
  console.log(result);
  return result * 5*;
});
</code>
</Editor>

In the example given above,
the promise resolves after one second
with the value `1`.
The first `.then` shows the value `1`,
multiplies it with `5`
and
returns the updated value.
-->