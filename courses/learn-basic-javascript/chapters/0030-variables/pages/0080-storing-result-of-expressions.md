Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const sum = 23 + 45;
console.log(sum);
</code>
</codeblock>

In the example given above,
a single statement has two expressions:

- `23 + 45` is an expression.
  `+` is the operator.
  `23` and `45` are operands.
  `23 + 45` evaluates to `68`.

- `sum = 23 + 45` is an expression.
  `=` is the operator.
  `sum` and `23 + 45` are operands.
  Since `23 + 45` evaluates to `68`,
  the value `68` gets assigned to `sum`.

In the example given above,
we are assigning the result
of an expression - `23 + 45`,
to the variable `sum`.

In the example given above,
the expression `sum = 23 + 45`
has two operators `=` and `+`.
Since `+` has higher precedence over `=`,
the sum was calculated first
and
then the result was stored in `sum`.
