List the pincodes of all the users.

1. Input will be a list of users.
2. Each user will have a field `pincode`.
3. Return an array of pincodes of all the users of the list.

For example:
```js
Input:
list = [
  {
    user: 'Michael',
    pincode: '12345'
  },
  {
    user: 'Emma',
    pincode: '54321'
  },
  {
    user: 'Daniel',
    pincode: null
  },
  {
    user: 'Sophia',
  },
  {
    user: 'James',
    pincode: undefined
  }
]

Output:
['12345', '54321']
```
<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const getPincodes = list =>
  // write your code here
</code>

<solution>
const getPincodes = list =>
  list
    .map(users => users.pincode)
    .filter(pincode => !!pincode);
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
<testcase>
<i>
const list = [
  {
    user: 'Alice',
    pincode: '110'
  },
  {
    user: 'Bob',
    pincode: '220'
  },
  {
    user: 'Renu',
    pincode: null
  },
  {
    user: 'Diana',
  },
  {
    user: 'Sam',
    pincode: undefined
  }
];
</i>
</testcase>
</testcases>
</codeblock>
