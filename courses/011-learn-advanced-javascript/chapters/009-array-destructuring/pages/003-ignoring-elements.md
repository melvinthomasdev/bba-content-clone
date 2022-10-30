While destructuring, we might
want to ignore some elements of the
array. We can do this with the help of an
extra comma:

<Editor lang="javascript">
<code>
let fruits = ["Apple", "Orange", "Mango"];
let [firstFruit, ,thirdFruit] = fruits;
console.log(firstFruit);
console.log(thirdFruit);
</code>
</Editor>

In the example given above,
we store the **first** element
in the variable `firstFruit`,
skip the **second** element
and
store the **third** element
in the variable `thirdFruit`.

