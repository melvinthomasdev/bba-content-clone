Consider the following example:

<codeblock language="javascript" type="lesson">
<code>
const numbers = [24];
const [firstNumber, secondNumber] = numbers;
console.log(firstNumber + secondNumber);
</code>
</codeblock>

In the example given above,
we have an array `numbers`
with only one element.
We attempt to destructure the array
and
store the first two elements
in `firstNumber` and `secondNumber`,
respectively.
`firstNumber` assigned the value `24`.
Since there is no second element
in the `numbers` array,
`secondNumber` is assigned `undefined`.
Hence `firstNumber + secondNumber`
produces `NaN`.

We can prevent such undesired outputs
by providing default values for
the variables `firstNumber` and `secondNumber`:

<codeblock language="javascript" type="lesson">
<code>
const numbers = [24];
const [firstNumber = 0, secondNumber = 0] = numbers;
console.log(firstNumber + secondNumber);
</code>
</codeblock>

In the example given above,
`firstNumber` gets the value `24`.
Since there is no second element
in the `numbers` array,
`secondNumber` is assigned
the default value.

<codeblock language="javascript" type="lesson">
<code>
const [firstNumber = 0, secondNumber = 0] = [];
console.log(firstNumber + secondNumber);
</code>
</codeblock>