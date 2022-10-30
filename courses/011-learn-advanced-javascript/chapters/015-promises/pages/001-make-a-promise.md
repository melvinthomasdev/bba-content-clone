Sometimes a function
does some work that takes time,
such as loading data over a network.
Meanwhile, some other function
has to wait for the result
of this function.

In such a situation, we can
use a `promise`.

A `promise` is an object that provides the result of
the **function that produces the result**
to the **code that waits for the result**.

In this lesson,
we are using `.then()` and `.catch()`
only to show the output in the console.
Don't be worried, we will discuss
them later.

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  setTimeout(() => resolve("The promise executes successfully"), 1000)
});

myPromise.then(
  (result) => console.log(result)
);
</code>
</Editor>

In the example given above,
the function passed to `new Promise()`
takes one second or
`1000` milliseconds to complete
without an error.
The output is visible
after the function completes its execution.

Also, the function accepts
two arguments `resolve` and `reject`.
These arguments are pre-defined
**functions** in JavaScript.
If the function completes the work
without an error,
`resolve` executes.
Otherwise, `reject` executes.

Sometimes the `promise` gets
rejected with an error.


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

In this example,
the function executes `reject`.
The error message is
displayed in the output
after one second.