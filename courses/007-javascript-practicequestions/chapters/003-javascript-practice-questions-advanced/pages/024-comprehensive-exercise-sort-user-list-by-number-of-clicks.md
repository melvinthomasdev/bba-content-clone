Sort user list by number of clicks.

1. Each user will have a field `clicks` which will be a number.
2. Return list sorted by field `clicks` in ascending order.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function sortUsers(users){
  // write your code here
}
</code>

<solution>
function sortUsers(users){
  return users.sort((userA, userB) => {
    if (userA.clicks < userB.clicks) {
      return -1;
    }
    if (userA.clicks > userB.clicks) {
      return 1;
    }
    return 0;
  });
}
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
</testcases>
</Editor>