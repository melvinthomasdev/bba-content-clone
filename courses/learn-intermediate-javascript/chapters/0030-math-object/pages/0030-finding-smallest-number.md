`Math.min()` helps us find the smallest number from a group of numbers.

<codeblock language="javascript" type="lesson">
<code>
const minNum = Math.min(14, 42, 33, 750, 2);
console.log(minNum);
</code>
</codeblock>

Note that we are passing each number
as an argument to `Math.min()`.
We cannot pass an array to `Math.min()`.

<codeblock language="javascript" type="lesson">
<code>
const minNum = Math.min([1, 2, 3, 50, 12]);
console.log(minNum);
</code>
</codeblock>

Each argument passed to `Math.min()` can be
a number or a string containing only the number.
Passing any other type of argument will result in `NaN`.

<codeblock language="javascript" type="lesson">
<code>
const minNum = Math.min("1", 2, "3", 50, "12");
console.log(minNum);
</code>
</codeblock><codeblock language="javascript" type="lesson">
<code>
const minNum = Math.min(1, 2, 3, "a", 12);
console.log(minNum);
</code>
</codeblock>