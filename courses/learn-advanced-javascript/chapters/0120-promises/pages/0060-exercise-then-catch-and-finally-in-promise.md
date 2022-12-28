In the code given below,
add `.finally()` to display the message -
**"Transfer processed"** regardless of
if the `Promise` gets resolved or rejected.

<codeblock type="exercise" language="javascript" runAsync="true" timeOut="5000" testMode="fixedInput">
<code>
const transferMoney = ({ to, amount }) => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (amount > 5000) reject(new Error("Transaction Failed: Limit exceeded"));
    resolve(`Transferred ${amount} to ${to}`);
  }, 5000);
});

transferMoney({ to: "Sam", amount: 10000 })
  .then(message => console.log(message))
  .catch(error => console.log(error.message));
</code>

<solution>
const transferMoney = ({ to, amount }) => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (amount > 5000) reject(new Error("Transaction Failed: Limit exceeded"));
    resolve(`Transferred ${amount} to ${to}`);
  }, 5000);
});

transferMoney({ to: "Sam", amount: 10000 })
  .then(message => console.log(message))
  .catch(error => console.log(error.message))
  .finally(() => console.log("Transfer processed"));
</solution>
</codeblock>