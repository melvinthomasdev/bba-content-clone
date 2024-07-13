We can use the `===` operator
to check if two values are equal.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
console.log(9 === 9);

console.log(9 === "9");
</code>
</codeblock>

In the example given above:

- `9 === 9` results in `true`
  because they are the same value.

- `9 === "9"` results in `false`
  because one is a number
  and
  the other is a string.
  They are not equal.

We can also use the `===` operator
to check the value of variables.

<codeblock language="javascript" type="lesson">
<code>
const sum = 3 + 9;
console.log(sum === 10);

const product = 3 * 4;
console.log(sum === product);
</code>
</codeblock>

In the example given above:

- `const sum = 3 + 9` stores the result
  of `3 + 9`, i.e., `12` in the variable `sum`.

- `sum === 10` results in `false`
  because the value of `sum`, i.e., `12`,
  is not equal to `10`.

- `const product = 3 * 4` stores the result
  of `3 * 4`, i.e., `12` in the variable `product`.

- `sum === product` results in `true`
  because the value of `sum`, i.e., `12`,
  is equal to the value of `product`, i.e., `12`.
