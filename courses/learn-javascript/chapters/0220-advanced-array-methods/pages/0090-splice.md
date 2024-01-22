The `splice()` method can
modify an array by removing,
replacing or inserting elements.
It returns an array
of the removed its elements.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
const removedNumbers = numbers.splice(1, 3);

console.log(removedNumbers);
console.log(numbers);
</code>
</codeblock>

In the example given above,
starting from index `1`,
`splice` removes **3** elements
from the `numbers` array.
The variable `removedNumbers`
stores the removed elements.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
fruits.splice(2, 1, "kiwi");

console.log(fruits);
</code>
</codeblock>

In the example given above,
it removes the element `"mango"`
at index `2`
and
inserts the element
`"kiwi"` in its place.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
fruits.splice(2, 0, "kiwi");

console.log(fruits);
</code>
</codeblock>

In the example given above,
it adds the element `"kiwi"`
at index `2` without
removing any element.
