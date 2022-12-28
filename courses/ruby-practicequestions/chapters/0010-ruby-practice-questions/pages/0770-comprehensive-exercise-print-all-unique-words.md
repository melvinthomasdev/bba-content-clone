Finish the method definition given below.

Given two sentences `sentence` and `another_sentence`, the method should return a list with all the unique words in both sentences.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def unique_words(sentence, another_sentence)
  # Write your code here
end
</code>

<solution>
def unique_words(sentence, another_sentence)
  (to_words(sentence) + to_words(another_sentence)).uniq
end

def to_words(sentence)
  sentence.split
end
</solution>

<testcases>
<caller>
puts unique_words(sentence, another_sentence)
</caller>
<testcase>
<i>
sentence = 'John likes caramel ice cream'
another_sentence = 'Everyone likes ice cream'
</i>
</testcase>
<testcase>
<i>
sentence = 'BigBinary says Hello'
another_sentence = 'Hello BigBinary'
</i>
</testcase>
<testcase>
<i>
sentence = 'Open source is the best'
another_sentence = 'Open source is amazing'
</i>
</testcase>
</testcases>
</codeblock>