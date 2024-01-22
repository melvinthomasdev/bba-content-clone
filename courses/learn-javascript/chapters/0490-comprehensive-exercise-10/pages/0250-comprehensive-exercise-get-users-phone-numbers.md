Get all the user's phone numbers.

1. Input will be a list of users.
2. Each user will have a field `phone`.
3. Return the phone numbers of all users.

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getPhoneNumbers = users =>
  // write your code here
</code>

<solution>
const getPhoneNumbers = users =>
  users.map((user) => user.phone).join(", ")
</solution>

<testcases>
<caller>
console.log(getPhoneNumbers(users));
</caller>
<testcase>
<i>
const users = [
  {
    user: "Eric",
    phone: "202-555-0164"
  },
  {
    user: "Sam",
    phone: "202-555-0164"
  },
  {
    user: "John",
    phone: "202-555-0143"
  },
  {
    user: "Amy",
    phone: "202-555-0143"
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "John",
    phone: "202-555-0198"
  },
  {
    user: "Maria",
    phone: "202-555-0152"
  },
  {
    user: "Bandon",
    phone: "202-555-0143"
  },
  {
    user: "Rachel",
    phone: "202-555-0164"
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "John",
    phone: "202-555-0143"
  },
  {
    user: "Maria",
    phone: "202-555-0198"
  },
  {
    user: "Bandon",
    phone: "202-555-0164"
  },
  {
    user: "Rachel",
    phone: "202-555-0143"
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "Sam",
    phone: "202-555-0445"
  },
  {
    user: "Renu",
    phone: "202-555-0198"
  },
  {
    user: "John",
    phone: "202-555-0164"
  },
  {
    user: "Rachel",
    phone: "202-555-6767"
  }
];
</i>
</testcase>
</testcases>
</codeblock>