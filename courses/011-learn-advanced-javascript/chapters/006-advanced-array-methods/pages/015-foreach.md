The `forEach()` method executes
a function for each
element of an array.

<Editor lang="javascript">
<code>
let fruitsArray = ["apple", "banana", "mango", "orange"];
fruitsArray.forEach(function(element) {
  console.log(`${element} is a fruit.`);
});
</code>
</Editor>

The function inside
the `forEach()` method
accepts three arguments.

<Editor lang="javascript">
<code>
let fruitsArray = ["apple", "banana", "mango", "orange"];
fruitsArray.forEach(function(element, index, array) {
  console.log(`${element} is a fruit. It is at index ${index} in the array: ${array}.`);
});
</code>
</Editor>

As can be seen
in the example given above,
the arguments are `element`,
which is the value of the element,
`index`,
which is the index of the element
and
`array`,
which is the array
on which the method operates.
