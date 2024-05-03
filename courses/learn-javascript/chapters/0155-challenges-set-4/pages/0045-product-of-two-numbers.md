The function `product` should return
a string representing the product of `firstNumber` and `secondNumber`.

For example:
```js
Input: firstNumber = 7, secondNumber = 3

Output: 21
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const product = (firstNumber, secondNumber) => {
  // your code here
}
</code>

<solution>
const product = (firstNumber, secondNumber) => {
  return `The product is ${firstNumber * secondNumber}`;
}
</solution>

<testcases>
<caller>
console.log(product(firstNumber, secondNumber));
</caller>
<testcase>
<i>
const firstNumber = 10;
const secondNumber = 20;
</i>
</testcase>
<testcase>
<i>
const firstNumber = 50;
const secondNumber = 50;
</i>
</testcase>
<testcase>
<i>
const firstNumber = 8;
const secondNumber = 8;
</i>
</testcase>
<testcase>
<i>
const firstNumber = 30;
const secondNumber = 20;
</i>
</testcase>
</testcases>
</codeblock>
