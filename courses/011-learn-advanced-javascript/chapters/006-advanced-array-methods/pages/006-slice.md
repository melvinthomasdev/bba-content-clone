The `slice()` method copies
a portion of an array into a new array.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange", "kiwi"];
let fruitsSubArray = fruits.slice(1, 4)
console.log(fruitsSubArray);
</code>
</Editor>

In the example given above,
the `slice()` method copies
all the items starting from index **1** to **4**, but not including index **4**.

If we apply negative index values, the `slice()` method starts counting the position from the array end.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange", "kiwi"];
let fruitsSubArray = fruits.slice(-3);
console.log(fruitsSubArray);
</code>
</Editor>

In the example given above,
`slice(-3)` copies
the last three elements
in the array.

If we call `slice()` without any arguments,
it creates a copy of the whole array.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange", "kiwi"];
let newFruitsArray = fruits.slice();
console.log(newFruitsArray);
</code>
</Editor>

If the starting index is
greater than the number of items,
it returns an empty array:

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange", "kiwi"];
let newFruitsArray = fruits.slice(5);
console.log(newFruitsArray);
</code>
</Editor>

As can be seen in
the examples given above,
`slice` leaves
the original array untouched.
