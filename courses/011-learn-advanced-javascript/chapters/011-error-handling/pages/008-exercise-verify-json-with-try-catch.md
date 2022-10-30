Use `try...catch` to validate the
data stored in the `jsonString` variable.
Use `console.log()` to show the
error message `Data has errors` if
there are any errors.

<Editor type="exercise" lang="javascript">
<code>
let jsonString = '{ Sparrow }';
try {
  let bird = JSON.parse(jsonString);
} catch (err) {


}
</code>

<solution>
let jsonString = '{ Sparrow }';
try {
  let bird = JSON.parse(jsonString);
} catch (err) {
  console.log("Data has errors");
}
</solution>
</Editor>