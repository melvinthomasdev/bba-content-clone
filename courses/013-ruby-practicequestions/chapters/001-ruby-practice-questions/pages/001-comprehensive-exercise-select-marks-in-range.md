Finish the method definition below.

There is a hash `marks` which contains students' names as keys and their marks as values.
There are two numbers `upper_limit` and `lower_limit`.
The method `marks_in_range` should filter and return the hash with only those students and marks, where marks are greater than or equal to `lower_limit`, and less than or equal to `upper_limit`.


<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def marks_in_range(marks, upper_limit, lower_limit)
  # write your code here
end
</code>

<solution>
def marks_in_range(marks, upper_limit, lower_limit)
  marks.select do |student, mark|
    (lower_limit..upper_limit).include?(mark)
  end
end
</solution>

<testcases>
<caller>
puts marks_in_range(marks, upper_limit, lower_limit)
</caller>
<testcase>
<i>
marks = {
  Danny: 76,
  Glover: 44,
  Phoebe: 89
}
lower_limit = 50
upper_limit = 80
</i>
</testcase>
<testcase>
<i>
marks = {
  Bruce: 32,
  Tony: 42,
  Natasha: 52,
  Steve: 62,
  Thor: 72,
  Clint: 82
}
lower_limit = 42
upper_limit = 72
</i>
</testcase>
<testcase>
<i>
marks = {
  Sam: 31,
  Frodo: 51,
  Merry: 71,
  Pippin: 91
}
lower_limit = 32
upper_limit = 50
</i>
</testcase>
</testcases>
</Editor>