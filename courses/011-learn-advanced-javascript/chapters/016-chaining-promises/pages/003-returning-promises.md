We can also create a promise inside `.then`
and return its value.
The subsequent `.then` wait till the promise
inside the previous `.then` resolves.

<Editor lang="javascript">
<code>
let promise = new Promise(function(resolve, reject) {

  setTimeout(() => resolve(1), 1000);

}).then(function(result) {

  console.log(result);

  return new Promise((resolve, reject) => {
    setTimeout(() => resolve(result * 5), 1000);
  });

}).then(function(result) {

  console.log(result);

  return new Promise(function(resolve, reject) {
    setTimeout(() => resolve(result * 5), 1000);
  });

}).then(function(result) {

  console.log(result);

});
</code>
</Editor>

In the example given above,
the first `.then` shows the value `1`
and
returns a promise.
The promise inside the first `.then`
multiplies the value with `5`
and resolves after one second.
The second `.then`
shows the value `5`,
multiplies the value again
and
resolves after one second.
The third `.then` simply shows the value `25`.

The values in the output are
similar to the values shown
in the previous chapter.
But, in this case,
there is a delay of one second
before each value is shown in the output.
