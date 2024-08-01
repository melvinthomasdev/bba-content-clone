Finish the method definition given below.

Given an array `arr` as input, the method should return a new array containing all the elements of `arr` in a flattened form.

1. Eg. An array [[6], [12], [25]] becomes [6, 12, 25]
2. Eg. An array [1, [2]] become [1,2]

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def flatten_array(arr)
  # Write your code here
end
</code>

<solution>
def flatten_array(arr)
  arr.flatten
end
</solution>

<testcases>
<caller>
puts flatten_array(arr)
</caller>
<testcase>
<i>
arr = [
  ["$6"],
  ["$12"],
  ["$25"],
  ["$25"],
  ["$18"],
  ["$22"],
  ["$10"]
]
</i>
</testcase>
<testcase>
<i>
arr  = [
  [5, 1],
  [6],
  [2],
  [8]
]
</i>
</testcase>
<testcase>
<i>
arr  = [1, [2], [3, [[4]]]]
</i>
</testcase>
<testcase>
<i>
arr  = [1, [2]]
</i>
</testcase>
</testcases>
</codeblock>
