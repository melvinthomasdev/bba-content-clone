Some employee IDs need to be properly formatted.
Use the **padStart** method to add leading zeros
to the IDs stored in **employeeID1**, **employeeID2**,
and **employeeID3** so that all of them are exactly
8 characters long.
Store the formatted IDs in the variables **formattedEmployeeID1**,
**formattedEmployeeID2**, and **formattedEmployeeID3**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const employeeID1 = "1312";
const employeeID2 = "24565";
const employeeID3 = "21";

const formattedEmployeeID1 =
const formattedEmployeeID2 =
const formattedEmployeeID3 =

console.log(formattedEmployeeID1);
console.log(formattedEmployeeID2);
console.log(formattedEmployeeID3);
</code>

<solution>
const employeeID1 = "1312";
const employeeID2 = "24565";
const employeeID3 = "21";

const formattedEmployeeID1 = employeeID1.padStart(8, "0");
const formattedEmployeeID2 = employeeID2.padStart(8, "0");
const formattedEmployeeID3 = employeeID3.padStart(8, "0");

console.log(formattedEmployeeID1);
console.log(formattedEmployeeID2);
console.log(formattedEmployeeID3);
</solution>
</codeblock>
