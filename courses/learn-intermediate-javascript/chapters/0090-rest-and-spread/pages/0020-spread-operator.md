The **spread operator**,
denoted using triple dots like `...`,
can be used to expand an iterable,
such as an array or a string,
into arguments that can be passed into a function,
or elements that can be inserted into an array.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const maxNum = Math.max(1, 2, 3, 50, 12);
console.log(maxNum);
</code>
</codeblock>

In the example above,
`Math.max()` is used to find the largest value from the arguments passed.
What if we need to find the largest value from an array of numbers?
In that case we can pass the array as a list of arguments using the `...` operator.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 50, 12]
const maxNum = Math.max(...numbers);
console.log(maxNum);
</code>
</codeblock>

The `...` operator can also be used for other purposes,
which will be discussed in the following chapters.
