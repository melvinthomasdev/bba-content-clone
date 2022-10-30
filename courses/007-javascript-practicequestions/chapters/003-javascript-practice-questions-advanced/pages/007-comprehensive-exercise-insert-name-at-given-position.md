Insert the given user name at the specified position in the array.
The list of users will be given as input.

<Editor lang="javascript" type="exercise" testMode="multipleInput">
<code>
function insertUser(users, user, index){
  // write your code here
}
</code>

<solution>
function insertUser(users, user, index){
  users.splice(index, 0, user);
  return users;
}
</solution>

<testcases>
<caller>
console.log(insertUser(users, user, index));
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
</Editor>