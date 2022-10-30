Finish the method definition below.

`value` is a string that may contain a hexadecimal value in it. Given `value`, the method should return the decimal value of the hexadecimal value. If `value` does not contain a hexadecimal value, the method should return 0.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def find_hex_number(value)
  # write your code here
end
</code>

<solution>
def find_hex_number(value)
  value.to_i(16)
end
</solution>

<testcases>
<caller>
puts find_hex_number(value)
</caller>
<testcase>
<i>
value = 'e82f bit'
</i>
</testcase>
<testcase>
<i>
value = '79ed bits'
</i>
</testcase>
<testcase>
<i>
value = 'nothinghere bits'
</i>
</testcase>
<testcase>
<i>
value = '84f7 bits'
</i>
</testcase>
</testcases>
</Editor>