Given details of an employee, the function should return an updated version with the `experience` property incremented and a new property `age` calculated from `yearOfBirth` property added to it.

1. If the 'experience' property is missing, then add it with an initial value of `1`.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const updatedEmployeeDetails = employeeDetailsAtJoining => {
  // write your code here
}
</code>

<solution>
const updatedEmployeeDetails = employeeDetailsAtJoining => {
  const currentYear = new Date().getFullYear();
  employeeDetailsAtJoining = {
      ...employeeDetailsAtJoining,
      age: currentYear - employeeDetailsAtJoining.yearOfBirth,
      experience: employeeDetailsAtJoining.experience ? employeeDetailsAtJoining.experience + 1 : 1
  };
  return employeeDetailsAtJoining;
}
</solution>

<testcases>
<caller>
console.log(updatedEmployeeDetails(employeeDetailsAtJoining));
</caller>
<testcase>
<i>
const employeeDetailsAtJoining = {
  userId: 1,
  fullName: "Hercule Poirot",
  firstName: "Hercule",
  lastName: "Poirot",
  experience: 2,
  yearOfBirth: 1990,
  phoneNumber: 203203,
  emailAddress: "whitehaven.mansions@example.com",
};
</i>
</testcase>
<testcase>
<i>
const employeeDetailsAtJoining = {
  userId: 2,
  fullName: "John Doe",
  firstName: "John",
  lastName: "Doe",
  yearOfBirth: 1995,
  phoneNumber: 010101,
  emailAddress: "nowhere@example.com",
};
</i>
</testcase>
</testcases>
</codeblock>