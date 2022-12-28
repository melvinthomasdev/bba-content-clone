`Math` is an in-built object in JavaScript
that contains mathematical constants
and
methods that perform mathematical calculations.

`Math.max()` is a method
that returns the largest number
from a group of numbers
as shown in the example below.

<codeblock language="javascript" type="lesson">
<code>
const maxNum = Math.max(1, 2, 3, 50, 12);
console.log(maxNum);
</code>
</codeblock>

Note that we are passing each number
as an argument to `Math.max()`.
We cannot pass an array to `Math.max()`.

<codeblock language="javascript" type="lesson">
<code>
const maxNum = Math.max([1, 2, 3, 50, 12]);
console.log(maxNum);
</code>
</codeblock>

Each argument passed to `Math.max()` can be
a number or a string containing only the number.
Passing any other type of argument will result in `NaN`.

<codeblock language="javascript" type="lesson">
<code>
const maxNum = Math.max(1, "2", 3, "50", 12);
console.log(maxNum);
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const maxNum = Math.max(1, 2, 3, "a", 12);
console.log(maxNum);
</code>
</codeblock>