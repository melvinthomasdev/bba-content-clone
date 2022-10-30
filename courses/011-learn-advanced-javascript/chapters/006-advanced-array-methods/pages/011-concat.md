The the `concat()` method copies
elements from other
arrays into a new array.
It does not modify
the original arrays.

<Editor lang="javascript">
<code>
let evenNumbers = [2, 4, 6];
let oddNumbers = [1, 3, 5];
let numbers = evenNumbers.concat(oddNumbers);
console.log(numbers);
</code>
</Editor>

In the example given above,
the array `numbers` contains
the elements of both
the `evenNumbers` array
as well as
the `oddNumbers` array.

Other than arrays,
the `concat()` method accepts strings,
numbers or boolean as arguments too.

<Editor lang="javascript">
<code>
let evenNumbers = [2, 4, 6];
let oddNumbers = [1, 3, 5];
let numbers = evenNumbers.concat(oddNumbers, 7, "Integers", true);
console.log(numbers);
</code>
</Editor>