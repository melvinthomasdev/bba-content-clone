Finish the method definition below.

Given a number `n`, the method should return the sum of all odd numbers from 1 to `n`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sum_of_odd_numbers(n)
  # write your code here
end
</code>

<solution>
def sum_of_odd_numbers(n)
  (1..n).inject(0) { |sum, num| num%2 == 0 ? sum : sum + num }
end
</solution>

<testcases>
<caller>
puts sum_of_odd_numbers(n)
</caller>
<testcase>
<i>
n = 100
</i>
</testcase>
<testcase>
<i>
n = 34
</i>
</testcase>
<testcase>
<i>
n = 25
</i>
</testcase>
<testcase>
<i>
n = 159
</i>
</testcase>
<testcase>
<i>
n = 200
</i>
</testcase>
<testcase>
<i>
n = 10
</i>
</testcase>
</testcases>
</codeblock>