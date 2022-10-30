Use the URL
`https://api.github.com/users/dhh`
in `fetch`
to load the user data from GitHub.

In the first `.then` use `response.json()`
to read the data
and
parse it as JSON.
The output must contain
the name of the GitHub User.

<Editor type="exercise" lang="javascript" runAsync="true" timeOut="2000">
<code>
fetch(...)
  .then(response => ...)
  .then(githubUser => console.log(githubUser.name))
  .catch(error => console.log(error.message));
</code>

<solution>
fetch(`https://api.github.com/users/dhh`)
  .then(response => response.json())
  .then(githubUser => console.log(githubUser.name))
  .catch(error => console.log(error.message));
</solution>
</Editor>