An expression is a piece of code
that evaluates to something.
It contains at least one operator
and
one operand.
Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const name = "Sam Smith";
</code>
</codeblock>

In the example given above,
`name = "Sam Smith"`
is an expression.
`=` is an operator, i.e.,
the assignment operator.
`name` and `"Sam Smith"` are operands.

The assignment operator `=`
requires two operands,
a left-hand operand
and
a right-hand operand.

In the example given above,
`name` is the left-hand operand
and
`"Sam Smith"` is the
right-hand operand.
The assignment operator
assigns the value
from the right-hand operand
to the left-hand operand.
In the example given above,
the `=` operator
assigns the value `"Sam Smith"`
to the variable `name`.

Let's take a look at
some other expressions:

<codeblock language="javascript" type="lesson">
<code>
console.log(23 + 45);

const length = 1000;
console.log(length / 100);

console.log(typeof ["Apple", "Banana"]);
</code>
</codeblock>

In the above example:

- `23 + 45` is an expression.
  `+` is the operator.
  `23` and `45` are operands.

- `length = 1000` is an expression.
  `=` is the operator.
  `length` and `1000` are operands.

- `length / 100` is an expression.
  `/` is the operator.
  `length` and `100` are operands.

- `typeof ["Apple", "Banana"]` is an expression.
  `typeof` is the operator.
  `["Apple", "Banana"]` is the operand.

Note that, operators that require two operands
are called **binary operators**.
`+`, `-`, `*`, `/`, and `=`
are all binary operators.
Operators that require only one operand
are called **unary operators**.
`typeof` is a unary operator.

The operators `+`, `-`, `*`, and `/`
are called **arithmetic operators**
and
are used to perform
arithmetic operations on numbers.
