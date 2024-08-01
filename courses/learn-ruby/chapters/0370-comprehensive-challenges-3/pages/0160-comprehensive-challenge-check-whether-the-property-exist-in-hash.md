Finish the method definition below.

Check whether a given key `property` does exist in the hash `obj` and return `true`. Otherwise, return `false`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def property_exists?(obj, property)
  # write your code here
end
</code>

<solution>
def property_exists?(obj, property)
  obj.has_key? property
end
</solution>

<testcases>
<caller>
puts property_exists?(obj, property)
</caller>
<testcase>
<i>
obj = {
  id: 1,
  user_name: "oliver_smith",
  name: "Oliver Smith",
}
property = "age"
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
</i>
</testcase>
</testcases>
</codeblock>
