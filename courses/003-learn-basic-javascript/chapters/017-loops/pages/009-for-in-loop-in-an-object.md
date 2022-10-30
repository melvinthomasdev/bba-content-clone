We can also use the `for...in` loop to iterate
over the properties of an object.

In the example given below,
we are using the `for...in` loop
to show the names of all the properties
of the `car` object.

<Editor lang="javascript">
<code>
let car = {
  manufacturer: "Porsche",
  model: "911",
  fuelType: "Diesel"
};

for (let property in car) {
  console.log(property);
}
</code>
</Editor>

In the example given below,
we are using the 
`for...in` loop
to show the values stored
in each property of the object.

<Editor lang="javascript">
<code>
let car = {
  manufacturer: "Porsche",
  model: "911",
  fuelType: "Diesel"
};

for (let prop in car) {
  console.log(car[prop]);
}
</code>
</Editor>