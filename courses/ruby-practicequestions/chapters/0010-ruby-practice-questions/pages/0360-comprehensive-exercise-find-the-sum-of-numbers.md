Finish the method definition below.

The method should return the sum of all the numbers that are passed as input to the method. There can be any number of arguments passed to the method.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def sum()
  # write your code here
end
</code>

<solution>
def sum(*numbers)
  numbers.inject(0) { |sum, num| num + sum}
end
</solution>

<testcases>
<caller>
puts sum(*numbers)
</caller>
<testcase>
<i>
numbers = [3, 4, 5, 10, 8, 12, 23]
</i>
</testcase>
<testcase>
<i>
numbers = [12, 31, 11, 76, 19, 87, 12]
</i>
</testcase>
<testcase>
<i>
numbers = [32, 98, 54, 34, 21, 98, 65];
</i>
</testcase>
<testcase>
<i>
numbers = [322, 788, 764, 34, 546, 98, 65]
</i>
</testcase>
</testcases>
</codeblock>