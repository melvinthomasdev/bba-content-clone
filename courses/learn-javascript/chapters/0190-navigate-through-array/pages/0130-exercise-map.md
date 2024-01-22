Create a function `doubledNumbers`
which accepts the array `numbers`
as a parameter and returns a new
array which has all the numbers
multiplied by **2**.

Log the resulting array to the
console.
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const numbers = [1, 2, 3, 4, 5];
// Write code below
</code>

<solution>
const numbers = [1, 2, 3, 4, 5];
// Write code below

const doubledNumbers = numbers.map((number) =>  number * 2);

console.log(doubledNumbers);
</solution>
</codeblock>
