A `for...of` loop is used to iterate over the values of an iterable, like an array.

Let's see the example given below,
where we print all the values of an array using a `for...of` loop.

<Editor lang="javascript">
<code>
let people = [
  "Oliver",
  "Eve",
  "Peter"
]

for (let person of people) {
  console.log(person);
}
</code>
</Editor>

In the example given above,
we are iterating over the values of the `people` array. During each iteration, the value currently being accessed is stored in the `person` variable.
