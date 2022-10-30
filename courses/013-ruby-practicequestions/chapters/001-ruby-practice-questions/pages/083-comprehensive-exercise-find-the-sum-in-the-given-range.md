Finish the method definition given below.

Given an array of 2 numbers `arr`, the function `range_sum` should return the sum of all the numbers between and including the range given in the array.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def range_sum(arr)
  # Write your code here
end
</code>

<solution>
def range_sum(arr)
  return (arr[0]..arr[1]).sum if arr[0] <= arr[1]

  (arr[1]..arr[0]).sum
end
</solution>

<testcases>
<caller>
puts range_sum(arr)
</caller>
<testcase>
<i>
arr = [10,2]
</i>
</testcase>
<testcase>
<i>
arr = [2,10]
</i>
</testcase>
<testcase>
<i>
arr = [1,5]
</i>
</testcase>
<testcase>
<i>
arr = [5,1]
</i>
</testcase>
</testcases>
</Editor>