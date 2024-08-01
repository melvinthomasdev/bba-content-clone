Finish the method definition below.

`list` is an array of users, each of which is a hash with the keys "user" and "pincode", a string representing the user's pincode. Given `list`, the method should return a new array of pincodes of the users in `list`.

Non existing pincodes (like `nil`) should be ignored.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def pincodes(list)
  # Write your code here
end
</code>

<solution>
def pincodes(list)
  list.map { |user| user[:pincode] }.compact
end
</solution>

<testcases>
<caller>
puts pincodes(list)
</caller>
<testcase>
<i>
list = [
  {
    user: "Eric",
    pincode: "010",
  },
  {
    user: "Sam",
    pincode: "030",
  },
  {
    user: "John",
    pincode: "040"
  }
]
</i>
</testcase>
<testcase>
<i>
list = [
  {
    user: "Amy",
    pincode: "010",
  },
  {
    user: "Thomas",
    pincode: "042",
  },
  {
    user: "John",
    pincode: nil
  },
]
</i>
</testcase>
<testcase>
<i>
list = [
  {
    user: "Bandon",
    pincode: "010",
  },
  {
    user: "Maria",
    pincode: "042",
  },
  {
    user: "Adrian",
  },
]
</i>
</testcase>
</testcases>
</codeblock>
