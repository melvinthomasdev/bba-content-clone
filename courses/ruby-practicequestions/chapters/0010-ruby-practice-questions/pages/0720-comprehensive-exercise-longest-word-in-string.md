Finish the method definition given below.

Given a string `sentence`, the method should find and return the longest word in it. If one or more words have the same length, the method should return the first occurrence.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def longest_word(sentence)
  # Write your code here
end
</code>

<solution>
def longest_word(sentence)
  words = sentence.split(' ')
  words.sort_by!(&:length)
  words[-1]
end
</solution>

<testcases>
<caller>
puts longest_word(sentence)
</caller>
<testcase>
<i>
sentence = 'Built by folks at BigBinary'
</i>
</testcase>
<testcase>
<i>
sentence = 'Hello World'
</i>
</testcase>
<testcase>
<i>
sentence = 'I love caramel ice cream'
</i>
</testcase>
<testcase>
<i>
sentence = 'Hippomonstrosesquippedaliophobia is a the fear of long words'
</i>
</testcase>
</testcases>
</codeblock>