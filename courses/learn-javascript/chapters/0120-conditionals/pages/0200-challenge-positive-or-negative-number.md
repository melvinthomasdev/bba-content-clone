In the code below, we have
a function `positiveOrNegative`.
This function accepts a single
parameter, which is a **number**.

Your task is to update the
`positiveOrNegative` function
to determine whether the provided
number is positive or negative.

If the number is positive,
log to the console,
`The provided number is positive.`
Otherwise, if the number is negative,
log to the console,
`The provided number is negative.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const positiveNumber = 5;
const negativeNumber = -6;
const positiveOrNegative = (number) => {
  // Write your code below
};
positiveOrNegative(positiveNumber);
positiveOrNegative(negativeNumber);
</code>
<solution>
const positiveNumber = 5;
const negativeNumber = -6;
const positiveOrNegative = (number) => {
  // Write your code below
  let numberValue = number > 0 ? "positive" : "negative";
  console.log(`The provided number is ${numberValue}.`)
};
positiveOrNegative(positiveNumber);
positiveOrNegative(negativeNumber);
</solution>
</codeblock>
