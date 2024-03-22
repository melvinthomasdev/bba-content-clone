`Array.from()` method is used
to create a new array instance
from any iterable value.

Syntax:
`Array.from(value, mapFunction, thisValue)`

- object: The value to be converted into an array.
- mapFunction (optional): A mapping function that allows you to modify each element in the array during the creation process.
- thisValue (optional): A value to use as this when executing the mapping function.

<codeblock language="javascript" type="lesson">
<code>
// Converting String to Array
const string = 'hello';
const newArray = Array.from(string);
console.log(newArray); // Output: ['h', 'e', 'l', 'l', 'o']

// Using mapping function
const numberArray = [1, 2, 3, 4];
const doubled = Array.from(numberArray, num => num * 2);
console.log(doubled); // Output: [2, 4, 6, 8]
</code>
</codeblock>
