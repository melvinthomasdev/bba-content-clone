We have a side length of the cube.

Your task is to calculate the
volume and log it to the console.

Formula for volume:
<image>volume.png</image>

Additionally, calculate the
surface area
and log it to the console.

Formula for surface area:
<image>surface-area.png</image>

Expected output:
`The volume of the cube is [volume]`

`The surface area of the cube is [surface area]`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const sideLength = 12;

// Write code below this line

</code>

<solution>
const sideLength = 12;

// Write code below this line

// Calculate volume using Math.pow
const volume = Math.pow(sideLength, 3);

// Calculate surface area
const surfaceArea = 6 * Math.pow(sideLength, 2);

// Display the results
console.log("The volume of the cube is: " + volume);
console.log("The surface area of the cube is: " + surfaceArea);
</solution>
</codeblock>
