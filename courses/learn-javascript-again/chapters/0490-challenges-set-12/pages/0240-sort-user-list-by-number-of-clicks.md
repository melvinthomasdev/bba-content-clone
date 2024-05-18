Sort the list of users by the number of clicks.

1. Each user will have a field `clicks` which will be a number.
2. Return list sorted by field `clicks` in ascending order.

For example:
```js
Input:
users = [
  {
    user: "Eva",
    clicks: 20,
  },
  {
    user: "Mark",
    clicks: 120,
  },
  {
    user: "Sophie",
    clicks: 50,
  },
  {
    user: "James",
    clicks: 28,
  },
  {
    user: "Olivia",
    clicks: 80,
  },
];

Output:
[
  {
    "user": "Eva",
    "clicks": 20
  },
  {
    "user": "James",
    "clicks": 28
  },
  {
    "user": "Sophie",
    "clicks": 50
  },
  {
    "user": "Olivia",
    "clicks": 80
  },
  {
    "user": "Mark",
    "clicks": 120
  }
]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const sortUsers = users => {
  // write your code here
}
</code>

<solution>
const sortUsers = users =>
  [...users].sort((userA, userB) => {
    if (userA.clicks < userB.clicks) return -1;

    if (userA.clicks > userB.clicks) return 1;

    return 0;
  });
</solution>

<testcases>
<caller>
const sortedUsers = sortUsers(users);
console.log(JSON.stringify(sortedUsers, null, 2));
</caller>
<testcase>
<i>
const users = [
  {
    user: "Eric",
    clicks: 430,
  },
  {
    user: "Sam",
    clicks: 220,
  },
  {
    user: "John",
    clicks: 830,
  },
  {
    user: "Amy",
    clicks: 778,
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "John",
    clicks: 23,
  },
  {
    user: "Maria",
    clicks: 20,
  },
  {
    user: "Bandon",
    clicks: 84,
  },
  {
    user: "Rachel",
    clicks: 78,
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "John",
    clicks: 123,
  },
  {
    user: "Maria",
    clicks: 240,
  },
  {
    user: "Bandon",
    clicks: 857,
  },
  {
    user: "Rachel",
    clicks: 100
  }
];
</i>
</testcase>
<testcase>
<i>
const users = [
  {
    user: "Eva",
    clicks: 20,
  },
  {
    user: "Mark",
    clicks: 120,
  },
  {
    user: "Sophie",
    clicks: 50,
  },
  {
    user: "James",
    clicks: 28,
  },
  {
    user: "Olivia",
    clicks: 80,
  },
];
</i>
</testcase>
</testcases>
</codeblock>
