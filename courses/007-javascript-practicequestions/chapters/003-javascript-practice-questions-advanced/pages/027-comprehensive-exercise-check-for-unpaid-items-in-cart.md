Check whether there are any unpaid items in the cart.

1. Input will be a cart object with list of items.
2. Each item will have a field `paymentStatus`.
3. Return true if atleast one item in the cart have `paymentStatus` as `false`.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function checkCart(cart){
  // write your code here
}
</code>

<solution>
function checkCart(cart){
  return cart.some((item) => !item.paymentStatus);
}
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
    item: "Coffe Beans",
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
</testcases>
</Editor>