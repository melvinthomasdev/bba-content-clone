The function passed to `new Promise()`
can contain only one `resolve` or one `reject` function.
Even if we add more than that,
it ignores the rest.

We can also execute it immediately:

<Editor lang="javascript">
<code>
let myPromise = new Promise(function (resolve, reject) {
  resolve("The promise executes successfully");
  reject("This message is not visible in the console");
  resolve("This message is also not visible");
});

myPromise.then(
  (result) => console.log(result)
);
</code>
</Editor>

In the example given above,
only the first `resolve` executes.
In this case,
we are not using `setTimeout()`.
Therefore, the output is visible
without any delay.