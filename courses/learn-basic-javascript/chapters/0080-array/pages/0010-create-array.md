An array is used to
store multiple values together.

Let us take an example
of a list of fruits:

| Fruit    |
| -------- |
| "Apple"  |
| "Orange" |
| "Banana" |

An array is built
by a pair of **square brackets**,
with values placed inside
it separated by commas.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Orange", "Banana"];

console.log(fruits);
</code>
</codeblock>

In the example given above,
the variable `fruits`
is assigned an array of three values -
`"Apple"`, `"Orange"`, and `"Banana"`.
These values are called
the **elements** of the `fruits` array.

In the example given above,
since all elements of the `fruits` array
are of the same data type,
i.e., string,
the array is known as
a **homogeneous array**.

Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const measurements = [12, "34cm", 567.89];

console.log(measurements);
</code>
</codeblock>

In the example given above,
the elements of the array `measurements`
are of different data types.
Such an array is known as
a **heterogeneous array**.

We can also have arrays
of composite data type
such as array of arrays
or objects.

Let us have a look
at few examples below:

<codeblock language="javascript" type="lesson">
<code>
const arrayOfArrays =[
  [1, 2, 3, 4, 5],
  ["Peter", "Mary", "May", "Ben"],
  [true, false, true, false]
];

const arrayOfObjects = [
  {one: 1, two: 2},
  {fruit: "apple", vegetable: "onion"}
];

console.log(arrayOfArrays);
console.log(arrayOfObjects);
</code>
</codeblock>
