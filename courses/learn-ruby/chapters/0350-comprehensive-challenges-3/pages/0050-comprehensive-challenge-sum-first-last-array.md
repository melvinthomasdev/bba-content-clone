Finish the method definition below.

Given an array `arr`, the method `sum_extremes` should return the sum of the first and the last element of `arr`.

Note: If `arr` does not contain any element, the method should return `0`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sum_extremes(arr)
  # write your code here
end
</code>

<solution>
def sum_extremes(arr)
  return 0 if arr.length == 0

  arr[0] + arr[arr.length - 1]
end
</solution>

<testcases>
<caller>
puts sum_extremes(arr)
</caller>
<testcase>
<i>
arr = [1, 2, 3, 4, 5]
</i>
</testcase>
<testcase>
<i>
arr = [10]
</i>
</testcase>
<testcase>
<i>
arr = []
</i>
</testcase>
<testcase>
<i>
arr = [1, 2, 3, 4, -4, -3, -2, -1]
</i>
</testcase>
</testcases>
</codeblock>