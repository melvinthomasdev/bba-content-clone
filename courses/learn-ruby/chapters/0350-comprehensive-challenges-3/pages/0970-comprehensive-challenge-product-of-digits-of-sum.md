Finish the method definition given below.

Given multiple number arguments, the method `sum_dig_prod` shoud add the numbers passed as arguments. It should then multiply the digits of this sum until
the product is only 1 digit long and return the final product as the result.

1. For example: sum_dig_prod(16, 28) ➞ 6
   - 16 + 28 = 44
   - 4 * 4 =  16
   - 1 * 6 = 6

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sum_dig_prod(*n)
  # Write your code here
end
</code>

<solution>
def sum_dig_prod(*n)
  sum = n.reduce(:+)
  while sum >= 10 do
    sum = sum.to_s.chars.map(&:to_i).reduce(:*)
  end
  sum
end
</solution>

<testcases>
<caller>
puts sum_dig_prod(*n)
</caller>
<testcase>
<i>
n = [8, 16, 89, 3]
</i>
</testcase>
<testcase>
<i>
n = [16, 28]
</i>
</testcase>
<testcase>
<i>
n = [9]
</i>
</testcase>
<testcase>
<i>
n = [26, 497, 62, 841]
</i>
</testcase>
<testcase>
<i>
n = [17737, 98723, 2]
</i>
</testcase>
<testcase>
<i>
n = [0]
</i>
</testcase>
<testcase>
<i>
n = [123, -99]
</i>
</testcase>
<testcase>
<i>
n = [9, 8]
</i>
</testcase>
</testcases>
</codeblock>