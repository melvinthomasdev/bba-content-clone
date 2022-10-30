Complete the method definition given below.

Return an array without any values, but of a given length `length`.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def create_array(length)
  # write your code here
end
</code>

<solution>
def create_array(length)
  Array.new(length)
end
</solution>

<testcases>
<caller>
puts create_array(length)
</caller>
<testcase>
<i>
length = 12
</i>
</testcase>
</testcases>
</Editor>