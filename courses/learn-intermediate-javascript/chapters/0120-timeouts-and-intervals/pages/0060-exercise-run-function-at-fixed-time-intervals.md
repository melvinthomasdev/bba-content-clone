Use the `setInterval()` method
to run the `displayTransactionStatus()`
function after every 2 seconds.
Pass `"ABC123"` as `transactionID` argument.

<codeblock type="exercise" language="javascript" evaluateAsync="true" testMode="fixedInput">
<code>
const transaction = {
  id: "ABC123",
  isProcessed: false,
}
setTimeout(() => { transaction.isProcessed = true }, 10000);

const displayTransactionStatus = transactionID => {
  if (transaction.id === transactionID && transaction.isProcessed) {
    console.log(`Your transaction #${transactionID} has been completed.`);
  } else  {
    console.log(`Your transaction is being processed.`);
  }
}
</code>

<solution>
const transaction = {
  id: "ABC123",
  isProcessed: false,
}
setTimeout(() => { transaction.isProcessed = true }, 10000);

const displayTransactionStatus = transactionID => {
  if (transaction.id === transactionID && transaction.isProcessed) {
    console.log(`Your transaction #${transactionID} has been completed.`);
  } else  {
    console.log(`Your transaction is being processed.`);
  }
}

setInterval(() => displayTransactionStatus("ABC123"), 2000);
</solution>
</codeblock>