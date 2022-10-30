Finish the method definition given below.

Sherlock considers a string to be valid if all characters of the string appear the same number of times.
It is also valid if he can remove just a single character at a single index in the string, and the remaining characters occur the same number of times.

Given an input string `str`, the method `is_valid?` should return `true` if the string is a valid Sherlock string and `false` if its not.

1. For example, if str = "abc", the string is valid because the frequencies of characters are all the same.
2. If str = "abcc", the string is also valid, because we can remove 1 "c" and have one of each character remaining in the string.
3. However, if str = "abccc", the string is not valid, because removing one character does not result in the same frequency of characters.

<br>
<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def is_valid?(str)
  # Write your code here
end
</code>

<solution>
def is_valid?(str)
  freq = str.chars.uniq.map { |c| str.count c }.sort
  return true if freq.uniq.size == 1

  freq[-1] -= 1
  freq.uniq.size == 1
end
</solution>

<testcases>
<caller>
puts is_valid?(str)
</caller>
<testcase>
<i>
str = 'aabbccddeefghi'
</i>
</testcase>
<testcase>
<i>
str = 'aabbcd'
</i>
</testcase>
<testcase>
<i>
str = 'abcdefghhgfedecba'
</i>
</testcase>
<testcase>
<i>
str = 'abc'
</i>
</testcase>
<testcase>
<i>
str = 'abcc'
</i>
</testcase>
<testcase>
<i>
str = 'abccc'
</i>
</testcase>
</testcases>
</Editor>