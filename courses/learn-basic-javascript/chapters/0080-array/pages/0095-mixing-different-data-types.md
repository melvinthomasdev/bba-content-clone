In the first lesson on Creating Arrays,
we learnt that arrays can hold different
kinds of data types,
which makes them  very flexible.

Let us explore a few additional
examples of arrays containing various
data types:

<codeblock language="javascript" type="lesson">
<code>
const name = "Parker";
const mixedArray = [1, "hello", name, true, null, undefined];

const arrayOfArrays =[
  [1, 2, 3, 4, 5],
  ["Peter", "Mary", "May", "Ben"],
  [true, false, true, false]
];

const arrayOfObjects = [
  {one: 1, two: 2},
  {fruit: "apple", vegetable: "onion"}
];

console.log(mixedArray);
console.log(arrayOfArrays);
console.log(arrayOfObjects);
</code>
</codeblock>

Thanks to this special behavior,
arrays have become incredibly useful in
various scenarios.

We can easily utilize arrays to store,
organize,
and
manipulate all kinds of data, making them
an essential tool in programming.
