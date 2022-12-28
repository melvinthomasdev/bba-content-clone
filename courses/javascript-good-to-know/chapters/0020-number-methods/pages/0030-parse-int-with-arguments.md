The `parseInt()` function can also be used
to parse numbers of a different base than decimals.
To do that,
we can pass the base number as the second parameter to `parseInt()`.

In the example given below,
the string contains a binary number.
To convert this string into a decimal number,
we pass the base of binary numbers - **2**
as the second parameter to `parseInt()`.

<codeblock language="javascript" type="lesson">
<code>
const binaryNumber = "1111011";
const decimalNumber = parseInt(binaryNumber, 2);
console.log(decimalNumber);
</code>
</codeblock>

In the example given below,
the string contains a hexadecimal number
and
we pass the base number of hexadecimals - `16`
as the second parameter to `parseInt()`,
in order to get the parsed integer value.

<codeblock language="javascript" type="lesson">
<code>
const hexadecimalNumber = "7B";
console.log(parseInt(hexadecimalNumber, 16));
</code>
</codeblock>