The `parseInt()` function extracts an integer from a string.

- The `parseInt()` function converts each character in the string to integer,
  until it encounters a non-numerical value.

- It returns `NaN` if the string does not start with
  a numerical value, `+`, `-`, or `0X`.

<codeblock language="javascript" type="lesson">
<code>
const boxHeightString = "123px";
const boxHeightValue = parseInt(boxHeightString);
console.log(boxHeightValue);
</code>
</codeblock>

In the example given above,
the `parseInt()` function converts the first set of numerical characters,
i.e., `"123"` to integer.
Since the next character `"p"` is a non-numerical,
the function stops execution
and
returns `123`.

<codeblock language="javascript" type="lesson">
<code>
const length = "12.34";
console.log(parseInt(length));
</code>
</codeblock>

In the example given above,
the `parseInt()` function converts the first set of numerical characters,
i.e., `"12"` to integer.
Since the next character `"."` is a non-numerical,
the function stops execution
and
returns `12`.

<codeblock language="javascript" type="lesson">
<code>
const priceString = "Rs.500";
console.log(parseInt(priceString));
</code>
</codeblock>

In the above example,
the `parseInt()` function returns `NaN`
because it starts with the character `"R"`,
which is not a number.
