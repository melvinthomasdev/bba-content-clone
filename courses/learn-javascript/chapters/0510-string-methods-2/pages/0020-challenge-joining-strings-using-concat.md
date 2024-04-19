Use the `concat` method to join the values of `currency` and `amount`,
and
store it in the variable `price`.

For example:
```js
Input: currency = "$", amount = "10,000"
Output: "$10,000"
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const currency = "Rs.";
const amount = "50,000";

const price = ;
console.log(price);
</code>

<solution>
const currency = "Rs.";
const amount = "50,000";

const price = currency.concat(amount);
console.log(price);
</solution>
</codeblock>
