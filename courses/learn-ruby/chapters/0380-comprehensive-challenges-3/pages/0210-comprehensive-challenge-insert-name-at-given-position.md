Finish the method definition below.

`users` is a list of names.
The method should insert the name provided as `user` at the index provided as `index` in the `users` array.
The method should return the updated array.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def insert_user(users, user, index)
  # Write your code here
end
</code>

<solution>
def insert_user(users, user, index)
  users.insert(index, user)
end
</solution>

<testcases>
<caller>
puts insert_user(users, user, index)
</caller>
<testcase>
<i>
users = ["Ann", "Sam", "Smith", "Oliver"]
user = "Alice"
index = 2
</i>
</testcase>
<testcase>
<i>
users = ["John", "Jeff", "Adrian", "Alex", "Andrew", "Lisa"]
user = "Eric"
index = 4
</i>
</testcase>
<testcase>
<i>
users = ["Amy", "Bandon", "Maria", "Rachel", "Chuck", "Peter", "Thomas"]
user = "Eric"
index = 7
</i>
</testcase>
<testcase>
<i>
users = ["Amy", "Bandon", "Maria"]
user = "Thomas"
index = 3
</i>
</testcase>
</testcases>
</codeblock>
