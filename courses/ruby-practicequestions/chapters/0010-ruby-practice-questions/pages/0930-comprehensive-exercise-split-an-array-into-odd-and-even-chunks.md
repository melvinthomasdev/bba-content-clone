Finish the method definition given below.

Given an array of numbers `arr`, the method should separate the array into 2 sub-arrays: one containing odd numbers, the other containing even numbers. The method should return an array of these two arrays, the even first and odd second.
The method should return only the even array if odd array is empty and vice versa.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def split_by_odd_and_even(arr)
  # Write your code here
end
</code>

<solution>
def split_by_odd_and_even(arr)
  even = even_only(arr)
  odd = arr - even
  return even if even.length == arr.length
  return odd if odd.length == arr.length

  [even, odd]
end

def even_only(arr)
  arr.reject{ |item| item.odd? }
end
</solution>

<testcases>
<caller>
puts split_by_odd_and_even(arr)
</caller>
<testcase>
<i>
arr = [2, 3, 7, 6, 2, 4, 9]
</i>
</testcase>
<testcase>
<i>
arr = [12, 14, 17]
</i>
</testcase>
<testcase>
<i>
arr = [10, 12, 6, 18]
</i>
</testcase>
<testcase>
<i>
arr = [1, 5, 3, 2]
</i>
</testcase>
<testcase>
<i>
arr = [1, 3]
</i>
</testcase>
</testcases>
</codeblock>