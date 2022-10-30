Finish the method definition below.

Given a hash `obj` and a key `k`, the method `property` should return the value of key `k` from hash `obj`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def property(obj, k)
  # write your code here
end
</code>

<solution>
def property(obj, k)
  obj[k]
end
</solution>

<testcases>
<caller>
puts property(obj, k)
</caller>
<testcase>
<i>
obj = {
  "name" => "Oliver",
  "hobby" => "Writing"
}
k = "name"
</i>
</testcase>
<testcase>
<i>
obj = {}
k = "name"
</i>
</testcase>
<testcase>
<i>
obj = {
  "name" => "Oliver",
  "hobby" => "Writing"
}
k = "profession"
</i>
</testcase>
<testcase>
<i>
obj = {
  "name" => "Oliver",
  "hobby" => "Writing"
}
k = 'hobby'
</i>
</testcase>
</testcases>
</Editor>