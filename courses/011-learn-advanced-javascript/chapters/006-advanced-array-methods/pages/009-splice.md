The `splice()` method can
modify an array by inserting,
removing or replacing elements.
It returns an array
of the removed elements.

<Editor lang="javascript">
<code>
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
let removedItems = numbers.splice(1, 3);

console.log(removedItems);
console.log(numbers);
</code>
</Editor>

In the example given above,
starting from index **1**,
`splice` removes **3** elements
from the `numbers`array.
The variable`removedItems`
stores the removed elements.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange"];
let fruitsSubArray = fruits.splice(2, 1, "kiwi");

console.log(fruits);
</code>
</Editor>

In the example given above,
it removes the element `mango`
at index **2**
and
inserts the element
`kiwi` in its place.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango", "orange"];
let fruitsSubArray = fruits.splice(2, 0, "kiwi");

console.log(fruits);
console.log(fruitsSubArray);
</code>
</Editor>

In the example given above,
it adds the element `kiwi`
at index `2` without
removing any element.
