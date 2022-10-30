Finish the method definition below.

The method should return the sum of numbers in the array `list`. If the array `list` is empty, the method should return 0.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def sum(list)
  # write your code here
end
</code>

<solution>
def sum(list)
  list.inject(0) { |sum,x| sum + x }
end
</solution>

<testcases>
<caller>
puts sum(list)
</caller>
<testcase>
<i>
list = [4, 5, -9, 19, 110]
</i>
</testcase>
<testcase>
<i>
list = [2, 15, 9, 18]
</i>
</testcase>
<testcase>
<i>
list = [12, -15, 19, 58]
</i>
</testcase>
<testcase>
<i>
list = [20, 20, 29, 18]
</i>
</testcase>
</testcases>
</Editor>