Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const priceOfProduct = 200;
const taxOnProduct = 10;
const numberOfProducts = 5;

console.log("Total price of order:")
console.log(priceOfProduct + taxOnProduct * numberOfProducts);
</code>
</codeblock>

In the example given above,
we have an expression
`priceOfProduct + taxOnProduct * numberOfProducts`
that contains two operators,
i.e., `+` and `*`.
The calculation that was supposed to happen
in the example was:

- First, we find the sum
  `priceOfProduct + taxOnProduct`,
  i.e., `210`.

- Then we multiply the sum `210`
  with `numberOfProducts`,
  to get `1050`.

However, we got the result as `250`
because the actual calculation
that was done is,

- First, the product
  `taxOnProduct * numberOfProducts`
  was calculated, i.e., `50`.

- Then `priceOfProduct` was
  added with the product `50`.

The calculation was done
in this order because,
when the operators `+` and `*`
are used in the same expression,
the `*` operator is evaluated first.
This is because `*` has more
**precedence** over `+`.
To learn more about precedence,
refer to the link in the resources.

In the example given above,
we can use the parentheses `()`
to ensure `+` operation is done first.
This is because `()`
known as the **grouping operator**
has the highest precedence.

<codeblock language="javascript" type="lesson">
<code>
const priceOfProduct = 200;
const taxOnProduct = 10;
const numberOfProducts = 5;

console.log("Total price of order:")
console.log((priceOfProduct + taxOnProduct) * numberOfProducts);
</code>
</codeblock>

In the example given above,
we can say that `(priceOfProduct + taxOnProduct)`
is a sub-expression inside the expression
`(priceOfProduct + taxOnProduct) * numberOfProducts`.
Whenever there is a sub-expression wrapped in `()`,
the sub-expression is executed first.
Hence we get the proper output - `1050`, i.e.,
the product of `priceOfProduct + taxOnProduct`
and
`numberOfProducts`.

## Resources

- [Operator precedence](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Operator_Precedence)
