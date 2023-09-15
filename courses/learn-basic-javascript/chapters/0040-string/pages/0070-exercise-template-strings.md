Create a variable named `firstName` and store the string `Sam` as the value.
Create another variable named `lastName` and store the string `Smith` as the value.
Join both `firstName` and `lastName` and assign it to a new variable named `fullName`.

Finally using the variables `firstName`, `lastName` and `fullName`, print the below two sentences to the console.

`Your first name is [First Name] and last name is [Last Name].`

`Good Morning [Full Name]! Have a great day.`

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
// Write your code here
</code>
<solution>
const firstName = "Sam";
const lastName = "Smith";
const fullName = `${firstName} ${lastName}`;

console.log(`Your first name is ${firstName} and last name is ${lastName}.`);
console.log(`Good Morning ${fullName}! Have a great day.`);
</solution>
</codeblock>
