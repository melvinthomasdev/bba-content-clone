Complete the method definition given below.

The method should convert the given string `value` that is provided in a specific given base `current_base` to a new base `new_base`, and return the result as a string.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def convert_base(value, current_base, new_base)
 # Write your code here
end
</code>

<solution>
def convert_base(value, current_base, new_base)
  value.to_i(current_base).to_s(new_base)
end
</solution>

<testcases>
<caller>
puts convert_base(value, current_base, new_base)
</caller>
<testcase>
<i>
value = '7B'
current_base = 16
new_base = 10
</i>
</testcase>
<testcase>
<i>
value = '9012'
current_base = 10
new_base = 2
</i>
</testcase>
<testcase>
<i>
value = '154D'
current_base = 16
new_base = 8
</i>
</testcase>
</testcases>
</codeblock>
