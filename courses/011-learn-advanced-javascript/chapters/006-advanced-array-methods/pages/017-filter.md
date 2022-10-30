The `filter()` method checks
all elements of an array
on a given condition.
The elements that pass
the condition are returned
in a new array.

<Editor lang="javascript">
<code>
let fruitsArray = ["apple", "banana", "mango", "orange"];
let result = fruitsArray.filter( function(fruit) {
  return fruit.length > 4
});
console.log(result);
</code>
</Editor>