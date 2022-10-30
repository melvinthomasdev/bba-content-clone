Finish the method definition below.

Given an array of numbers `list`, and another number `divisor`, the method should return `true` if all the values in the array are multiples of `divisor`, and `false` otherwise.


<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def elements_divisible?(list, divisor)
  # write your code here
end
</code>

<solution>
def elements_divisible?(list, divisor)
  list.all? { |num| num % divisor == 0 }
end
</solution>

<testcases>
<caller>
puts elements_divisible?(list, divisor)
</caller>
<testcase>
<i>
list = [2, 4, 3, 6]
divisor = 2
</i>
</testcase>
<testcase>
<i>
list = [9, 27, 3, 18, 72, 102]
divisor = 3
</i>
</testcase>
<testcase>
<i>
list = [437, 95, 152, 228, 342]
divisor = 19
</i>
</testcase>
<testcase>
<i>
list = [147, 224, 287, 725, 973]
divisor = 17
</i>
</testcase>
</testcases>
</Editor>