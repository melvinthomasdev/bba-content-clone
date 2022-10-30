Declare a function `macbookUsers` to
list all users who have MacBook as their device model.
There will be a key `device` that contains the device model.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function macbookUsers(users){
  // write your code here
}
</code>

<solution>
function macbookUsers(users){
  return users.filter(({ device = "" }) => {
    return device.toLowerCase().includes("macbook");
  }).map(({user}) => user);
}
</solution>

<testcases>
<caller>
console.log(macbookUsers(users));
</caller>
<testcase>
<i>
const users = [
  {
    user: "Amy",
    device: "MacBook",
  },
  {
    user: "Jeff",
    device: "Asus Zenbook 14",
  },
  {
    user: "Alex",
    device: "MacBook",
  },
  {
    user: "Rachel",
    device: "iMac",
  },
  {
    user: "John",
    device: "MacBook",
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "Chuck",
    device: "Asus Zenbook 14",
  },
  {
    user: "Bandon",
    device: "MacBook",
  },
    {
    user: "Maria",
    device: "iMac",
  },
  {
    user: "Thomas",
    device: "MacBook",
  },
  {
    user: "Stuart",
    device: "MacBook",
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "Lindsay",
    device: "MacBook Pro 13",
  },
  {
    user: "Peter",
    device: "MacBook",
  },
    {
    user: "Victoria",
    device: "MacBook Pro 15",
  },
  {
    user: "Erica",
    device: "Dell",
  },
  {
    user: "Clark",
    device: "macbook pro 13",
  }
];
</i>
</testcase>
</testcases>
</Editor>