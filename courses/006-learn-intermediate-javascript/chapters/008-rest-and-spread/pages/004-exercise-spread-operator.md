The `multiply` function
returns the product of
two numbers. We have an
array `input`, which stores
the two numbers.

Using the spread operator,
pass the items of `input`
as parameters to the
`multiply` function.

<Editor type="exercise" lang="javascript">
<code>
function multiply(a, b) {
  return a * b;
}
let input = [13, 17];

console.log(multiply()); // Change only this line
</code>

<solution>
function multiply(a, b) {
  return a * b;
}
let input = [13, 17];

console.log(multiply(...input));
</solution>
</Editor>