We have created a timer using the `setTimeout()` method.
Add a `clearTimeout()` call to cancel the timer at the end of the code.

<codeblock type="exercise" language="javascript" evaluateAsync="true" testMode="fixedInput">
<code>
const displayTransactionComplete = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);

setTimeout(() => displayTransactionComplete("ABC123"), 2000);
</code>

<solution>
const displayTransactionComplete = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);

const timeoutID = setTimeout(() => displayTransactionComplete("ABC123"), 2000);
clearTimeout(timeoutID);
</solution>
</codeblock>