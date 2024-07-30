Finish the method definition given below.

Given an input string `str` in `PascalCase`, the method should convert the input string from `PascalCase` to `snake_case`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def to_snake_case(str)
  # Write your code here
end
</code>

<solution>
def to_snake_case(str)
  underscore(str).downcase
end

def underscore(str)
  # Insert underscore before Capital character
  str.gsub(/(.)([A-Z])/,'\1_\2')
end
</solution>

<testcases>
<caller>
puts to_snake_case(str)
</caller>
<testcase>
<i>
str = "RubyOnRails"
</i>
</testcase>
<testcase>
<i>
str = "WeLoveJavascript"
</i>
</testcase>
<testcase>
<i>
str = "DateTime"
</i>
</testcase>
<testcase>
<i>
str = "PascalCase"
</i>
</testcase>
</testcases>
</codeblock>