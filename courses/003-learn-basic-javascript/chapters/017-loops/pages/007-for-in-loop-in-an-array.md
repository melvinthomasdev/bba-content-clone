We can use a `for...in` loop
to iterate over the elements
of an array.

In the example given below,
we are using
the `for...in` loop
to show the index of
all the elements
in the array.

<Editor lang="javascript">
<code>
let fruits = ["Mango", "Apple", "Banana"];
for (let index in fruits) {
  console.log(index);
}
</code>
</Editor>

We can also use the
`for...in` loop to
show all the elements
of the array.

<Editor lang="javascript">
<code>
let fruits = ["Mango", "Apple", "Banana"];
for (let index in fruits) {
  console.log(fruits[index]);
}
</code>
</Editor>

In the example given above,
we are showing each element
of the array
using its index.
