Finish the method definition below.

`data` is a hash. Given `data`, and a `key` and `value`, the method should assign `value` to `key` in `data` if `key` is not already assigned a value. Do not assign `value` to `key` if `key` is empty in `data`.

The method should then return the updated hash.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def update_data(data, key, value)
  # write your code here
end
</code>

<solution>
def update_data(data, key, value)
  data[key] = value unless data[key]

  data
end
</solution>

<testcases>
<caller>
puts update_data(data, key, value)
</caller>
<testcase>
<i>
data = {
  "name"=> "Alex",
  "location"=> "Kochi",
}
key = "age"
value = 30
</i>
</testcase>
<testcase>
<i>
data = {
  "item"=> "Pepsi",
  "quantity"=> 120,
}
key = "quantity"
value = 0
</i>
</testcase>
<testcase>
<i>
data = {
  "name"=> "Stuart",
  "location"=> "Pune",
}
key = "location"
value = ""
</i>
</testcase>
<testcase>
<i>
data = {
  "name"=> "Juan",
  "pto"=> 32,
}
key = "pto"
value = 0
</i>
</testcase>
</testcases>
</Editor>