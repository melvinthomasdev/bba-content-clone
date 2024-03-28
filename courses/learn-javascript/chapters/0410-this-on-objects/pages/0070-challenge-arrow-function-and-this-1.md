In the code given below, we have an object car with a `describeCar` method.

Modify the code below so that we get the output `Brand: Tesla, Model: Model S, Year: 2014`.

**Hint:** Use the `window` object.

<codeblock type="exercise" language="javascript" testMode="fixedInput">
<code>
const car = {
  brand: "Toyota",
  model: "Camry",
  year: 2022,
  describeCar: () => {
    console.log(`Brand: ${this.brand}, Model: ${this.model}, Year: ${this.year}`);
  },
};

car.describeCar();
</code>

<solution>
window.brand = "Tesla";
window.model = "Model S";
window.year = "2014";

const car = {
  brand: "Toyota",
  model: "Camry",
  year: 2022,
  describeCar: () => {
    console.log(`Brand: ${this.brand}, Model: ${this.model}, Year: ${this.year}`);
  },
};

car.describeCar();
</solution>
</codeblock>
