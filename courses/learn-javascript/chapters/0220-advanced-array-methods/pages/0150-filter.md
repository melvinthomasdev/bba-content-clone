The `filter()` method creates a new array
containing only certain elements from
the array it is invoked on.

`filter()` accepts a function as an argument.
It invokes that function on each
element of an array.

<codeblock language="javascript" type="lesson">
<code>
const numbers = [1, 2, 3, 4, 5, 6];
const evenNumbers = numbers.filter(number => number % 2 === 0);
console.log(evenNumbers);
</code>
</codeblock>

In the example given above,
`numbers.filter(number => number % 2 === 0)`
returns an array that contains
only those elements of `numbers`
that returns `true` when
passed as the argument to
`number => number % 2 === 0`.
