Finish the method definition given below.

`arr` is a array of arrays, in which each subarray has few numbers. Given `arr`,  the method should sort and return the array in such a way that the subarrays are ordered by their sums in ascending order.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def order_by_sum(arr)
  # Write your code here
end
</code>

<solution>
def order_by_sum(arr)
  arr.sort_by{|sub_arr| sub_arr.sum}
end
</solution>

<testcases>
<caller>
puts order_by_sum(arr)
</caller>
<testcase>
<i>
arr = [[11,13], [4,12], [2,1]]
</i>
</testcase>
<testcase>
<i>
arr = [[1,7], [11,10], [2,1]]
</i>
</testcase>
<testcase>
<i>
arr = [[14,5], [5,10], [8,9]]
</i>
</testcase>
<testcase>
<i>
arr = [[-2,5], [5,-10], [8,9]]
</i>
</testcase>
</testcases>
</Editor>