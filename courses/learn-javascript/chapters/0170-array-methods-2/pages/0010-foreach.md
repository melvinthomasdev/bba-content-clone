The `forEach()` method is like
a friendly guide that helps us
visit each element in an array
one by one.

It allows us to perform a specific
action on every element without
changing the original array.

Let us look at an example:
<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];

const displayFruit = fruit => {
  console.log(`${fruit} is a fruit.`);
};

fruits.forEach(fruit => displayFruit(fruit));
</code>
</codeblock>

In the code above, we define
a function `displayFruit`,
which accepts a fruit's name
as a parameter and shows a
message with the fruit's name.

Then, we use the `forEach()` method
to call this function on each fruit
in the `fruits` array.
This way, we display each fruit with
the same message.

Let's make our code cleaner:
<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
fruits.forEach(fruit => console.log(`${fruit} is a fruit.`));
</code>
</codeblock>

We moved the function definition
within the `forEach()` by passing an
anonymous function as the callback
to the `forEach()` method.

In the above code, the function we pass
as an argument to `forEach()` can receive
three helpful parameters:
- `element`: This is the current element
  of the array that we're visiting.
- `index`: This is the index position of
  the current element in the array.
- `array`: This is the entire array itself.

Let's use them to get more details about
each fruit in the array:
<codeblock language="javascript" type="lesson">
<code>
const fruits = ["apple", "banana", "mango", "orange"];
// In this case, the element is a single fruit
fruits.forEach((fruit, index, array) =>
  const result = `${fruit} is a fruit. It is at index ${index} in the array: ${array}.`;
  console.log(result)
);
</code>
</codeblock>
