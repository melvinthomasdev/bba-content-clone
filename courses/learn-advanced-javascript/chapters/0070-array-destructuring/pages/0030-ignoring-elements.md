While destructuring,
we might want to ignore
some elements of the array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Mango"];
const [firstFruit, , thirdFruit] = fruits;
console.log(firstFruit);
console.log(thirdFruit);
</code>
</codeblock>

In the example given above,
we store the **first** element
in the variable `firstFruit`,
skip the **second** element
and
store the **third** element
in the variable `thirdFruit`.
The second element was skipped
by simply putting a comma
after `firstFruit,`,
without specifying a variable
to store the second element in.
