If the number of array elements
is more than the number of variables
provided in destructuring,
the other elements are omitted.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Mango", "Banana", "Grape"];

const [firstFruit, secondFruit] = fruits;
console.log(firstFruit);
console.log(secondFruit);
</code>
</codeblock>

In the example given above,
the array `fruits` has **five** elements.
We are only copying
and
assigning the first two elements
of the `fruits` array
using destructuring.
The last three elements are omitted
without giving an error.

We can use the rest operator,
i.e., three dots `...`
to store all the omitted elements
as an array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Mango", "Banana", "Grape"];

const [firstFruit, secondFruit, ...otherFruits] = fruits;
console.log(firstFruit);
console.log(secondFruit);
console.log(otherFruits);
</code>
</codeblock>

In the example given above,
the array `fruits` has **five** elements.
The first and second elements of `fruits`
are stored in `firstFruit` and `secondFruit`
respectively.
The last three elements are
stored as an array `otherFruits`.

The rest operator must always come last
in the list of variables.
Otherwise, it will cause an error.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Mango", "Banana", "Grape"];

const [...otherFruits, secondLastFruit, lastFruit] = fruits;
console.log(otherFruits);
console.log(secondLastFruit);
console.log(lastFruit);
</code>
</codeblock>