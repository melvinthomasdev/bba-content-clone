Finish the method definition given below.

Given a string `str`, the method `absolute_reverse` should take a string and return the reversed string.

However there are a few rules to follow in order to make the challenge interesting:

- The UPPERCASE/lowercase positions must be kept in the same order as the original string.
- Spaces must be kept in the same order as the original string.

<br>
Take a look at the test cases for examples.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def absolute_reverse(str)
  # Write your code here
end
</code>

<solution>
def absolute_reverse(str)
  letters = str.delete(' ').chars.reverse
	str.gsub(/\S/) { |character| determine_case(character,letters) }
end

def determine_case(character, letters)
  ('A'..'Z') === character ? letters.shift.upcase : letters.shift.downcase
end
</solution>

<testcases>
<caller>
puts absolute_reverse(str)
</caller>
<testcase>
<i>
str = 'UPPER lower'
</i>
</testcase>
<testcase>
<i>
str = 'RacEcAr'
</i>
</testcase>
<testcase>
<i>
str = '1 23 456'
</i>
</testcase>
<testcase>
<i>
str = 'Hello World!'
</i>
</testcase>
<testcase>
<i>
str = "Where's your dog Daisy?"
</i>
</testcase>
<testcase>
<i>
str = 'addition(3, 2) = 5'
</i>
</testcase>
<testcase>
<i>
str = 'Ruby is a very Powerful language'
</i>
</testcase>
<testcase>
<i>
str = 'CSS stands for Cascading Style Sheets'
</i>
</testcase>
</testcases>
</codeblock>