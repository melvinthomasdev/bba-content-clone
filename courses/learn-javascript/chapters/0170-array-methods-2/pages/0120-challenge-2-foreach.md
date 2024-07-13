In the code below,
we have an array of objects.
Each object holds details of
a product.

Log the details of each product
in the following manner:
`Product: [Product Name], Price: $[Product Price]`

Calculate the total price of all
products and log it to the console.

For example:
```js
Input:
products = [
  { id: 1, name: "Watch", price: 50 },
  { id: 2, name: "Pen", price: 10 },
  { id: 3, name: "Notebook", price: 20 }
];

Output:
"Total Price: $80"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const products = [
  { id: 1, name: "Laptop", price: 999 },
  { id: 2, name: "Phone", price: 499 },
  { id: 3, name: "Tablet", price: 299 }
];

// Write code below
</code>

<solution>
const products = [
  { id: 1, name: "Laptop", price: 999 },
  { id: 2, name: "Phone", price: 499 },
  { id: 3, name: "Tablet", price: 299 }
];

// Write code below
let totalPrice = 0;

products.forEach(product => {
  console.log(`Product: ${product.name}, Price: $${product.price}`);
  totalPrice += product.price;
});

console.log(`Total Price: $${totalPrice}`);
</solution>
</codeblock>
