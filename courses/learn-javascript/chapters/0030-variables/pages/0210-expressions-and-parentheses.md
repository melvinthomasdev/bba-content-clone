Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const numberOfBoysInOneClass = 30;
const numberOfGirlsInOneClass = 20;
const numberOfClasses = 10;

console.log("Total number of boys and girls:")
console.log(numberOfBoysInOneClass + numberOfGirlsInOneClass * numberOfClasses);
</code>
</codeblock>

In the example given above,
we have an expression
`numberOfBoysInOneClass + numberOfGirlsInOneClass * numberOfClasses`
that contains two operators,
i.e., `+` and `*`.
The calculation that was supposed to happen
in the example was:

- First, we find the sum
  `numberOfBoysInOneClass + numberOfGirlsInOneClass`,
  i.e., `50`.

- Then we multiply the above sum
  with `numberOfClasses` i.e., `10`
  to get `500`.

However, we got the result as `230`
because the actual calculation
that was done is,

- First, the product
  `numberOfGirlsInOneClass * numberOfClasses`
  was calculated, resulting `200`.

- Then `numberOfBoysInOneClass` which is `30`, was
  added with `200`.

The calculation was done
in this order because,
when the operators `+` and `*`
are used in the same expression,
the `*` operator is evaluated first.
This is because `*` has more
**precedence** over `+`.

In the example given above,
we can use the parentheses `()`
to ensure `+` operation is done first.
This is because `()`
known as the **grouping operator**
has the highest precedence.

<codeblock language="javascript" type="lesson">
<code>
const numberOfBoysInOneClass = 30;
const numberOfGirlsInOneClass = 20;
const numberOfClasses = 10;

console.log("Total number of boys and girls:")
console.log((numberOfBoysInOneClass + numberOfGirlsInOneClass) * numberOfClasses);
</code>
</codeblock>

In the example given above,
we can say that `(numberOfBoysInOneClass + numberOfGirlsInOneClass)`
is a sub-expression inside the expression
`(numberOfBoysInOneClass + numberOfGirlsInOneClass) * numberOfClasses`.
Whenever there is a sub-expression wrapped in `()`,
the sub-expression is executed first.
Hence we get the proper output - `500`, i.e.,
the product of `numberOfBoysInOneClass + numberOfGirlsInOneClass`
and
`numberOfClasses`.
