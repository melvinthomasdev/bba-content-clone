Finish the method definition below.

`users` is an array of hashes. Each hash has the keys "user" and "clicks", a string representing the user's name and a number representing the number of clicks. Given `users`, the method should return a new array of users sorted by the number of clicks in ascending order.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sort_users(users)
  # Write your code here
end
</code>

<solution>
def sort_users(users)
  users.sort_by { |user| user[:clicks] }
end
</solution>

<testcases>
<caller>
puts sort_users(users)
</caller>
<testcase>
<i>
users = [
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
  },
];
</i>
</testcase>
<testcase>
<i>
users = [
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
  },
];
</i>
</testcase>
<testcase>
<i>
users = [
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
    clicks: 100,
  },
];
</i>
</testcase>
</testcases>
</codeblock>
