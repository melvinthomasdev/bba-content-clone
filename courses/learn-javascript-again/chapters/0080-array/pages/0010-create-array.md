An array is used to
store multiple values together.

Let us take an example
of a list of fruits:

| Fruit    |
| -------- |
| "Apple"  |
| "Orange" |
| "Banana" |

An array is built
by a pair of **square brackets**,
with values placed inside
it separated by commas.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana"];

console.log(fruits);
</code>
</codeblock>

In the example given above,
the variable `fruits`
is assigned an array of three values -
`"Apple"`, `"Orange"`, and `"Banana"`.
These values are called
the **elements** of the `fruits` array.

Arrays in JavaScript are special
kind of objects.
Similar to an object,
it can hold a mix of different
data types.

Consider the following example:
<codeblock language="javascript" type="lesson">
<code>
const mixedArray = [1, "hello", true, null, undefined];

console.log(mixedArray);
</code>
</codeblock>
