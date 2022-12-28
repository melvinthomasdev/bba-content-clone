The `forEach()` method invokes
a function on each
element of an array.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
fruits.forEach(fruit => console.log(`${fruit} is a fruit.`));
</code>
</codeblock>

The function passed as argument to
the `forEach()` method
has three parameters.

<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
fruits.forEach((fruit, index, array) => {
  console.log(`${fruit} is a fruit. It is at index ${index} in the array: ${array}.`);
});
</code>
</codeblock>

In the example given above,
the parameters of the function
passed as argument to `fruits.forEach` are:

- `fruit` - an element of `fruits`

- `index` - the index of the element in the `fruits` array

- `array` - a copy of the `fruits` array
