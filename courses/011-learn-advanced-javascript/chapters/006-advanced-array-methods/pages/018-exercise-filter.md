Use the `filter()` method
to get all the elements
in the **names** array whose length
is less than 5.
Store them in the **result** array.

<Editor lang="javascript" type="exercise">
<code>
let names = ["Adam", "Eve", "Oliver", "Sam"];
let result = ;
console.log(result);
</code>

<solution>
let names = ["Adam", "Eve", "Oliver", "Sam"];
let result = names.filter( function(name) {
  return name.length < 5;
});
console.log(result);
</solution>
</Editor>