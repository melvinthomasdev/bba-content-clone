The `slice()` method copies
a portion of an array into a new array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange", "kiwi"];
const fruitsSubArray = fruits.slice(1, 4)
console.log(fruitsSubArray);
console.log(fruits);
</code>
</codeblock>

In the example given above,
the `slice()` method copies
all the items starting from index `1` to `4`,
but not including index `4`.

The `slice` method leaves the
original array untouched,
as shown in the example above.

We can pass negative values as arguments
to the `slice()` method.
A negative value means the index is
equal to the length of the array
minus the absolute value of that argument.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange", "kiwi"];
const fruitsSubArray1 = fruits.slice(-3);
const fruitsSubArray2 = fruits.slice(2);
console.log(fruitsSubArray1);
console.log(fruitsSubArray2);
</code>
</codeblock>

In the example given above,
`fruits.slice(-3)` copies
the last three elements
in the array.
It is equivalent to
`fruits.slice(2)`

If we call `slice()` without any arguments,
it creates a copy of the whole array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange", "kiwi"];
const newFruitsArray = fruits.slice();
console.log(newFruitsArray);
</code>
</codeblock>

If the first argument is
greater than the length of the array,
`slice()` returns an empty array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange", "kiwi"];
const newFruitsArray = fruits.slice(5);
console.log(newFruitsArray);
</code>
</codeblock>