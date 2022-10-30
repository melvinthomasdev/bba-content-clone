We can chain promises
to handle errors,
especially when loading data
over a network.

In the example given below,
we are using `fetch` to
get data over the internet.
Since the URL is invalid,
the `.catch` shows the error message.

You may have to wait for
a few seconds to get the response.
This is because it tries to access the given URL
and
displays the error message when
it cannot fetch the URL.

<Editor lang="javascript">
<code>
fetch('https://invalid.address')
  .then(response => response.json())
  .then(jsonResponse => console.log(jsonResponse))
  .catch(error => console.log(error.message));
</code>
</Editor>

We can use `.catch` to handle
errors that occur in the promise.

<Editor lang="javascript">
<code>
new Promise((resolve, reject) => {
  throw new Error("Error in promise!");
}).then(() => console.log("Promise resolved"))
.catch(error => console.log(error.message));
</code>
</Editor>

`.catch` can also handle errors
that occur in `.then`.

<Editor lang="javascript">
<code>
new Promise((resolve, reject) => {
  resolve("Promise resolved");
}).then((result) => {
  throw new Error("There is an error!");
}).catch(error => console.log(error.message));
</code>
</Editor>