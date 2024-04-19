Update the console log
statements to display the
values accordingly:

```js
Output:
Employee ID: "012345"
Name: "Eve Smith"
Department: "Marketing"
Full-Time: true
```

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const employeeName = "Eve Smith";
const employeeIdNumber = "012345";
const department = "Marketing";
const isFullTime = true;

console.log();
console.log();
console.log();
console.log();
</code>

<solution>
const employeeName = "Eve Smith";
const employeeIdNumber = "012345";
const department = "Marketing";
const isFullTime = true;

console.log(`Employee ID: ${employeeIdNumber}`);
console.log(`Name: ${employeeName}`);
console.log(`Department: ${department}`);
console.log(`Full-Time: ${isFullTime}`);
</solution>
</codeblock>
