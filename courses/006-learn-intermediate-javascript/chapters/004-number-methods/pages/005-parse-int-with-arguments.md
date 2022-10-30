Sometimes,
we may have numbers that
belong to a different
base other than decimal.
For the `parseInt()` method to
properly convert
these strings to integers,
we can pass a second parameter.

This parameter identifies
the base of the
number in the given string.
It could be hexadecimal,
binary, decimal, etc.

In the example given below,
the string contains
the binary form of the number **123**.
To convert this string
into a decimal number,
we pass **2** as the second parameter
to `parseInt()` which
specifies the number system.

<Editor lang="javascript">
<code>
let binaryNumber = "1111011";
let result = parseInt(binaryNumber, 2);
console.log(result);
</code>
</Editor>

In the example given below,
the string contains
the hexadecimal form of
the number **123**.
We pass **16** as
the second parameter
to specify that
this is a hexadecimal number.

<Editor lang="javascript">
<code>
let hexadecimalNumber = "7B";
console.log(parseInt(hexadecimalNumber, 16));
</code>
</Editor>