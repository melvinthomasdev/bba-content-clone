Finish the method definition below.

Given an array of numbers `arr`, the method `odd_indexes` should return an array of indexes of odd numbers in `arr`.

Note that you don't need to return the values. You need to return `index` of the odd values as you can see in
the "Expected Output".

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def odd_indexes(arr)
  # Write your code here
end
</code>

<solution>
def odd_indexes(arr)
  result = []
  arr.each_with_index do |e, i|
    result.push(i) if e.odd?
  end
  result
end
</solution>

<testcases>
<caller>
puts odd_indexes(arr)
</caller>
<testcase>
<i>
arr = [1, 2, 4, 3, 5, 7]
</i>
</testcase>
<testcase>
<i>
arr = []
</i>
</testcase>
<testcase>
<i>
arr = [2, 12, 34, 16, 100, 103, 82]
</i>
</testcase>
</testcases>
</codeblock>
