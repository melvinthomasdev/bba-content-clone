Finish the method definition below.

Given an input find out whether the number is divisible by 6 or not.

Return `true` if the number is divisible by 6 and `false` if not.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def is_divisible(number)
  # write your code here
end
</code>

<solution>
def is_divisible(number)
  number % 6 == 0
end
</solution>

<testcases>
<caller>
puts is_divisible(number)
</caller>
<testcase>
<i>
number = 10
</i>
</testcase>
<testcase>
<i>
number = 1122
</i>
</testcase>
<testcase>
<i>
number = 9876
</i>
</testcase>
<testcase>
<i>
number = 963
</i>
</testcase>
<testcase>
<i>
number = 468
</i>
</testcase>
</testcases>
</codeblock>