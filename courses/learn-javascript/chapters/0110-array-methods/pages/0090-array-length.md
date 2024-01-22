We can use `.length` to get
the number of elements in an array,
also known as the **length** of the array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["Apple", "Banana"];
console.log(fruits.length);

fruits[2] = "Mango";
console.log(fruits.length);
</code>
</codeblock>
In the example given above:

- The `fruits` array
  initially contained `2` elements.

- We then added another element
  to the index `2`
  and
  hence the length of the array
  was increased by one.

<codeblock language="javascript" type="lesson">
<code>
const sports = ["Football", "Cricket", "Basketball", "Tennis", "Hockey"];
console.log(sports.length);

sports[9] = "Volleyball"
console.log(sports.length);

console.log(sports);
</code>
</codeblock>

In the example given above:

- The `sports` array
  initially contained `5` elements.

- Then another element was added
  to the index `9`.
  As we saw in the previous chapter,
  this means that all the indexes
  from `5` to `8` will contain
  the value `undefined`.

- After that, when we checked
  the value of `sports.length`,
  we got the value `10`
  because
  even the `undefined` elements
  were counted.
