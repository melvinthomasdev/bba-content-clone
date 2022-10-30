In the example given below,
the data stored in the
**myJson** variable is
syntactically correct,
but
it does not contain the
property **name**.

<Editor lang="javascript">
<code>
let myJson = '{ "age": 32 }';

try {
  let user = JSON.parse(myJson);
  console.log(user.name);
} catch (err) {
  console.log("This message will not show");
}
</code>
</Editor>

You'd think that this should result in
an error that gets caught by the `catch`
statement. But when you run this code,
you'll see this isn't so.

Well, because this isn't an error in
JavaScript's eyes. The value is simply
`undefined`. So, there is no error
and the catch block gets nothing.

In such cases, we can use `throw`:

<Editor lang="javascript">
<code>
let myJson = '{ "age": 32 }';

try {
  let user = JSON.parse(myJson);
  if (!user.name) {
    throw "User name not present";
  }

} catch (err) {
  console.log(err);
}
</code>
</Editor>

The `throw` would cause an exception.
An exception is like an error, but
something that we programmers can
program in our code to make things
a lot more predictable. Like in this case,
we want JavaScript to `throw` an
exception when it finds that there
is no name property associated with
`user`.