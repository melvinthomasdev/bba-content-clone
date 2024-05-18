Create a function `hasInternationalStudents()` that takes in as input an array of objects **studentDetails** with **name** and **country** as properties and checks if there are any students from countries other than India.

If there exist a student who is from a country other than India, return **true** else return **false**.

<codeblock language="javascript" type="exercise" testMode="fixedInput">
<code>
const studentDetails = [
  { name: "Sam", country: "India" },
  { name: "Eve", country: "USA" },
  { name: "Renu", country: "India" },
  { name: "Lao", country: "Canada" },
  { name: "Carlos", country: "Germany" }
];

console.log(hasInternationalStudents(studentDetails));
</code>
<solution>
const studentDetails = [
  { name: "Sam", country: "India" },
  { name: "Eve", country: "USA" },
  { name: "Renu", country: "India" },
  { name: "Lao", country: "Canada" },
  { name: "Carlos", country: "Germany" }
];

const hasInternationalStudents = studentDetails => studentDetails.some(student => student.country !== "India");

console.log(hasInternationalStudents(studentDetails));
</solution>
</codeblock>
