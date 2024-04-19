We are constructing a tower,
and there's a specific target
height we aim to reach.

Each floor of the tower has a
known height.
While the tower can surpass the
target height,
it must not fall short.

You have the following tasks:
- Determine the total number of floors in the tower and log it to the console.
- Round up the calculated number to the nearest whole floor and log it to the console.
- Round down to the nearest whole floor and log it to the console.

```js
Output:
`Total floors: 53.333333333333336`
`Rounded floors: 54`
`Floored floors: 53`
```
<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const requiredHeight = 800;
const floorHeight = 15;

// Write code below this line

</code>

<solution>
const requiredHeight = 800;
const floorHeight = 15;

// Write code below this line
// Calculate the total number of floors
const totalFloors = requiredHeight / floorHeight;

// Round up to the nearest whole floor using Math.ceil
const ceiledHeight = Math.ceil(totalFloors);

// Round down to the nearest whole floor using Math.floor
const flooredHeight = Math.floor(totalFloors);

// Display the results
console.log(`Total floors: ${totalFloors}`);
console.log(`Ceiled floors: ${ceiledHeight}`);
console.log(`Floored floors: ${flooredHeight}`);
</solution>
</codeblock>
