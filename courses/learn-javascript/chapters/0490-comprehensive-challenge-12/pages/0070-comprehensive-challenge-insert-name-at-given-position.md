Insert the given user name at the specified position in the array.
The list of users will be given as input.

```js
Input:
users = ["John", "Jeff", "Adrian", "Alex", "Andrew", "Lisa"];
user = "Eric";
index = 4;

Output:
["John", "Jeff", "Adrian", "Alex", "Eric", "Andrew", "Lisa"]
```

<codeblock language="javascript" type="exercise" testMode="multipleInput">
<code>
const insertUser = ({ users, user, index }) => {
  // write your code here
}
</code>

<solution>
const insertUser = ({ users, user, index }) => {
  const updatedUsers = [...users]
  updatedUsers.splice(index, 0, user);
  return updatedUsers;
}
</solution>

<testcases>
<caller>
console.log(insertUser({ users, user, index }));
</caller>
<testcase>
<i>
const users = ["Ann", "Sam", "Smith", "Oliver"];
const user = "Alice";
const index = 2;
</i>
</testcase>
<testcase>
<i>
const users = ["John", "Jeff", "Adrian", "Alex", "Andrew", "Lisa"];
const user = "Eric";
const index = 4;
</i>
</testcase>
<testcase>
<i>
const users = ["Amy", "Bandon", "Maria", "Rachel", "Chuck", "Peter", "Thomas"];
const user = "Eric";
const index = 8;
</i>
</testcase>
<testcase>
<i>
const users = ["Amy", "Bandon", "Maria"];
const user = "Thomas";
const index = 3;
</i>
</testcase>
</testcases>
</codeblock>
