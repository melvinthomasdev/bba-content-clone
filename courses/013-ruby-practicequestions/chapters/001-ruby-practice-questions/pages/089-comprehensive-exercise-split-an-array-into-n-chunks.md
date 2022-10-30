Finish the method definition given below.

Given an array `arr` and a number `max_length`, the method `split_array` should return an array of arrays in which each sub-array is of maximum `max_length` length.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def split_array(arr, max_length)
  # Write your code here
end
</code>

<solution>
def split_array(arr, max_length)
  arr.each_slice(max_length).to_a
end
</solution>

<testcases>
<caller>
puts split_array(arr, max_length)
</caller>
<testcase>
<i>
arr = [1, 2, 3, 4, 5, 6]
max_length = 3
</i>
</testcase>
<testcase>
<i>
arr = [1, 2, 3, 4, 5, 6]
max_length = 2
</i>
</testcase>
</testcases>
</Editor>