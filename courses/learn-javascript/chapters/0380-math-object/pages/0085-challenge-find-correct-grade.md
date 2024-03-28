We have test scores of `Sam`, `Eve`,
`Linh`
and
`Carlos`.

Your task is to calculate the average
of their scores and log it to the console.
Also, find the highest score
and
log it to the console.

Additionally, round the average to the nearest
whole number and log it to the console.

Expected output:
`The average test score is: [Average]`

`The highest test score is: [highestScore]`

`Rounded average score to the nearest whole number: [roundedAverage]`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const samScore = 82.21;
const eveScore = 84.33;
const linhScore = 68.34;
const carlosScore = 70.21;
// Write your code below this line
</code>

<solution>
const samScore = 82.21;
const eveScore = 84.33;
const linhScore = 68.34;
const carlosScore = 70.21;
// Write your code below this line

// Calculate the average score
const averageScore = (samScore + eveScore + linhScore + carlosScore) / 4;

// Find the highest score
const highestScore = Math.max(samScore, eveScore, linhScore, carlosScore);

// Round the average to the nearest whole number using Math.round
let roundedAverage = Math.round(averageScore);

console.log(`The average test score is: ${averageScore}`);
console.log(`The highest test score is: ${highestScore}`);
console.log(`Rounded average score to the nearest whole number: ${roundedAverage}`);
</solution>
</codeblock>
