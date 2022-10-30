List pincodes of all the users.

1. Input will be a list of users.
2. Each user will have a field `pincode`.
3. Return array of pincode of all the users of the list.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function getPincodes(list){
  // write your code here
}
</code>

<solution>
function getPincodes(list){
  return list
    .map(users => users.pincode)
    .filter(pincode => !!pincode);
}
</solution>

<testcases>
<caller>
console.log(getPincodes(list));
</caller>
<testcase>
<i>
const list = [
  {
    user: 'Eric',
    pincode: '010'
  },
  {
    user: "Sam",
    pincode: "030"
  },
  {
    user: "John",
    "pincode": "040"
  }
];
</i>
</testcase>
<testcase>
<i>
const list = [
  {
    user: 'Amy',
    pincode: '010'
  },
  {
    user: "Thomas",
    pincode: "042"
  },
  {
    user: "John",
    "pincode": undefined
  }
];
</i>
</testcase>
<testcase>
<i>
const list = [
  {
    user: 'Bandon',
    pincode: '010'
  },
  {
    user: "Maria",
    pincode: "042"
  },
  {
    user: "Adrian"
  }
];
</i>
</testcase>
</testcases>
</Editor>