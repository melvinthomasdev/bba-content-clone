Finish the method definition below.

`list` is an array of items, each of which is an array of numbers. Given `list`, the method should return a new array of sums of the numbers in each array in `list`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sum(list)
  # write your code here
end
</code>

<solution>
def sum(list)
  list.map do |sub_list|
    sub_list.inject(0) { |sum,x| sum + x }
  end
end
</solution>

<testcases>
<caller>
puts sum(list)
</caller>
<testcase>
<i>
list = [[3, 4], [10, 20], [12, 13], [14, 17], [19, 20]]
</i>
</testcase>
<testcase>
<i>
list = [[9, 2, 12], [12, 233, 98, 87], [65, 43, 12, 13], [87, 114, 179, 786], [234, 34, 19, 20]]
</i>
</testcase>
<testcase>
<i>
list = [[19, 12], [34, 545, 65, 654], [43, 98, 90]]
</i>
</testcase>
<testcase>
<i>
list = [[19, 12], [34, 545, 65, 654], [43, 98, 90], []]
</i>
</testcase>
<testcase>
<i>
list = [[3, 4], [], [12, 13], [14, 17], [19, 20]]
</i>
</testcase>
<testcase>
<i>
list = [[23, 4], [10, 20], [12, 13], [14, 17], [19, 20]]
</i>
</testcase>
</testcases>
</codeblock>