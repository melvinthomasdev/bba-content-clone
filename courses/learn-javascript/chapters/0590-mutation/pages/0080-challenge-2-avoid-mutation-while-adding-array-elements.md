Add the numbers **6** and **7** to
the end of the `numberArray` without
mutating it and store it in a variable
named `newArrayAfterAddition`.

Log the value of `newArrayAfterAddition`
to the console.

For example:
```js
Input: numberArray = [5, 10, 15, 20]
Output: [5, 10, 15, 20, 6, 7]
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const numberArray = [1, 2, 3, 4];

// Write code below this line
</code>

<solution>
const numberArray = [1, 2, 3, 4];

// Write code below this line
const newArrayAfterAddition = [...numberArray, 6, 7];

console.log(newArrayAfterAddition);
</solution>
</codeblock>
