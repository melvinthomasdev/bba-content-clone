Define a function
`fullName`
with two arguments
`firstName`
and
`lastName`.
The default value
for `lastName` is
`Doe`.
The output
should be `Sam Smith`.

<Editor type="exercise" lang="javascript">
<code>
function fullName() {
  console.log();
}
fullName("Sam", "Smith");
</code>

<solution>
function fullName(firstName, lastName="Doe") {
  console.log(firstName + " " + lastName);
}
fullName("Sam", "Smith");
</solution>
</Editor>