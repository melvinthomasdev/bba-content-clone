The `reduce()` method executes
a function on each element
of the array.
It returns a single value.

The `reduce()` method
can accept four arguments -

- The `accumulator` stores the value
returned from the previous function call.

- The `currentValue` is the value
of the current element in the array.

- The `currentIndex` is the index of
the current element in the array.

- The `sourceArray` is the array.

<br>

We can provide an optional
initial value.
The `accumulator` takes this value.

<Editor lang="javascript">
<code>
const numbers = [1, 2, 3, 4, 5];
let result = numbers.reduce( function(accumulator, currentValue) {
  return (accumulator + currentValue);
}, 0);
console.log(result);
</code>
</Editor>

If we do not provide it,
the function takes the first element
of the array as the initial value.

<Editor lang="javascript">
<code>
const numbers = [1, 2, 3, 4, 5];
let result = numbers.reduce( function(accumulator, currentValue) {
  return (accumulator + currentValue);
} );
console.log(result);
</code>
</Editor>