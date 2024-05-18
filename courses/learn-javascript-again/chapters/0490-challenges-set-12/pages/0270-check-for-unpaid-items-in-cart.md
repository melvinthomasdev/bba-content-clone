Check whether there are any unpaid items in the cart.

1. Input will be a cart object with a list of items.
2. Each item will have a field `paymentStatus`.
3. Return true if at least one item in the cart has `paymentStatus` as `false`.

For example:
```js
Input:
cart = [
  {
    item: "Laptop",
    paymentStatus: false
  },
  {
    item: "Headphones",
    paymentStatus: false
  },
  {
    item: "Mouse",
    paymentStatus: false
  },
  {
    item: "Charger",
    paymentStatus: false
  }
];

Output:
true
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const checkCart = cart => {
  // write your code here
}
</code>

<solution>
const checkCart = cart =>
  cart.some((item) => !item.paymentStatus);
</solution>

<testcases>
<caller>
console.log(checkCart(cart));
</caller>
<testcase>
<i>
const cart = [
  {
    item: "Snacks",
    paymentStatus: false
  },
  {
    item: "Pen",
    paymentStatus: false
  },
  {
    item: "Books",
    paymentStatus: true
  },
  {
    item: "Notepad",
    paymentStatus: true
  }
];
</i>
</testcase>
<testcase>
<i>
const cart = [
  {
    item: "Rice",
    paymentStatus: false
  },
  {
    item: "Pasta",
    paymentStatus: true
  },
  {
    item: "Flour",
    paymentStatus: true
  },
  {
    item: "Cheese",
    paymentStatus: false
  }
];
</i>
</testcase>
<testcase>
<i>
const cart = [
  {
    item: "Juice",
    paymentStatus: true
  },
  {
    item: "Coffee Beans",
    paymentStatus: true
  },
  {
    item: "Sugar",
    paymentStatus: true
  },
  {
    item: "Milk",
    paymentStatus: true
  }
];
</i>
</testcase>
<testcase>
<i>
const cart = [
  {
    item: "Laptop",
    paymentStatus: false
  },
  {
    item: "Headphones",
    paymentStatus: false
  },
  {
    item: "Mouse",
    paymentStatus: false
  },
  {
    item: "Charger",
    paymentStatus: false
  }
];
</i>
</testcase>
</testcases>
</codeblock>
