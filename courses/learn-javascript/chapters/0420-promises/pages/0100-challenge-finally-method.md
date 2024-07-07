In the code give below, the statement `console.log("Order processing completed.");` is repeated in both the `then` and `catch` methods. Please rewrite the code using the `finally` method to avoid repetition of the statement.

```js
Output:
// This will be displayed after 5 seconds
"Order placed."
"Order#1 will be dispatched soon"
"Order processing completed."
"Minimum 5 items required."
"Order processing completed."
```
<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = noOfItems =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (noOfItems < 5) reject("Minimum 5 items required.");
      else resolve("Order placed.");
    }, 5000);
  });

placeOrder(10)
  .then(message => {
    console.log(message);
    console.log("Order#1 will be dispatched soon");
    console.log("Order processing completed.");
  })
  .catch(error => {
    console.log(error);
    console.log("Order processing completed.");
  });

placeOrder(2)
  .then(message => {
    console.log(message);
    console.log("Order#2 will be dispatched soon");
    console.log("Order processing completed.");
  })
  .catch(error => {
    console.log(error);
    console.log("Order processing completed.");
  });
</code>

<solution>
const placeOrder = noOfItems =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (noOfItems < 5) reject("Minimum 5 items required.");
      else resolve("Order placed.");
    }, 5000);
  });

placeOrder(10)
  .then(message => {
    console.log(message);
    console.log("Order#1 will be dispatched soon");
  })
  .catch(error => {
    console.log(error);
  })
  .finally(() => {
    console.log("Order processing completed.");
  });

placeOrder(2)
  .then(message => {
    console.log(message);
    console.log("Order#2 will be dispatched soon");
  })
  .catch(error => {
    console.log(error);
  })
  .finally(() => {
    console.log("Order processing completed.");
  });
</solution>
</codeblock>
