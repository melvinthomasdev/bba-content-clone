`Set` is a collection of **unique** values.
It can store values of any type.

<codeblock language="javascript" type="lesson">
<code>
const fruits = new Set(["apple", "orange", "mango"]);
console.log(fruits);
</code>
</codeblock>

Sets are very similar to Arrays.
One main difference between Sets and Arrays
is that a Set can only contain **unique** values.
Arrays can have duplicate elements.

<codeblock language="javascript" type="lesson">
<code>
const fruits = new Set(["apple", "orange", "mango", "apple", "grape"]);
console.log(fruits);
</code>
</codeblock>

In the example given above,
even though we pass an array with
two elements with the same value `"apple"`,
to `new Set()`,
the set `fruits` only contains
one element with the value `"apple"`.
The set retains the first `"apple"` element
and
ignores all other duplicates.
