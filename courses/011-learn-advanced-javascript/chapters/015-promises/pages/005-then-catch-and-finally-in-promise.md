We use `.then`, `.catch` and `.finally`
to keep track of the functions
that are waiting for
a function to produce some result.

`.then` accepts two functions as arguments.

It executes when
the promise completes the work.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve("The promise executes successfully"), 1000)
});

myPromise.then(
  (result) => console.log(result),
  (error) => console.log(error)
);
</code>
</Editor>

In the example given above,
since the function resolves after one second,
the first argument executes.

The second function would have run if
the promise was unable to
complete the work.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => reject("The promise got rejected"), 1000)
});

myPromise.then(
  (result) => console.log(result),
  (error) => console.log(error)
);
</code>
</Editor>

In the example given above,
since the function does not resolve after one second,
the second argument, the error one, executes.

We can also use `null` as the
first argument in `.then`
when we want to take action
only if there is an error.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => reject("The promise got rejected"), 1000)
});

myPromise.then(
  null,
  (error) => console.log(error)
);
</code>
</Editor>

Instead of passing `null` as
the first argument,
we use `.catch`.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => reject("The promise got rejected"), 1000)
});

myPromise.catch(
  (error) => console.log(error)
);
</code>
</Editor>

Sometimes, we have code that needs
to run irrespective of whether the promise completes
successfully or with an error.
In such cases, we can use `.finally`.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve("The promise executes successfully"), 1000)
});

myPromise
  .finally(() => console.log("We are executing finally"))
  .then(
    (result) => console.log(result),
    (error) => console.log(error)
);
</code>
</Editor>