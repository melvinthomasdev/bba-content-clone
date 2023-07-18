The `structuredClone()` method is
a new built-in JavaScript function
that facilitates creating a deep clone
of Objects.

Unlike the conventional approach of
using `JSON.stringify()`
and `JSON.parse()`,
`structuredClone()` provides a direct
way to accomplish deep cloning.

To perform a deep clone of an Object,
we need to pass the Object as a parameter
to the `structuredClone()` method.
It will return a new Object that serves
as a deep clone of the original Object.

Let us have a look at an example:
<codeblock language="javascript" type="lesson">
<code>
const car = {
  "type": "sedan",
  "engine": {
    "cylinders": 3,
    "horse-power": "150cc"
  }
};

const newCar = structuredClone(car);
console.log(newCar);

// Output for the following statements will be false
console.log(car === newCar);
console.log(car.engine === newCar.engine);
</code>
</codeblock>

From the code above, we can observe
that even though `car` and `newCar`
have all identical properties,
the equality check still fails.

This is happening because `newCar`
is a deep clone of `car`,
resulting in different Object and
Object property references.

Modifying any property, nested Objects,
or values within the `newCar` Object
will **not** affect the original
Object - car.

However, it is important to note that
`structuredClone()` is unable to perform
a deep clone of functions or methods.

In the provided example below,
we will face an error when attempting
to clone the object `car` that contains
a nested function called `horn()`.
<codeblock language="javascript" type="lesson">
<code>
const car = {
  make: 'BMW',
  horn() {
    console.log('beep');
  },
};

const cloned = structuredClone(car);
</code>
</codeblock>
