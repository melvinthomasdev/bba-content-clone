The function **calculateTotalPrice** accepts an array of items
as input, where each item is represented as an object
with properties **itemName**, **price**, and **discountPercentage**.
The function should determine the total price of the items in the
shopping cart after applying any available discounts.
If the input array is empty, the function should return 0.

The formula to calculate the discounted price
is **price - (price * (discountPercentage / 100))**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
function calculateTotalPrice(items) {
  // Your code goes here

}
</code>

<solution>
function calculateTotalPrice(items) {
  let totalPrice = 0;

  items.forEach(item => {
    const discountedPrice = item.discountPercentage > 0
      ? item.price - (item.price * (item.discountPercentage / 100))
      : item.price;

    totalPrice += discountedPrice;
  });

  return totalPrice;
}
</solution>

<testcases>
<caller>
console.log(calculateTotalPrice(items));
</caller>
<testcase>
<i>
const items = [
  { itemName: "Laptop", price: 1200, discountPercentage: 10 },
  { itemName: "Backpack", price: 50, discountPercentage: 0 },
  { itemName: "Notebook", price: 20, discountPercentage: 20 },
];
</i>
</testcase>
<testcase>
<i>
const items = [
  { itemName: "Smartphone", price: 500, discountPercentage: 10 },
  { itemName: "Headphones", price: 80, discountPercentage: 20 },
  { itemName: "iPod", price: 30, discountPercentage: 5 },
];
</i>
</testcase>
<testcase>
<i>
const items = [
  { itemName: "T-shirt", price: 15, discountPercentage: 0 },
  { itemName: "Jeans", price: 50, discountPercentage: 0 },
  { itemName: "Sneakers", price: 80, discountPercentage: 0 },
];
</i>
</testcase>
<testcase>
<i>
const items = [];
</i>
</testcase>
</testcases>
</codeblock>
