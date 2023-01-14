`_` (underscore) is a valid
variable name in JavaScript.
It should only be used
to indicate that a parameter
is not being used in a function.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana", "Mango"];

fruits.forEach((fruit, index) => console.log(index));
</code>
</codeblock>

In the example given above,
the function passed as the argument to `forEach`
has two parameters - `fruit` and `index`.
But the function does not use
the `fruit` parameter
and
we should not have any unused variables.
Since the function uses positional parameters,
the `index` can only be accessed in the second parameter.
So we can use `_` as the first parameter
in order to omit the first parameter
and
have `index` as the second parameter,
as shown in the example below:

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana", "Mango"];

fruits.forEach((_, index) => console.log(index));
</code>
</codeblock>

The parameter name `_` can be used
to indicate that the parameter
will not be used in the function.
