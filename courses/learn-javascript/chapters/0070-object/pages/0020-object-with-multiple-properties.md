An object can have multiple properties,
separated by commas:

In the example given below,
we have an object **car**,
with two properties.
The first property has the key **model**
and the value **2011**,
while the second property has the key
**fuelType** and
the value **diesel**.

<codeblock language="javascript" type="lesson">
<code>
const car = {
  model: 2011,
  fuelType: "diesel"
};
console.log(car);
</code>
</codeblock>

Let's create another object `person`.
It stores the properties given in the table below:

| Key      | Value        |
| -------- | ------------ |
| fullName | "Adam Smith" |
| age      | 37           |
| isAdmin  | true         |

<codeblock language="javascript" type="lesson">
<code>
const person = {
  fullName: "Adam Smith",
  age: 37,
  isAdmin: true
};

console.log(person);

</code>
</codeblock>

In the code below, the information
about a car is stored in two
separate variables.

<codeblock language="javascript" type="lesson">
<code>
  const carModel = 2011;
  const carFuelType = "diesel";
  console.log(`It is a ${carModel} car that runs on ${carFuelType}`);
</code>
</codeblock>

Moving forward, in the BigBinary Academy,
we would prefer to use
objects to store values of
data that are related
rather than
storing them in separate variables.
For example:

<codeblock language="javascript" type="lesson">
<code>
const car = {
  model: 2011,
  fuelType: "diesel"
};

console.log(`It is a ${car.model} car that runs on ${car.fuelType}`);

</code>
</codeblock>

We can also assign the value of variables
to the property of an object.

<codeblock language="javascript" type="lesson">
<code>
const noOfSeats = 5;

const car = {
  model: 2011,
  seatingCapacity: noOfSeats,
  fuelType: "petrol"
};

console.log(`It is a ${car.model} model car that runs on ${car.fuelType} and has ${car.seatingCapacity} seats.`);
</code>
</codeblock>

In the example given above, the property `car.seatingCapacity` is assigned the value of `noOfSeats`, which is `5`.
