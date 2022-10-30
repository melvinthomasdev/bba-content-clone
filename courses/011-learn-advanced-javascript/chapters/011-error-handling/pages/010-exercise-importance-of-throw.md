Use `throw` to show
the error message **Email not present**
in the `catch {...}` block.

<Editor type="exercise" lang="javascript">
<code>
let myJson = '{ "name": "Sam Smith", "age": 32 }';

try {
  let user = JSON.parse(myJson);
} catch (err) {
  console.log(err);
}
</code>

<solution>
let myJson = '{ "name": "Sam Smith", "age": 32 }';

try {
  let user = JSON.parse(myJson);
  if (!user.email) {
    throw "Email not present";
  }
} catch (err) {
  console.log(err);
}
</solution>
</Editor>