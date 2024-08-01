Finish the method definition below.

Given two inputs to the method, `add` should return the result only if both the inputs are numbers.

If both or either one of the inputs is not a number, `add` should return `Invalid Input` message.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def add(x, y)
  # Write your code here
end
</code>

<solution>
def add(x, y)
  return x + y if (x.is_a? Numeric) && (y.is_a? Numeric)

  'Invalid Input'
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
x = "100 + x"
y = 20
</i>
</testcase>
<testcase>
<i>
x = "x"
y = 20
</i>
</testcase>
</testcases>
</codeblock>
