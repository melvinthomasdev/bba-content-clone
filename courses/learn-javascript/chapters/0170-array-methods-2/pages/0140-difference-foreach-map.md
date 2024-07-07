The `forEach()` method is used to loop through array elements.
It runs the same function on each element.
It doesn't change the given array and returns `undefined`.

The `map()` method also iterates through array elements.
It applies a function to each element.
It creates a new array with the modified elements,
and returns the **new array**.

Let's look at some examples:

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4];

const doubledNumbers = numbers.forEach(number => number * 2);

console.log(doubledNumbers);
</code>
</codeblock>

In the above code, the output is `undefined` because `forEach()` returns `undefined`.

Now, let's observe the outcome when using the `map()` method:

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4];

const doubledNumbers = numbers.map(number => number * 2);

console.log(doubledNumbers);
</code>
</codeblock>

Here, we obtain an array containing the doubled
values of the original **numbers** array.

To further solidify your understanding of the
`forEach()` method, consider this example:

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3];

numbers.forEach(number => {
  console.log(number * 2);
});
</code>
</codeblock>

In this case, the `forEach()` method is utilized
to iterate through each element in the **numbers** array,
subsequently logging the result of doubling
each number to the console.
