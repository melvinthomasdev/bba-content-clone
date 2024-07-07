The `reverse()` method modifies the
original array
and
returns the array with the elements
in reverse order.

Syntax:
```js
array.reverse()
```

<codeblock language="javascript" type="lesson">
<code>
// Original array
const numbers = [1, 2, 3, 4, 5];

// Reversing the array
const reversedNumbers = numbers.reverse();

console.log(reversedNumbers);
console.log(numbers);
</code>
</codeblock>

As we can see from the above code,
not just the `reversedNumbers`
array but also the original
`numbers` array is now reversed
with values:
[5, 4, 3, 2, 1]
