Modify the below `placeholder` function in such a way that the promise should be rejected if the `noOfItems` is less than 5 with the message "Minimum 5 items required." and it should be logged using `console.log` in the `catch` block.

<codeblock type="exercise" language="javascript" evaluateAsync="true" timeOut="2000" testMode="fixedInput">
<code>
const placeOrder = noOfItems =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      resolve("Order placed.");
    }, 5000);
  });

const showOrderStatus = () => new Promise(resolve =>
  setTimeout(() => resolve("Order is dispatched"), 1000)
);

const checkout = async () => {
  const message = await placeOrder(2);
  console.log(message);

  const status = await showOrderStatus();
  console.log(status);
};
checkout();
</code>

<solution>
const placeOrder = noOfItems =>
  new Promise((resolve, reject) => {
    setTimeout(() => {
      if (noOfItems < 5) reject("Minimum 5 items required.");
      else resolve("Order placed.");
    }, 5000);
  });

const showOrderStatus = () => new Promise(resolve =>
  setTimeout(() => resolve("Order is dispatched"), 1000)
);

const checkout = async () => {
  try {
    const message = await placeOrder(2);
    console.log(message);

    const status = await showOrderStatus;
    console.log(status);
  } catch (error) {
    console.log(error);
  }
};
checkout();
</solution>
</codeblock>
