The `includes()` method searches
for an element in the array.
If the element is present
in the array,
it returns `true`.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango"];
console.log(fruits.includes("banana"));
</code>
</Editor>

If the element is not present
in the array,
`includes()` returns `false`.

<Editor lang="javascript">
<code>
let fruits = ["apple", "banana", "mango"];
console.log(fruits.includes("orange"));
</code>
</Editor>