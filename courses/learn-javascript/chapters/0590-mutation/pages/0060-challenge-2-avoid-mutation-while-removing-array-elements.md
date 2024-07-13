Remove the element at index **2**
from the `numbers` array without mutating it
and
store the resultant array in a variable named
`updatedNumberArray`.

Log the value of `updatedNumberArray`
to the console.

For example:
```js
Input: numbers = [8, 12, 16, 24, 32]
Output: [8, 12, 24, 32]
```

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const numbers = [5, 10, 15, 20, 25];

// Write code below this line
</code>

<solution>
const numbers = [5, 10, 15, 20, 25];

// Write code below this line
updatedNumberArray = [...numbers.slice(0, 2), ...numbers.slice(3)];

console.log(updatedNumberArray);
</solution>
</codeblock>
