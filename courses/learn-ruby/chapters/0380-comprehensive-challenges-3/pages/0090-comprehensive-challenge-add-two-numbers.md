Finish the method definition below.

Given two inputs to the method, `add` should return the result as the sum of two input values.

Note: `add` should return the result even if the inputs passed are strings.


<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def add(x, y)
  # Write your code here
end
</code>

<solution>
def add(x, y)
  x.to_i + y.to_i
end
</solution>

<testcases>
<caller>
puts add(x, y)
</caller>
<testcase>
<i>
x = 10
y = 20
</i>
</testcase>
<testcase>
<i>
x = "100"
y = 20
</i>
</testcase>
<testcase>
<i>
x = "100"
y = "20"
</i>
</testcase>
<testcase>
<i>
x = 100
y = "20"
</i>
</testcase>
</testcases>
</codeblock>
