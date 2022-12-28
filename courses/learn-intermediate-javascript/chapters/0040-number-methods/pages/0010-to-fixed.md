Sometimes,
we need to fix the precision
for our decimal numbers.
For example,
we might need **2.43519**
to be represented as **2.44**.
The `toFixed()` method fixes the number
of digits after the decimal point.

<codeblock language="javascript" type="lesson">
<code>
const exactValue = 4.34167;
const fixedValue = exactValue.toFixed(2);
console.log(fixedValue);
</code>
</codeblock>

In the above example,
`exactValue.toFixed(2)` converts the value `4.34167`
to have just `2` digits after the decimal point.

The `toFixed` method doesn't simply keep 2 digits after the decimal point
and
remove the rest,
it also rounds of the last digit.

<codeblock language="javascript" type="lesson">
<code>
const exactValue = 62.34567;
const fixedValue = exactValue.toFixed(2);
console.log(fixedValue);
</code>
</codeblock>

In the above example,
instead of just returning a value with the first 2 decimal values,
i.e., `"62.34"`,
we get the rounded value `"62.35"`.

Note that `toFixed()` returns a string.
