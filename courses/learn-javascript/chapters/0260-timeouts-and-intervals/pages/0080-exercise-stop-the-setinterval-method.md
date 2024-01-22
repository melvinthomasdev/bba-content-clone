Use the `clearInterval()` method
to cancel the timer started by
the `setInterval()` method.

<codeblock type="exercise" language="javascript" evaluateAsync="true" testMode="fixedInput">
<code>
const displayTransactionStatus = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);

setInterval(() => displayTransactionStatus("ABC123"), 2000);
</code>

<solution>
const displayTransactionStatus = transactionID =>
  console.log(`Your transaction #${transactionID} has been completed.`);

const timerID = setInterval(() => displayTransactionStatus("ABC123"), 2000);
clearInterval(timerID);
</solution>
</codeblock>