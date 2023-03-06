Sam cannot resist intense cold, he starts shivering at 15°c. The current temperature is 25°c. Every half an hour temperature drops by 1°c. Update the function to find out how long before Sam starts shivering?
Expected Output: `Sam will start shivering in x hours.`

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const timeTillShivering = () => {
  //Write your code here
}
</code>
<solution>
let shiveringTemperatureSam = 15;
let initialTemperatureSam = 25;
let hourlyTemperatureDecreaseSam = 2;
const timeTillShivering = (
  shiveringTemperature, 
  initialTemperature,
  hourlyTemperatureDecrease
  ) => {
  return `Sam will start shivering in ${(initialTemperature-shiveringTemperature)/hourlyTemperatureDecrease} hours.`;
};
timeTillShivering(shiveringTemperatureSam, initialTemperatureSam, hourlyTemperatureDecreaseSam)
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
