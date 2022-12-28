Write the `catch` block
in the code given below,
to handle only instances of `TypeError`
and
re-throw any other error instances.

The output in case of a `TypeError`,
should be **"There was a TypeError"**

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
try {
  const number = 12;
  number();
} catch (error) {

}
</code>

<solution>
try {
  const number = 12;
  number();
} catch (err) {
  if (err instanceof TypeError) {
    console.log("There was a TypeError");
  } else {
    throw err;
  }
}
</solution>
</codeblock>