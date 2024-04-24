Define a function `calculateBalance`
that takes three parameters -
`income`, `expense` and `tax`.
The function should return
the result of subtracting both
the values of `expense` and `tax`
from the value of `income`.

For example:
```js
Input: income = 500000, expense = 25000, tax = 25000

Output: 450000
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const calculateBalance = ;

console.log(calculateBalance(100000, 20000, 24000));
</code>

<solution>
const calculateBalance = (income, expense, tax) => {
  return income - expense - tax;
}

console.log(calculateBalance(100000, 20000, 24000));
</solution>
</codeblock>
