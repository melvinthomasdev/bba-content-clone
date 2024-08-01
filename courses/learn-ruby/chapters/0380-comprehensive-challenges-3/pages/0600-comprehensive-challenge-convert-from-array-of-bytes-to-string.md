Finish the method definition below.

`codes` is an array of bytes. Given `codes`, the method should return a string containing the characters corresponding to the array of bytes in `codes`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def convert_to_string(codes)
 # Write your code here
end
</code>

<solution>
def convert_to_string(codes)
  codes.map(&:chr).join
end
</solution>

<testcases>
<caller>
puts convert_to_string(codes)
</caller>
<testcase>
<i>
codes = [73, 32, 108, 111, 118, 101, 32, 114, 117, 98, 121]
</i>
</testcase>
<testcase>
<i>
codes = [66, 105, 103, 32, 66, 105, 110, 97, 114, 121]
</i>
</testcase>
</testcases>
</codeblock>
