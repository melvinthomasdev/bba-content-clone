## indexOf

Let's talk about some
array methods like `indexOf()`.
This method searches for
a given element in an array.
It returns the first index
at which the element occurs.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("banana"));
</code>
</Editor>

In the example given above,
`banana` is present
at index **1**
and
**3**.
The `indexOf` method returns
the value **1**,
as `banana` first occurs
at index **1**.

If the element is not found
in the array,
it returns **-1**.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("orange"));
</code>
</Editor>

In the example given above,
`orange` is not present
in the array.
Therefore,
the returned value is **-1**.

We can also specify the index
from which the `indexOf()`
method should start
looking for the element.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.indexOf("banana", 2));
</code>
</Editor>

In the example given above,
the search starts
from the index **2**.
Therefore,
the returned value is **3**.

## lastIndexOf

The `lastIndexOf()` method is
similar to the `indexOf()` method.
However,
it starts looking for
the given element from the end.
It returns the last index
at which the element occurs.
If the element is not present,
it returns **-1**.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "banana"];
console.log(fruits.lastIndexOf("banana"));
</code>
</Editor>

In the example given above,
`banana` is present at index **1**
and
**3**.
The `lastIndexOf` method
returned value **3**.
It is the index at which
the element `banana` occurs last.
