Let's say we have two variables
`model` and `fuelType`.
We also have to define an object `car`
with two properties `model` and `fuelType`.
The property `car.model` should be assigned
the value of the variable `model`.
The property `car.fuelType` should be assigned
the value of the variable `fuelType`.
We can do that as shown
in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const model = 2011;
const fuelType = "diesel";

const car = {
  model: model,
  fuelType: fuelType,
};

console.log(car);
</code>
</codeblock>

In the example given above,
note that the property names of the object `car`
are the same as the variable names whose values
are assigned to the corresponding property.
In such cases, we can use a shorthand
for defining object properties,
as shown in the example given below:

<codeblock language="javascript" type="lesson">
<code>
const model = 2011;
const fuelType = "diesel";

const car = {
  model,
  fuelType,
};

console.log(car);
</code>
</codeblock>