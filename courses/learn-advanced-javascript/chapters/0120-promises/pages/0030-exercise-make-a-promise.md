In the code given below,
`placeOrder` is invoked twice.
After each invocation,
a message is shown using
`console.log()`

Rewrite the code to make sure that
the message shown after each invocation
of `placeOrder` is only shown after
the execution of the function is completed.
The message should not be shown
if the value of `noOfItems`
is lesser than `5`.

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = noOfItems => {
  setTimeout(() => {
    if (noOfItems < 5) console.log("Minimum 5 items required.");
    else console.log("Order placed.");
  }, 5000)
}

placeOrder(10);
console.log("Order#1 will be dispatched soon");

placeOrder(2);
console.log("Order#2 will be dispatched soon");
</code>

<solution>
const placeOrder = noOfItems => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (noOfItems < 5) reject("Minimum 5 items required.");
    else resolve("Order placed.");
  }, 5000)
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