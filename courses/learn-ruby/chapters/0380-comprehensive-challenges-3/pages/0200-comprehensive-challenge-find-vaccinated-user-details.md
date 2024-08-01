Finish the method definition below.

For a given list `users`, print the names of the users who have been vaccinated, separated by a comma and a space `", "`.
Each items in the list `users` is a hash with two keys: "name" and "vaccinated" (boolean).

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def vaccinated_users(users)
  # Write your code here
end
</code>

<solution>
def vaccinated_users(users)
  users_detail = users.select { |user| user[:vaccinated] }.map { |user| user[:name] }

  users_detail.join(', ')
end
</solution>

<testcases>
<caller>
puts vaccinated_users(users)
</caller>
<testcase>
<i>
users = [
  {
    name: "Sam",
    vaccinated: false,
  },
  {
    name: "Ann",
    vaccinated: true,
  },
  {
    name: "Oliver",
    vaccinated: true,
  },
  {
    name: "Smith",
    vaccinated: false,
  },
  {
    name: "Sam Smith",
    vaccinated: true,
  }
]
</i>
</testcase>
<testcase>
<i>
users = [
  {
    name: "Sam",
    vaccinated: false,
  },
  {
    name: "Ann",
    vaccinated: true,
  },
  {
    name: "Oliver",
    vaccinated: true,
  },
  {
    name: "Smith",
    vaccinated: false,
  },
  {
    name: "Sam Smith",
  }
]
</i>
</testcase>
</testcases>
</codeblock>
