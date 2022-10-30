In the code given below,
the number of elements
in the `birds` array is four.
There are only two variables provided in destructuring.

Add the prefix `...` to a third variable
and store all the remaining elements
in an array.

Use `console.log` to show
all the elements stored in the third variable.

<Editor type="exercise" lang="javascript">
<code>
let birds = ["Sparrow", "Eagle", "Crow", "Bat"];
[firstBird, secondBird] = birds;
console.log();
</code>

<solution>
let birds = ["Sparrow", "Eagle", "Crow", "Bat"];
[firstBird, secondBird, ...rest] = birds;
console.log(rest);
</solution>
</Editor>