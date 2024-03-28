- Use the `padEnd` method to
  add padding to the string stored in `password`
  and store the result in `paddedPassword`.

- Make the length of the returned string **20**.

- Use `$` for padding.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const password = "qwertyuiop";
const paddedPassword = ;
console.log(paddedPassword);
</code>

<solution>
const password = "qwertyuiop";
const paddedPassword = password.padEnd(20, "$");
console.log(paddedPassword);
</solution>
</codeblock>