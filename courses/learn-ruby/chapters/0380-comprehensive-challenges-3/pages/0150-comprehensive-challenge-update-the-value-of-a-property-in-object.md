Finish the method definition below.

Update the `value` of given key `property` in the hash `obj`. Add the key and value to the hash `obj` if it doesn't exist. The method should then return the updated hash.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def update_object(obj, property, value)
  # Write your code here
end
</code>

<solution>
def update_object(obj, property, value)
  obj[property.to_sym] = value

  obj
end
</solution>

<testcases>
<caller>
puts update_object(obj, property, value)
</caller>
<testcase>
<i>
obj = {
  id: 1,
  user_name: "oliver_smith",
  name: "Oliver Smith",
}
property = "age"
value = 32
</i>
</testcase>
<testcase>
<i>
obj = {
  id: 1,
  user_name: "oliver_smith",
  name: "Oliver Smith",
}
property = "user_name"
value = "sam_smith"
</i>
</testcase>
<testcase>
<i>
obj = {
  id: 1,
  user_name: "oliver_smith",
  name: "Oliver Smith",
}
property = "name"
value = "Sam Smith"
</i>
</testcase>
<testcase>
<i>
obj = {
  id: 1,
  user_name: "oliver_smith",
  name: "Oliver Smith",
}
property = "address"
value = "432 Street, Downtown"
</i>
</testcase>
</testcases>
</codeblock>
