In the code given below, there are two asynchronous operations `placeOrder` and `showOrderStatus`. Invoke both `placeOrder` and `showOrderStatus` such that `showOrderStatus` should be invoked only after the completion of `placeOrder`.

```js
Output:
// This will be displayed after 3 seconds
"Order Placed"
// This will be displayed after 1 second
"Order is dispatched"
```

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = () =>
  new Promise(resolve => setTimeout(() => resolve("Order Placed"), 3000));

const showOrderStatus = () =>
new Promise(resolve =>
setTimeout(() => resolve("Order is dispatched"), 1000)
);

</code>

<solution>
const placeOrder = () =>
  new Promise(resolve => setTimeout(() => resolve("Order Placed"), 3000));

const showOrderStatus = () =>
new Promise(resolve =>
setTimeout(() => resolve("Order is dispatched"), 1000)
);

placeOrder()
.then(message => {
console.log(message);

    return showOrderStatus();

})
.then(message => console.log(message));

</solution>
</codeblock>
