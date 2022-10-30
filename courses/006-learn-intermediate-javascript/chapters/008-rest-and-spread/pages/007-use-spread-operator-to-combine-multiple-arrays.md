We can use the spread operator 
to combine multiple arrays into a single array.

<Editor lang="javascript">
<code>
let array1 = [1, 2];
let array2 = [3, 4, 5];
let array3 = [6, 7];
let array4 = [...array1, ...array2, ...array3];

console.log(array4);
</code>
</Editor>