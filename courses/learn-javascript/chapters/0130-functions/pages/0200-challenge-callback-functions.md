Create a function `sumOrProduct` that accepts **4** arguments:

- **2** numbers.
- A string, value of which will
  either be "sum" or "product".
- A callback function `printResult`
  Based on the string value, `sumOrProduct` function will either **add** the numbers received as arguments, or **multiply** them and store
  their result.
- If the string is neither "sum" or "product",
  log to the console "Invalid parameter"

Create a second function `printResult` that accepts **2** arguments.

- string, this will be the same
  string passed to `sumOrProduct`.
- result
  `printResult` logs the result to the console.

For example:

```js
Input: 3, 4, "division";

Output: `Invalid parameter`;
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
sumOrProduct(3, 4, "sum", printResult);
sumOrProduct(6, 8, "product", printResult);
</code>
<solution>
const sumOrProduct = (
  firstNumber,
  secondNumber,
  string,
  callback
) => {
  let result = 0;
  if (string === "sum") {
    result = firstNumber + secondNumber;
  } else {
    result = firstNumber * secondNumber;
  };

callback(string, result);
};

const printResult = (string, result) => console.log(`The solution to the ${string} is ${result}.`);

sumOrProduct(3, 4, "sum", printResult);
sumOrProduct(6, 8, "product", printResult);

</solution>
</codeblock>
