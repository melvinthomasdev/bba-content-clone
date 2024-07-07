In the code given below,
set the default value
of the variable `secondElement`
as `"No fruit provided!"`

```js
Output:
"Apple"
"No fruit provided!"
```
<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const fruits = ["Apple"];
const [firstElement, secondElement] = fruits;

console.log(firstElement);
console.log(secondElement);
</code>

<solution>
const fruits = ["Apple"];
const [firstElement, secondElement = "No fruit provided!"] = fruits;

console.log(firstElement);
console.log(secondElement);
</solution>
</codeblock>
