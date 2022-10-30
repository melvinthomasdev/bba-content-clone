Define a function `userDetails`.
It takes an argument `secretPin`.

Define a nested function `showSecretPin`.

Use your knowledge of closures
to access the `secretPin` from
the function `showSecretPin`.
Use `console.log` to show the `secretPin`.

<Editor type="exercise" lang="javascript">
<code>
function userDetails() {
  function showSecretPin() {

  }
  showSecretPin();
}
userDetails(12345);
</code>

<solution>
function userDetails(secretPin) {
  function showSecretPin() {
    console.log(secretPin);
  }
  showSecretPin();
}
userDetails(12345);
</solution>
</Editor>