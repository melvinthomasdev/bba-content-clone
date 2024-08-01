Finish the method definition below.

`get_property` should extract and return the value of given key from a given hash `object` and return `Not found` if property is not found.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def get_property(object, property)
  # write your code here
end
</code>

<solution>
def get_property(object, property)
  object[property.to_sym] || "Not found"
end
</solution>

<testcases>
<caller>
puts get_property(obj, property)
</caller>
<testcase>
<i>
obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030",
}
property = "name"
</i>
</testcase>
<testcase>
<i>
obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030",
}
property = "age"
</i>
</testcase>
<testcase>
<i>
obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030",
}
property = "phone"
</i>
</testcase>
<testcase>
<i>
obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030",
}
property = "id"
</i>
</testcase>
<testcase>
<i>
obj = {
  name: "Oliver",
  age: 28,
  address: "Main Street, New York, NY 10030",
}
property = "address"
</i>
</testcase>
</testcases>
</codeblock>
