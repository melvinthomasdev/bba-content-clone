We can also use the `for...in` loop to iterate
over the properties of an object.

In the example given below,
we are using the `for...in` loop
to show the **keys** of all the properties
of the `car` object as strings.

<codeblock language="javascript" type="lesson">
<code>
const car = {
  manufacturer: "Porsche",
  model: "911",
  fuelType: "Diesel"
};

for (const key in car) {
  console.log(key);
}
</code>
</codeblock>

In the example given below,
we are using the
`for...in` loop
to show the values stored
in each property of the object.

<codeblock language="javascript" type="lesson">
<code>
const car = {
  manufacturer: "Porsche",
  model: "911",
  fuelType: "Diesel"
};

for (const key in car) {
  console.log(car[key]);
}
</code>
</codeblock>