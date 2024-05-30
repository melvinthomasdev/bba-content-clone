The function `updatedEmployeeDetails` takes an object with the
employee's details as input. The function should return an
updated version of these details with the following modifications,

  - Add a new **age** property, calculated based on the **yearOfBirth** property.
  - Increment the **experience** property by 1.
  - If the **experience** property is initially absent, add it with a starting value of 1.

For example:
```js
Input:
const employeeDetailsAtJoining = {
  userId: 1,
  fullName: "Linh Tran",
  firstName: "Linh",
  lastName: "Tran",
  experience: 4,
  yearOfBirth: 1990,
  phoneNumber: 203354,
  emailAddress: "linh.tran@example.com",
};

Output:
{
  "userId": 1,
  "fullName": "Linh Tran",
  "firstName": "Linh",
  "lastName": "Tran",
  "experience": 5,
  "yearOfBirth": 1990,
  "phoneNumber": 203354,
  "emailAddress": "linh.tran@example.com",
  "age": 34
}
```

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
  fullName: "Eve Smith",
  firstName: "Eve",
  lastName: "Smith",
  experience: 2,
  yearOfBirth: 1990,
  phoneNumber: 203203,
  emailAddress: "eve.smith@example.com",
};
</i>
</testcase>
<testcase>
<i>
const employeeDetailsAtJoining = {
  userId: 2,
  fullName: "Renu Sen",
  firstName: "Renu",
  lastName: "Sen",
  yearOfBirth: 1995,
  phoneNumber: 123456,
  emailAddress: "renu@example.com",
};
</i>
</testcase>
<testcase>
<i>
const employeeDetailsAtJoining = {
  userId: 3,
  fullName: "Lao Xun",
  firstName: "Lao",
  lastName: "Xun",
  experience: 1,
  yearOfBirth: 1985,
  phoneNumber: 303303,
  emailAddress: "lao@example.com",
};
</i>
</testcase>
<testcase>
<i>
const employeeDetailsAtJoining = {
  userId: 4,
  fullName: "Carlos Alberti",
  firstName: "Carlos",
  lastName: "Alberti",
  yearOfBirth: 1970,
  phoneNumber: 404404,
  emailAddress: "c.alberti@example.com",
};
</i>
</testcase>
</testcases>
</codeblock>
