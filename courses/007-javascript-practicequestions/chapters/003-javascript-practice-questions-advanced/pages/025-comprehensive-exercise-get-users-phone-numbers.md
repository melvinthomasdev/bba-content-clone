Get all the users phone number.

1. Input will be a list of users.
2. Each user will have a field `phone`.
3. Return the phone numbers of all users.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getPhoneNumbers(users){
  // write your code here
}
</code>

<solution>
function getPhoneNumbers(users){
  return users.map((user) => {
    return user.phone;
  }).join(", ");
}
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
</testcases>
</Editor>