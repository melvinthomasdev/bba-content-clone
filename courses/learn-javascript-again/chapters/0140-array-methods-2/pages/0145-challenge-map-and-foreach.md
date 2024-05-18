In the code given below,
the `forEach` method is used
to create a new array containing
all the elements of `prices`
but with the "Rs. " prefix.

But since the `forEach` method
does not return an array
with the transformed elements,
replace it with the `map` method.

For example:
```js
Input: [60, 90, 100]

Output: ["Rs. 60", "Rs. 90", "Rs. 100"]
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const prices = [230, 420, 600];
const pricesWithPrefix = prices.forEach(price => `Rs. ${price}`);
console.log(pricesWithPrefix);
</code>

<solution>
const prices = [230, 420, 600];
const pricesWithPrefix = prices.map(price => `Rs. ${price}`);
console.log(pricesWithPrefix);
</solution>
</codeblock>
