In the following code example,
log to the console if the variables
have a value of the type `NaN` or not.

The output should be either `true`
or `false`.

For example:
```js
Input: user = "a123"

Output: true
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const userInput = "007";
const securityCode = "0103";
const password = "happy@001";
// Write your code below this line
</code>
<solution>
const userInput = "007";
const securityCode = "0103";
const password = "happy@001";
// Write your code below this line

console.log(isNaN(userInput));
console.log(isNaN(securityCode));
console.log(isNaN(password));
</solution>
</codeblock>
