## indexOf

Let's talk about some
array methods like `indexOf()`.
This method searches for
a given element in an array.
It returns the first index
at which the element is found.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("banana"));
</code>
</codeblock>

In the example given above,
`"banana"` is present at index `1` and `3`.
The `indexOf` method returns the value `1`,
as that is the first index
at which `"banana"` can be found.

If the element is not found
in the array,
it returns `-1`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("orange"));
</code>
</codeblock>

In the example given above,
`"orange"` is not present in the array.
Therefore,
the returned value is `-1`.

We can also specify the index
from which the `indexOf()`
method should start
looking for the element.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("banana", 2));
</code>
</codeblock>

In the example given above,
the search starts
from the index `2`.
Therefore,
the returned value is `3`.

## lastIndexOf

The `lastIndexOf()` method is
similar to the `indexOf()` method.
However,
it looks for the given element
from the last index to the first.
The `lastIndexOf()` method
returns the last index
at which the element is found.
If the element is not found,
it returns `-1`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.lastIndexOf("banana"));
</code>
</codeblock>

In the example given above,
`"banana"` is present at index `1` and `3`.
The `lastIndexOf` method returned value `3`,
since it is the last index at which
the element `"banana"` is found.

We can also specify the index
from which the `lastIndexOf()`
method should start
looking for the element.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.lastIndexOf("banana", 2));
</code>
</codeblock>

In the example given above,
the search starts
from the index `2`.
Therefore,
the returned value is `1`.
