Declare a function `vaccinatedUsers` to return the names of the users who are vaccinated.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const vaccinatedUsers = users => {
  // write your code here
}
</code>

<solution>
const vaccinatedUsers = users => {
  const filteredVaccinatedUsers = users.filter(user => user.vaccinated).map(user => user.name);
  return filteredVaccinatedUsers.join(', ');
}
</solution>

<testcases>
<caller>
console.log(vaccinatedUsers(users));
</caller>
<testcase>
<i>
const users = [
  {
    name: "Sam",
    vaccinated: false,
  },
  {
    name: "Ann",
    vaccinated: true,
  },
  {
    name: "Oliver",
    vaccinated: true,
  },
  {
    name: "Smith",
    vaccinated: false,
  },
  {
    name: "Sam Smith",
    vaccinated: true,
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    name: "Sam",
    vaccinated: false,
  },
  {
    name: "Ann",
    vaccinated: true,
  },
  {
    name: "Oliver",
    vaccinated: true,
  },
  {
    name: "Smith",
    vaccinated: false,
  },
  {
    name: "Sam Smith",
  }
];
</i>
</testcase>
</testcases>
</codeblock>