- Define the function
  `getBalance`
  with three parameters
  `income`, `expense`, and `tax`.
  Use named parameters.

- `getBalance` should return the result of
  subtracting the values of `expense` and `tax`
  from the value of `income`.

- The default values of both
  `expense` and `tax` should be `0`.

- Call the function `getBalance`
  and,
  pass `100000` to the `income` parameter
  and
  `3000` to the `tax` parameter.
  Display the value returned using `console.log`


```js
Output:
97000
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const getBalance = ;
</code>

<solution>
const getBalance = ({ income, expense = 0, tax = 0 }) => income - expense - tax;

console.log(getBalance({ income: 100000, tax: 3000 }));
</solution>
</codeblock>
