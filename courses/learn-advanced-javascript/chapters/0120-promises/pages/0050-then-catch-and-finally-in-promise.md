Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const placeOrder = noOfItems => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (noOfItems < 5) reject(new Error("Minimum 5 items required."));
    resolve("Order Placed.");
  }, 5000);
});

placeOrder(10)
  .then(message => {
    console.log(message);
    console.log("Please come again!");
  })
  .catch(error => console.log(error.message));
</code>
</codeblock>

In the example given above,
since the argument passed in
`placeOrder(10)` is not less than `5`,
we get the output **"Order Placed."**
and
**"Please come again!"**.
Now let's see what happens
when the argument for `noOfItems` is `2`:

<codeblock language="javascript" type="lesson">
<code>
const placeOrder = noOfItems => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (noOfItems < 5) reject(new Error("Minimum 5 items required."));
    resolve("Order Placed.");
  }, 5000);
});

placeOrder(2)
  .then(message => {
    console.log(message);
    console.log("Please come again!");
  })
  .catch(error => console.log(error.message));
</code>
</codeblock>

In the example given above,
since the argument passed in
`placeOrder(2)` is less than `5`,
we get the output **"Minimum 5 items required."**.

Let's say we want to show
the message **"Please come again!"**
regardless of if the `Promise`
gets resolved or rejected.
In that case,
we can use `.finally()`.

The function passed as argument
to `.finally()` gets executed
regardless of if the `Promise`
gets resolved or rejected.

<codeblock language="javascript" type="lesson">
<code>
const placeOrder = noOfItems => new Promise((resolve, reject) => {
  setTimeout(() => {
    if (noOfItems < 5) reject(new Error("Minimum 5 items required."));
    resolve("Order Placed.");
  }, 5000);
});

placeOrder(2)
  .then(message => console.log(message))
  .catch(error => console.log(error.message))
  .finally(() => console.log("Please come again!"));
</code>
</codeblock>