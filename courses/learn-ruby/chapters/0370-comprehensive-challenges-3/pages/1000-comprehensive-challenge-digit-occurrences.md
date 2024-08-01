Finish the method definition given below.

Given three number arguments `min`, `max` and `digit`, the method `digit_count` should count the number of times `digit` occurs in the numbers that are in the range (inclusive) from `min` to `max` and then return the count.

Example:
- digit_count(51, 55, 5) ➞ 6
- [51, 52, 53, 54, 55] : 5 occurs 6 times

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def digit_count(min, max, digit)
  # Write your code here
end
</code>

<solution>
def digit_count(min, max, digit)
  [*min..max].join.count(digit.to_s)
end
</solution>

<testcases>
<caller>
puts digit_count(min, max, digit)
</caller>
<testcase>
<i>
min = 51
max = 55
digit = 5
</i>
</testcase>
<testcase>
<i>
min = 1
max = 8
digit = 9
</i>
</testcase>
<testcase>
<i>
min = 71
max = 77
digit = 2
</i>
</testcase>
<testcase>
<i>
min = 1
max = 14
digit = 4
</i>
</testcase>
<testcase>
<i>
min = 20
max = 30
digit = 2
</i>
</testcase>
<testcase>
<i>
min = 18
max = 37
digit = 3
</i>
</testcase>
<testcase>
<i>
min = 5
max = 335
digit = 6
</i>
</testcase>
<testcase>
<i>
min = -19
max = 19
digit = 0
</i>
</testcase>
</testcases>
</codeblock>