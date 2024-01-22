A `for...of` loop is used to
iterate over the values of an iterable,
like an array.

In the example given below,
we print all the values of an array
using a `for...of` loop.

<codeblock language="javascript" type="lesson">
<code>
const names = [
  "Oliver",
  "Eve",
  "Peter"
]

for (const name of names) {
  console.log(name);
}
</code>
</codeblock>

In the example given above,
we are iterating over
the values of the `names` array.
During each iteration,
the value currently being accessed
is stored in the `name` variable.
