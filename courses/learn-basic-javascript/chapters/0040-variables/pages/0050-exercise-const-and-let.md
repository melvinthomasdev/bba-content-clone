In the code given below,
use a variable named `count`
to store the number of burgers.
Its initial value should be `1`.

The value of the `count` variable should be
changed according to the required output.
For example,
before `console.log(price * 5)`,
change the value of `count` to `5`
then rewrite that statement to
`console.log(price * count)`.

Make similar changes to
all other statements that display
the price of burgers.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const price = 83;

console.log("Price of 1 burger:");
console.log(price * 1);

console.log("Price of 5 burgers:");
console.log(price * 5);

console.log("Price of 120 burgers:");
console.log(price * 120);

console.log("Price of 42 burgers:");
console.log(price * 42);
</code>

<solution>
const price = 83;
let count = 1;

console.log("Price of 1 burger:");
console.log(price * count);

console.log("Price of 5 burgers:");
count = 5;
console.log(price * count);

console.log("Price of 120 burgers:");
count = 120;
console.log(price * count);

console.log("Price of 42 burgers:");
count = 42;
console.log(price * count);
</solution>
</codeblock>