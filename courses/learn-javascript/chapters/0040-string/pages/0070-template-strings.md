Let's look at an example:

<codeblock language="javascript" type="lesson">
<code>
const firstNum = 2;
const secondNum = 3;
const result = firstNum + secondNum;

console.log("Adding " + firstNum + " and " + secondNum + " gives " + result);
</code>
</codeblock>

Now, let's write the same example using **template strings**:

<codeblock language="javascript" type="lesson">
<code>
const firstNum = 2;
const secondNum = 3;
const result = firstNum + secondNum;

console.log(`Adding ${firstNum} and ${secondNum} gives ${result}`);
</code>
</codeblock>

**Template strings** are enclosed within
backticks `` ` `` instead of single or
double quotes. You don't need to use
**+** operator to concatenate strings.
