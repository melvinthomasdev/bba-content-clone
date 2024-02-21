Please rewrite the code to ensure that the message `Order will be dispatched soon` gets displayed, once the `placeOrder` function has finished executing.

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = () => {
  setTimeout(() => {
    console.log("Order placed.");
  }, 5000);
};

placeOrder();
console.log("Order will be dispatched soon");
</code>

<solution>
const placeOrder = () =>
  new Promise(resolve => {
    setTimeout(() => {
      resolve("Order placed.");
    }, 5000);
  });

placeOrder()
  .then(message => {
    console.log(message);
    console.log("Order will be dispatched soon");
  })
</solution>
</codeblock>