When we add an expression
as a value to a variable,
it first gets evaluated
and
then the result is stored
in the variable.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const sum = 23 + 45;
console.log(sum);
</code>
</codeblock>

In the example given above,
we are storing the result of
an expression `23 + 45` as
a value to the variable `sum`.

In the next line, we are logging
the value of `sum` to the console.
We see that the console displays
**68**
and
not the expression `24 + 45` itself.

This is because the expression is first
evaluated, then the result of this
evaluation, **68**, is stored as a value
for the variable `sum`.
