Sam cannot resist intense cold, he starts shivering at 15°c. The current temperature is 25°c. Every half an hour temperature drops by 1°c. How long before Sam starts shivering?
Expected Output: `Sam will start shivering in x hours.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
  <code>
  </code>
  <solution>
  const shiveringTemperature = 15;
  const initialTemperature = 25;
  const hourlyTemperatureDecrease = 2;

console.log(`Sam will start shivering in ${(initialTemperature-shiveringTemperature)/hourlyTemperatureDecrease} hours.`);
</solution>
</codeblock>
