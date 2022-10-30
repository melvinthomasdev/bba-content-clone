If we want to use specific array elements,
the simplest way known to us right now
is to access their values using their
index values:

<Editor lang="javascript">
<code>
let fruits = ["Apple", "Orange", "Banana"];

let firstFruit = fruits[0];
let secondFruit = fruits[1];
let thirdFruit = fruits[2];

console.log(firstFruit);
console.log(secondFruit);
console.log(thirdFruit);
</code>
</Editor>

You can see that we're writing
the same code again and again.
This isn't ideal! A better
way to do this is through
**destructuring**.

Destructuring allows us to
copy array elements into variables
without modifying the array:

<Editor lang="javascript">
<code>
let fruits = ["Apple", "Orange", "Banana"];
let [firstFruit, secondFruit, thirdFruit] = fruits;
console.log(firstFruit);
console.log(secondFruit);
console.log(thirdFruit);
</code>
</Editor>