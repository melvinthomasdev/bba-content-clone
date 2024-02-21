In the code given below, there are two asynchronous operations `placeOrder` and `showOrderStatus`. Create a function `checkout()` and use `async/await` to invoke both `placeOrder` and `showOrderStatus` such that `showOrderStatus` should be invoked only after the completion of `placeOrder`.

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = () => new Promise(resolve =>
  setTimeout(() => resolve("Order Placed"), 3000)
);

const showOrderStatus = () => new Promise(resolve =>
  setTimeout(() => resolve("Order is dispatched"), 1000)
);
</code>

<solution>
const placeOrder = () => new Promise(resolve =>
  setTimeout(() => resolve("Order Placed"), 3000)
);

const showOrderStatus = () => new Promise(resolve =>
  setTimeout(() => resolve("Order is dispatched"), 1000)
);

const checkout = async () => {
  const message = await placeOrder();
  console.log(message);

  const status = await showOrderStatus();
  console.log(status);
};
checkout();
</solution>
</codeblock>
