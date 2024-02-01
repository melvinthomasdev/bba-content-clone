Complete the method definition given below.

Given two inputs `a` and `b`, the method should convert `a` and `b` to floating point numbers and add them together. Then, it should return the result rounded to exactly 2 decimal points.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def add(a, b)
  # write your code here
end
</code>

<solution>
def add(a, b)
  sum = a.to_f + b.to_f
  sum.round(2)
end
</solution>

<testcases>
<caller>
puts add(a, b)
</caller>
<testcase>
<i>
a = 0.205
b = 0.312
</i>
</testcase>
<testcase>
<i>
a = '1'
b = '2'
</i>
</testcase>
<testcase>
<i>
a = '0.7'
b = 0.3
</i>
</testcase>
</testcases>
</codeblock>