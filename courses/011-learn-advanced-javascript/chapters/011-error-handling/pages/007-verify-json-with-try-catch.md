The JSON format is used to send
and
receive data over the internet.

We use `JSON.parse()`
to convert a JSON string into an object.
If JSON data is not valid,
`JSON.parse()` generates an error.
Also, this stops the execution of the code
without showing any error message to the user.

We can use `try...catch` to
check the validity of JSON data
and
show an error message to the user.

<Editor lang="javascript">
<code>
let myJson = '{ Sam Smith }';
try {
  let user = JSON.parse(myJson);
} catch (err) {
  console.log("The received data has errors");
  console.log(err.name);
}
</code>
</Editor>