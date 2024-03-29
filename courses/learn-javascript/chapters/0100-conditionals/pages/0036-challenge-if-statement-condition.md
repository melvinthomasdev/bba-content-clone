Given is data of three employees. Update the code in such a way that it logs to the console whichever employee
has admin access, in the following manner:
`X has admin access.`


<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const employeeOne = {
  name: "Tommy",
  isAdmin: false
};
const employeeTwo = {
  name: "Mickey",
  isAdmin: true
};
const employeeThree = {
  name: "Harry",
  isAdmin: false
};
// Write your code here
</code>

<solution>
const employeeOne = {
  name: "Tommy",
  isAdmin: false
};
const employeeTwo = {
  name: "Mickey",
  isAdmin: true
};
const employeeThree = {
  name: "Harry",
  isAdmin: false
};

// Write your code here
if (employeeOne.isAdmin) {
  console.log(`${employeeOne.name} has admin access.`);
};

if (employeeTwo.isAdmin) {
  console.log(`${employeeTwo.name} has admin access.`);
};

if (employeeThree.isAdmin) {
  console.log(`${employeeThree.name} has admin access.`);
};
</solution>
</codeblock>
