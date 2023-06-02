Create a variable named `firstName` and store the string `Harry` as the value.
Create another variable named `lastName` and store the string `Potter` as the value.
Join both `firstName` and `fullName` and assign it to a new variable named `fullName`.

Print the values of the above three variables to the console.

Finally using the variable `fullName` instead of `[Full Name]`, print the below sentence to the console.

`Good Morning [Full Name]! Have a great year at Hogwarts.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const firstName = "Harry";
const lastName = "Potter";
const fullName = `${firstName} ${lastName}`;
console.log(`Good Morning ${fullName}! Have a great year at Hogwarts.`);
</solution>
</codeblock>
