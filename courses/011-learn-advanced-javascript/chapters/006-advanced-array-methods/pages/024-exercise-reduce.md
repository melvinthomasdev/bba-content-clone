Use the `reduce()` method to get
the sum of all the elements
in the `primeNumbers` array.
It accepts the arguments
`accumulator`
and
`currentValue`.
The `result` variable
stores the result.

<Editor lang="javascript" type="exercise">
<code>
const primeNumbers = [2, 3, 5, 7, 11, 13];
let result = 
console.log(result);
</code>

<solution>
const primeNumbers = [2, 3, 5, 7, 11, 13];
let result = primeNumbers.reduce( function(accumulator, currentValue) {
  return (accumulator + currentValue);
}, 0);
console.log(result);
</solution>
</Editor>