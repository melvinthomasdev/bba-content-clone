We can use a `for...in` loop
to iterate over the elements
of an array.

In the example given below,
we are using
the `for...in` loop
to show the index of
all the elements
in an array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Mango", "Apple", "Banana"];
for (const index in fruits) {
  console.log(index);
}
</code>
</codeblock>

Note that the value of `index`
is always a string
containing the index number.

We can also use the
`for...in` loop to
show all the elements
of the array
as shown in the
following example.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Mango", "Apple", "Banana"];
for (const index in fruits) {
  console.log(fruits[index]);
}
</code>
</codeblock>