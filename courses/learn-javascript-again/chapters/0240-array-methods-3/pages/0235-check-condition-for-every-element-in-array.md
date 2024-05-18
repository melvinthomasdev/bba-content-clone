`every()` method allows us to
check if all elements in an
array satisfy a given condition.

Syntax:

```js
array.every(callback(currentValue, index, array), thisValue);
```

- array: The array to iterate over.
- callback: A function to test each element of the array.
- currentValue: The current element being processed in the array.
- index (Optional): The index of the current element being processed.
- array (Optional): The array every() was called upon.
- thisValue (Optional): Value to use as this when executing callback.

<codeblock language="javascript" type="lesson">
<code>
// Checking if all elements are even numbers
const numbers = [2, 4, 6, 8, 10];

const allEven = numbers.every(num => num % 2 === 0);
console.log(allEven);

// Checking if all elements are of the same type
const mixedData = [1, "hello", true, { name: "John" }];

const allSameType = mixedData.every((value, index, array) => typeof value === typeof array[0]);
console.log(allSameType);
</code>
</codeblock>
