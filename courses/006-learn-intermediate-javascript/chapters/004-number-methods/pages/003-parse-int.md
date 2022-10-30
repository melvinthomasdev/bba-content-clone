The `parseInt()` function analyzes
a string
and
returns an integer.
It reads the string
and
converts it
until it gets a character
which cannot be
converted to a number.

In the example given below,
the string stored in
the variable `myNum` contains
numbers **123**
and
the letters **px**.
The function
stops reading the string
as soon as it gets to the letter **p**
and
returns **123** as the result.

<Editor lang="javascript">
<code>
let myNum = "123px";
let result = parseInt(myNum);
console.log(result);
</code>
</Editor>

When the string has
a floating point number,
the function ignores the numbers
after the decimal point and returns
the integer part of the number.

In the example give below,
the function ignores **34**
that comes after the decimal point.

<Editor lang="javascript">
<code>
let myNum = "12.34";
console.log(parseInt(myNum));
</code>
</Editor>