Finish the method definition below.

`users` is an array of hashes. Each hash has the keys "user" and "phone", a string representing the user's phone number. The method should return phone numbers of all users separated by a comma and a space `", "`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def phone_numbers(users)
  # write your code here
end
</code>

<solution>
def phone_numbers(users)
  users.map { |user| user["phone"] }.join(", ")
end
</solution>

<testcases>
<caller>
puts phone_numbers(users)
</caller>
<testcase>
<i>
users = [
  {
    "user"=> "Eric",
    "phone"=> "202-555-0164",
  },
  {
    "user"=> "Sam",
    "phone"=> "202-555-0164",
  },
  {
    "user"=> "John",
    "phone"=> "202-555-0143",
  },
  {
    "user"=> "Amy",
    "phone"=> "202-555-0143",
  },
]
</i>
</testcase>
<testcase>
<i>
users = [
  {
    "user"=> "John",
    "phone"=> "202-555-0198",
  },
  {
    "user"=> "Maria",
    "phone"=> "202-555-0152",
  },
  {
    "user"=> "Bandon",
    "phone"=> "202-555-0143",
  },
  {
    "user"=> "Rachel",
    "phone"=> "202-555-0164",
  },
]
</i>
</testcase>
<testcase>
<i>
users = [
  {
    "user"=> "John",
    "phone"=> "202-555-0143",
  },
  {
    "user"=> "Maria",
    "phone"=> "202-555-0198",
  },
  {
    "user"=> "Bandon",
    "phone"=> "202-555-0164",
  },
  {
    "user"=> "Rachel",
    "phone"=> "202-555-0143",
  },
]
</i>
</testcase>
</testcases>
</Editor>