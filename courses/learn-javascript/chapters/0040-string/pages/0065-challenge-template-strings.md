Update the console log
statements to display the
values accordingly:

```
Employee ID: [employeeIdNumber]
Name: [employeeName]
Department: [department]
Full-Time: [isFullTime]
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
