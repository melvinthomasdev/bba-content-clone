Finish the method definition given below.

Given an input string `sentence`, the method should perform an in-place reversal of all words from the string and return the resultant sentence. In-place reversal means each word of the sentence gets reversed, but the order of the words remains the same.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def reverse_in_place(sentence)
  # Write your code here
end
</code>

<solution>
def reverse_in_place(sentence)
  words = sentence.split
  words.map(&:reverse).join(' ')
end
</solution>

<testcases>
<caller>
puts reverse_in_place(sentence)
</caller>
<testcase>
<i>
sentence = 'erehT era a tsav rebmun fo secruoser rof gninrael erom ybuR'
</i>
</testcase>
<testcase>
<i>
sentence = 'tpircsavaJ si ybuR'
</i>
</testcase>
</testcases>
</Editor>