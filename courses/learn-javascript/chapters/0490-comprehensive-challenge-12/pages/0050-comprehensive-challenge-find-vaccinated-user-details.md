Declare a function `vaccinatedUsers` to return the names of the users who are vaccinated.
If none of the users are vaccinated, it should return the message **No user is vaccinated**.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const vaccinatedUsers = users => {
  // write your code here
}
</code>

<solution>
const vaccinatedUsers = users => {
  const filteredVaccinatedUsers = users.filter(user => user.vaccinated).map(user => user.name);
    return filteredVaccinatedUsers.length ? filteredVaccinatedUsers.join(', ') : `No user is vaccinated`;
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
<testcase>
<i>
const users = [
  {
    name: "Sam",
    vaccinated: false,
  },
  {
    name: "Ann",
    vaccinated: false,
  },
  {
    name: "Oliver",
    vaccinated: false,
  },
  {
    name: "Smith",
    vaccinated: false,
  },
  {
    name: "Sam Smith",
    vaccinated: false,
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    name: "Sam",
    vaccinated: true,
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
  },
  {
    name: "Sam Smith",
    vaccinated: true,
  }
];
</i>
</testcase>
</testcases>
</codeblock>