Use the `Object.fromEntries()` method to convert `fruits` to an object.

<Editor type="exercise" lang="javascript">
<code>
let fruits = [
  ["apple", 25],
  ["orange", 15],
  ["mango", 20]
];
let result = ;
console.log(result);
</code>

<solution>
let fruits = [
  ["apple", 25],
  ["orange", 15],
  ["mango", 20]
];
let result = Object.fromEntries(fruits);
console.log(result);
</solution>
</Editor>