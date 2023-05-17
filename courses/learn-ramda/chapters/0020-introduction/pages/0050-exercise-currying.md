Consider the following fruit filter function. It returns only the fruits whose character length is less than or equal to 6. Suppose we want to reuse this filter function for other arrays, we need to call `filter(withLessThanSixChars, inputArray)` again and again.
```js
const withLessThanSixChars = fruitName => fruitName.length <= 6;

const filteredFruits = filter(withLessThanSixChars, fruits);
```

Let's create a function that filters the input array based on the `withLessThanSixChars` condition. Remember to curry the input array.

<codeblock language="javascript" type="exercise" testMode="fixedInput" packages="ramda">
<code>
const fruits = ["watermelon", "orange", "papaya", "strawberry"];

const users = ["Mater", "Sally", "McQueen"];

const withLessThanSixChars = item => item.length <= 6;

const filterArray =  // write code here;

console.log(filterArray(fruits));
console.log(filterArray(users));
</code>

<solution>
const fruits = ["watermelon", "orange", "papaya", "strawberry"];

const users = ["Mater", "Sally", "McQueen"];

const withLessThanSixChars = item => item.length <= 6;

const filterArray = R.filter(withLessThanSixChars);

console.log(filterArray(fruits));
console.log(filterArray(users));

// If Ramda functions weren't curried, we would need to define `filterArray` as:
// const filterArray = array => R.filter(withLessThanSixChars, array);
</solution>
</codeblock>
