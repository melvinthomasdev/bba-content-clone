The `parseFloat()` function returns
a floating-point number from a string.
It reads the number
from the string
until it reaches
a character that cannot
be converted to an integer.

In the example given below,
the string stored in the variable
`floatingNumber`,
contains the number **12.34**
and
the letters **px**.
The function
stops reading the string
as soon as it gets
the letter **p**
and
returns the floating-point number.

<Editor lang="javascript">
<code>
let floatingNumber = "12.34px";
let result = parseFloat(floatingNumber);
console.log(result);
</code>
</Editor>