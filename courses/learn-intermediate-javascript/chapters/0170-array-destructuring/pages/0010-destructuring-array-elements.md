If we want to assign specific array elements
to other variables,
the simplest way known to us right now
is to access their values using their
index values:

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana"];

const firstFruit = fruits[0];
const secondFruit = fruits[1];
const thirdFruit = fruits[2];

console.log(firstFruit);
console.log(secondFruit);
console.log(thirdFruit);
</code>
</codeblock>

We can achieve the same result
as the example given above
with a shorter and more cleaner code
using **destructuring**.
Destructuring allows us to
copy array elements into variables
without modifying the array.

By destructuring an array,
we can assign the value of
each element of an array
to different variables.
To do that,
we use the following syntax -
`[...] = array`

- The list of variables to which
  the value of the elements should
  be assigned goes inside the `[]` brackets
  on the left side of `=`.

- The name of the array being destructured
  should be on the right side of `=`.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana"];
const [firstFruit, secondFruit, thirdFruit] = fruits;
console.log(firstFruit);
console.log(secondFruit);
console.log(thirdFruit);
</code>
</codeblock>

In the example given above:

- The `fruits` array is being destructured.

- Value of the first element `"Apple"`
  is assigned to `firstFruit`.

- Value of the second element `"Orange"`
  is assigned to `secondFruit`.

- Value of the third element `"Banana"`
  is assigned to `thirdFruit`.
