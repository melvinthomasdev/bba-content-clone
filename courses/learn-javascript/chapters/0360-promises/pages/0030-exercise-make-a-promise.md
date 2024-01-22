In the code given below,
`placeOrder` is invoked twice.
After each invocation,
a message is shown using
`console.log()`

Please rewrite the code to ensure that:

- The message `Order#[number] will be dispatched soon`
gets displayed, once the `placeOrder` function has
finished executing.

- Incase, `noOfItems` is less than `5`, only the message
`Minimum 5 items required.` gets displayed.

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
