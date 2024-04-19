Modify the below `placeholder` function in such a way that the promise should be rejected if the `noOfItems` is less than 5 with the message "Minimum 5 items required." and it should be logged using `console.log` in the `catch` method.

```js
Output:
// This will be displayed after 5 seconds
"Order placed."
"Order#1 will be dispatched soon"
"Minimum 5 items required."
```
<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = noOfItems =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Order placed.");
    }, 5000);
  });

placeOrder(10)
  .then(message => {
    console.log(message);
    console.log("Order#1 will be dispatched soon");
  })

placeOrder(2)
  .then(message => {
    console.log(message);
    console.log("Order#2 will be dispatched soon");
  })
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
  });

placeOrder(2)
  .then(message => {
    console.log(message);
    console.log("Order#2 will be dispatched soon");
  })
  .catch(error => {
    console.log(error);
  });
</solution>
</codeblock>
