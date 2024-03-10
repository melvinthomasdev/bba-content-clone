In JavaScript, the elements
do not have to be stored in
consecutive indexes.
We can also have, for example,
an array with elements
in non-consecutive indexes
`0`, `1`, `2` and then `7`,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const names = ["Oliver", "Adam", "Eve"];

console.log(names[0]);
console.log(names[1]);
console.log(names[2]);

names[7] = "Sam";
console.log(names[7]);

console.log(names);
</code>
</codeblock>

In the example given above,
the array `names` initially had elements
in the indexes `0`, `1`, and `2`.
Then we add another element
to index `7`,
although ideally,
we should only be storing
the next element in the index `3`.
When we use `console.log`
to display the array,
we can see that the elements are indeed
stored in the indexes `0`, `1`, `2` and `7`.
The indexes from `3` to `6`,
are all `undefined`
