Finish the method definition below.

Add the given element `value` to array `list` only if it doesn't already exist in the array. The method should then return the updated `list`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def add_to_list(list, value)
  # write your code here
end
</code>

<solution>
def add_to_list(list, value)
  list << value unless list.include? value

  list
end
</solution>

<testcases>
<caller>
updated_list = add_to_list(list, value)
puts updated_list.join(", ")
</caller>
<testcase>
<i>
list = ["Sam", "Ann", "Oliver"]
value = "Smith"
</i>
</testcase>
<testcase>
<i>
list = ["Sam", "Ann", "Smith"]
value = "Smith"
</i>
</testcase>
<testcase>
<i>
list = ["Ann", "Oliver"]
value = "Sam"
</i>
</testcase>
<testcase>
<i>
list = ["Ann", "Sam", "Oliver"]
value = "Oliver"
</i>
</testcase>
</testcases>
</Editor>