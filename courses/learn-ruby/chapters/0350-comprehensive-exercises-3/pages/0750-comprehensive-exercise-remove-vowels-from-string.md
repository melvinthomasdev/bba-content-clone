Finish the method definition given below.

Given a string `sentence` as input, the method should remove all the vowels from it, and then return the resultant sentence.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def disemvowel(sentence)
  # Write your code here
end
</code>

<solution>
def disemvowel(sentence)
  sentence.delete('aeiouAEIOU')
end
</solution>

<testcases>
<caller>
puts disemvowel(sentence)
</caller>
<testcase>
<i>
sentence = 'Built by team BigBinary'
</i>
</testcase>
<testcase>
<i>
sentence = 'Older and Wiser'
</i>
</testcase>
<testcase>
<i>
sentence = 'Coins kept'
</i>
</testcase>
<testcase>
<i>
sentence = 'William Shakespeare'
</i>
</testcase>
</testcases>
</codeblock>