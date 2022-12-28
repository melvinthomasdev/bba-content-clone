Use the `setTimeout()` method to run the
`displayTransactionComplete` function after a
delay of 2 seconds.

Pass `"ABC123"` as the `transactionID` argument.

<codeblock type="exercise" language="javascript" evaluateAsync="true" testMode="fixedInput">
<code>
const displayTransactionComplete = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);
</code>

<solution>
const displayTransactionComplete = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);

setTimeout(() => displayTransactionComplete("ABC123"), 2000);
</solution>
</codeblock>