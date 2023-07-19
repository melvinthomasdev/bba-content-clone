Define a function `calculateBalance`
that takes three parameters -
`income`, `expense` and `tax`.
The function should return
the result of subtracting both
the values of `expense` and `tax`
from the value of `income`.

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