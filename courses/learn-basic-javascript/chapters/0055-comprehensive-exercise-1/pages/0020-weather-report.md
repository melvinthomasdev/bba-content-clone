You need to find out how long does it take before the person starts shivering.

* You are given variables, `personName`, `currentTemperature` and the `shiveringTemperature` (temperature at which the person will start shivering)

* And every hour temperature drops by certain degree provided by `hourlyTemperatureDecrease` variable.

* Find out how many hours will it take before the person starts shivering, store it to a variable called `hoursRemainingForShivering` and then log it to the console in the format:

`[name] will start shivering in [hoursRemainingForShivering] hours.`


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
