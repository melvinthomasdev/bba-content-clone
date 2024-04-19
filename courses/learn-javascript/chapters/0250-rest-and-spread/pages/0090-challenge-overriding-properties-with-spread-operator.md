Create a new object `updatedOrder`,
that contains all the properties from order
but
override the values of `status` and `currentLocation`
with the properties from `newInfo`.

```js
Output:
{
  price: 8300,
  isPaid: true,
  status: "On the way",
  currentLocation: "Bangalore",
}
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const order = {
  price: 8300,
  isPaid: true,
  status: "Packed",
  currentLocation: "Delhi",
}

const newInfo = {
  status: "On the way",
  currentLocation: "Bangalore",
}

const updatedOrder = ;

console.log(updatedOrder);
</code>

<solution>
const order = {
  price: 8300,
  isPaid: true,
  status: "Packed",
  currentLocation: "Delhi",
}

const newInfo = {
  status: "On the way",
  currentLocation: "Bangalore",
}

const updatedOrder = {
  ...order,
  ...newInfo,
};

console.log(updatedOrder);
</solution>
</codeblock>
