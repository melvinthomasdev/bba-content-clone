In the following example,
the output is displayed
based on the `if` **condition** -
`number % 2 === 0`.

<codeblock language="javascript" type="lesson">
<code>
const number = 4;

if (number % 2 === 0) {
  console.log("even");
} else {
  console.log("odd");
}
</code>
</codeblock>

We can also use the **Ternary operator**
to achieve the same logic
from the example given above.

The **Ternary operator** has
three parts or operands.

- It starts with
  a **condition** followed by
  the `?` operator.

- It is then
  followed by two expressions,
  separated by the `:` operator.

- The expression to the left
  of the `:` operator is evaluated
  when the **condition** is `true`.

- The expression to the right
  of the `:` operator is evaluated
  when the **condition** is `false`.

In the following example,
the `numberType` variable is assigned
a value based on the result of a
**ternary operation**.
The `numberType` variable will be assigned
**"even"**, i.e., the expression on
the left side of the `:` operator,
if the **condition**
`number % 2 === 0` is `true`.
The `numberType` variable will be assigned
**"odd"**, i.e., the expression on
the right side of the `:` operator,
if the **condition**
`number % 2 === 0` is `false`.

<codeblock language="javascript" type="lesson">
<code>
const number = 4;
const numberType = (number % 2 === 0) ? "even" : "odd";
console.log(numberType);
</code>
</codeblock>

The Ternary operator
requires fewer lines of code,
when compared to the
`if...else` statement,
making it easy to write.
The reduced lines of code also
make it easy to read and
comprehend the logic.

The Ternary operator
should only be used
when all three operands
are small.
Using the Ternary operator
with large operands
makes the code
less comprehensible
and
harder to debug
in the future.
