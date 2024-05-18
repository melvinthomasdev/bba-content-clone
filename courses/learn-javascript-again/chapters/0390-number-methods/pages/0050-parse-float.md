The `parseFloat()` function extracts a floating-point number from a string.

- It converts each character in the string to integer,
  until it encounters a non-numerical value
  except the decimal `.` and exponent `e` or `E` notations.

- It returns `NaN` if the string does not start with
  a numerical value, `+`, `-`, or `.`.

- It returns `Infinity` for `"Infinity"`
  and
  `-Infinity` for `"-Infinity"`.

<codeblock language="javascript" type="lesson">
<code>
const boxHeightString = "12.34px";
const numericValue = parseFloat(boxHeightString);
console.log(numericValue);
</code>
</codeblock>

In the example given above,
the `parseFloat()` function converts the first set of numerical characters
and
decimal point,
i.e., `"12.34"` to a floating-point number.
Since the next character `"p"` is a non-numerical,
the function stops execution
and
returns `12.34`.
