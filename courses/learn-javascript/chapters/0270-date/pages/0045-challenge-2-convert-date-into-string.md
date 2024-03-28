React India Conference is planned on October 17, 2024.
Use a **Date** instance and the **toDateString()**
method to display the following output,

**The next React India Conference is on Thu Oct 17 2024.**

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const reactConfDate =
const reactConfDateString =
// Add your code above this line
console.log(`The next React India Conference is on ${reactConfDateString}.`);
</code>

<solution>
const reactConfDate = new Date("October 17, 2024");
const reactConfDateString = reactConfDate.toDateString();
// Add your code above this line
console.log(`The next React India Conference is on ${reactConfDateString}.`);
</solution>
</codeblock>
