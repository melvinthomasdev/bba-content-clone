Sam cannot resist intense cold,
he starts shivering at `shiveringTemperature`.
The current temperature provided
will be `initialTemperature`.

Every half an hour temperature
drops by certain degree provided
by hourlyTemperatureDecrease.

Update the function to find
out how long before Sam starts
shivering and log it to the console.

Expected Output: 
`Sam will start shivering in x hours.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const timeTillShivering = (
  shiveringTemperature,
  initialTemperature,
  hourlyTemperatureDecrease
  ) => {
  //Write your code here
};
</code>
<solution>
const timeTillShivering = (
  shiveringTemperature,
  initialTemperature,
  hourlyTemperatureDecrease
) => {
  return `Sam will start shivering in ${(initialTemperature-shiveringTemperature)/hourlyTemperatureDecrease} hours.`;
};
</solution>
<testcases>
<caller>
console.log(timeTillShivering(shiveringTemperature, initialTemperature, hourlyTemperatureDecrease));
</caller>
<testcase>
<i>
let shiveringTemperature = 20;
let initialTemperature = 30;
let hourlyTemperatureDecrease = 2;
</i>
</testcase>
<testcase>
<i>
let shiveringTemperature = 5;
let initialTemperature = 45;
let hourlyTemperatureDecrease = 2;
</i>
</testcase>
<testcase>
<i>
let shiveringTemperature = 7;
let initialTemperature = 32;
let hourlyTemperatureDecrease = 2;
</i>
</testcase>
</testcases>
</codeblock>
