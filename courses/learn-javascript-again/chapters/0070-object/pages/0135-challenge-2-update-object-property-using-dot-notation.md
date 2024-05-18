Create an object `vehicle`
with the following properties:

| Key            | Value   |
| -------------- | ------- |
| type           | Car     |
| numberOfWheels | 4       |
| fuel           | Petrol  |

Then, update the value for the
key `fuel` with `Diesel` using dot
notation.

Log the value of the object
`vehicle` to the console.

```js
Output:
{
  type: "Car",
  numberOfWheels: 4,
  fuel: "Diesel"
}
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write code below
</code>

<solution>
// Write code below
const vehicle = {
  type: "Car",
  numberOfWheels: 4,
  fuel: "Petrol"
};

vehicle.fuel = "Diesel";
console.log(vehicle);
</solution>
</codeblock>
