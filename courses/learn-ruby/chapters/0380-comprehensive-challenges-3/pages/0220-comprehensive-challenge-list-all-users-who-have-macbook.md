Finish the method definition below.

`users` is an array of hashes, each of which has two keys: "name" and "device".
The method should return names of all users who have a MacBook device, separated by a comma and a space `", "`.

If the user's device contains the string MacBook, (case insensitive), then the user is considered to have a MacBook.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def macbook_users(users)
  # Write your code here
end
</code>

<solution>
def macbook_users(users)
  users.select { |user| user[:device].downcase.include? "macbook" }
       .map { |user| user[:name]}.join(', ')
end
</solution>

<testcases>
<caller>
print macbook_users(users)
</caller>
<testcase>
<i>
users = [
  {
    name: "Amy",
    device: "MacBook",
  },
  {
    name: "Jeff",
    device: "Asus Zenbook 14",
  },
  {
    name: "Alex",
    device: "MacBook",
  },
  {
    name: "Rachel",
    device: "iMac",
  },
  {
    name: "John",
    device: "MacBook",
  }
]
</i>
</testcase>
<testcase>
<i>
users = [
  {
    name: "Chuck",
    device: "Asus Zenbook 14",
  },
  {
    name: "Bandon",
    device: "MacBook",
  },
  {
    name: "Maria",
    device: "iMac",
  },
  {
    name: "Thomas",
    device: "MacBook",
  },
  {
    name: "Stuart",
    device: "MacBook",
  }
]
</i>
</testcase>
<testcase>
<i>
users = [
  {
    name: "Lindsay",
    device: "MacBook Pro 13",
  },
  {
    name: "Peter",
    device: "MacBook",
  },
  {
    name: "Victoria",
    device: "MacBook Pro 15",
  },
  {
    name: "Erica",
    device: "Dell",
  },
  {
    name: "Clark",
    device: "macbook pro 13",
  }
]
</i>
</testcase>
</testcases>
</codeblock>
