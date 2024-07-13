Define a function named `checkArrayType`
that accepts one parameter.
If the input is an array,
return the string `Input is an array`.
If the input is not an array,
return the string `Input is not an array`.

For example:
```js
Input:
["Owl", "Eagle", "Sparrow"]

Output:
Input is an array
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below this line

console.log(checkArrayType([1, 2, 3, 4, 5]));
console.log(checkArrayType("abc"));
console.log(checkArrayType({name: "sam"}));
</code>
<solution>
// Write code below this line
const checkArrayType = (input) => {
  if (Array.isArray(input)) {
    return "Input is an array";
  } else {
    return "Input is not an array";
  }
};

console.log(checkArrayType([1, 2, 3, 4, 5]));
console.log(checkArrayType("abc"));
console.log(checkArrayType({name: "sam"}));
</solution>
</codeblock>
