In JavaScript we can
use the `fetch` method
to load data over a network.
We only need to provide
the URL from which we want
to recieve the information.

Promises when used with `fetch`
resolves with a `response` object.

In the example given below,
we provide the URL to `fetch`.
Then `response.json()` reads the data
and
parses it as JSON.
Since there is no error,
the user name is shown in the output.

<Editor lang="javascript">
<code>
fetch(`https://api.github.com/users/github`)
  .then(response => response.json())
  .then(githubUser => console.log(githubUser.name))
  .catch(error => console.log(error.message));
</code>
</Editor>

If there is an error in the promise,
the `.catch` handles the error.

In the example given below,
`createError()` generates
an error.
The error is handled in `.catch`.

<Editor lang="javascript">
<code>
fetch(`https://api.github.com/users/github`)
  .then(response => response.json())
  .then(githubUser => {
    createError();
}).catch(error => console.log(error.message));
</code>
</Editor>