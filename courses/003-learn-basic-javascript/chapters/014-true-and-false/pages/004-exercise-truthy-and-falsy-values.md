In the code given below,
the `if` condition evaluates
to `true`.

Change the value stored
in the `storeFalsyValue` variable
to a **falsy** value,
such that the code in the
`else` statement executes.

<Editor lang="javascript" type="exercise">
<code>
let storeFalsyValue = true;
if(storeFalsyValue) {
  console.log(`Nothing to show!`);
} else {
  console.log(`You are amazing!`);
}
</code>

<solution>
let storeFalsyValue = false;
if(storeFalsyValue) {
  console.log(`Nothing to show!`);
} else {
  console.log(`You are amazing!`);
}
</solution>
</Editor>