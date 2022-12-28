Check whether all the users in the given list have a credit card.

1. Check whether all users in the given list have a credit card.
2. The user object will contain name of the user and a key `creditCard`.
3. Return `true` if all the users have `creditCard` field as `true`, `false` otherwise.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const doesAllUsersHaveCreditCard = users =>
  // write your code here
</code>

<solution>
const doesAllUsersHaveCreditCard = users =>
  users.every(user => user.creditCard);
</solution>

<testcases>
<caller>
console.log(doesAllUsersHaveCreditCard(users));
</caller>
<testcase>
<i>
const users = [
  {
    name: "Amy",
    creditCard: true
  },
  {
    name: "Bandon",
    creditCard: true
  },
  {
    name: "Maria",
    creditCard: true
  },
  {
    name: "Rachel",
    creditCard: true
  },
  {
    name: "Chuck",
    creditCard: true
  },
  {
    name: "Peter",
    creditCard: true
  },
  {
    name: "Thomas",
    creditCard: true
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    name: "Amy",
    creditCard: true
  },
  {
    name: "Bandon",
    creditCard: true
  },
  {
    name: "Maria",
    creditCard: true
  },
  {
    name: "Rachel",
    creditCard: false
  },
  {
    name: "Chuck",
    creditCard: true
  },
  {
    name: "Peter",
    creditCard: false
  },
  {
    name: "Thomas",
    creditCard: true
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    name: "Amy",
    creditCard: false
  },
  {
    name: "Bandon",
    creditCard: false
  },
  {
    name: "Maria",
    creditCard: false
  },
  {
    name: "Rachel",
    creditCard: false
  },
  {
    name: "Chuck",
    creditCard: false
  },
  {
    name: "Peter",
    creditCard: false
  },
  {
    name: "Thomas",
    creditCard: false
  }
];
</i>
</testcase>
</testcases>
</codeblock>