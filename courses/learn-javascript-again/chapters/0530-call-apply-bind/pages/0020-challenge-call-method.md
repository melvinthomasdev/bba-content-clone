Using the `call()` method,
invoke the `displayDiscountedPrice` function
such that the `this` keyword refers to `product`.
Pass `0.12` to the parameter `discount`
of the `displayDiscountedPrice` function on invocation.
​
For example:

```js
Input:
const product = {
  name: "Smartphone",
  price: 80000,
}

Output:
"Smartphone is now available for 70400"
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const product = {
  name: "Laptop",
  price: 50000,
};

const displayDiscountedPrice = function (discount) {
const discountedPrice = this.price - this.price \* discount;
console.log(`${this.name} is now available for ${discountedPrice}`);
}

</code>

<solution>
const product = {
  name: "Laptop",
  price: 50000,
};

const displayDiscountedPrice = function (discount) {
const discountedPrice = this.price - this.price \* discount;
console.log(`${this.name} is now available for ${discountedPrice}`);
}

displayDiscountedPrice.call(product, 0.12);
</solution>
</codeblock>
​

​
