You are given the following variables,

- `personName`
- `currentTemperature`
- `shiveringTemperature` (the temperature at which the person will start shivering.)
- `hourlyTemperatureDecrease` (the amount by which the temperature drops every hour.)

Your task is to calculate how many hours it will take before the person starts shivering, store the result in a variable called `hoursRemainingForShivering`, and log it to the console in the following format:

`[personName] will start shivering in [hoursRemainingForShivering] hours.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const personName = "Sam";
const shiveringTemperature = 20;
const currentTemperature = 30;
const hourlyTemperatureDecrease = 2;

// Write your code here
</code>
<solution>
const personName = "Sam";
const shiveringTemperature = 20;
const currentTemperature = 30;
const hourlyTemperatureDecrease = 2;

const hoursRemainingForShivering = (currentTemperature - shiveringTemperature) / hourlyTemperatureDecrease;

console.log(`${personName} will start shivering in ${hoursRemainingForShivering} hours.`);
</solution>
</codeblock>
