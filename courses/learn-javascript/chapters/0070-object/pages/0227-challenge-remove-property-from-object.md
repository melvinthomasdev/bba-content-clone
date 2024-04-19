We have a JavaScript object `car`.
Remove the property `colour`
and log the resulting object
to the console.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
let car = {
  brand: "Toyota",
  model: "Camry",
  year: 2020,
  colour: "blue"
};

// Write your code below this line
</code>
<solution>
let car = {
  brand: "Toyota",
  model: "Camry",
  year: 2020,
  colour: "blue"
};

// Write your code below this line
delete car.colour;
console.log(car);
</solution>
</codeblock>
