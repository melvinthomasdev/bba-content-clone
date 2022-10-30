Finish the method definition given below.

Given two sentences `sentence` and `another_sentence`, the method should determine if one is an anagram of another, and return `true` if so, or `false` if not. The comparison should ignore cases, but include spaces.

An anagram is a word, phrase, or name formed by rearranging the letters of another, such as spar, formed from rasp.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def is_anagram?(sentence, another_sentence)
  # Write your code here
end
</code>

<solution>
def is_anagram?(sentence, another_sentence)
  downcase_sort_strip(sentence) == downcase_sort_strip(another_sentence)
end

def downcase_sort_strip(sentence)
  sentence.downcase.split('').sort.join.strip
end
</solution>

<testcases>
<caller>
puts is_anagram?(sentence, another_sentence)
</caller>
<testcase>
<i>
sentence = 'The earthquakes'
another_sentence = 'The queer shakes'
</i>
</testcase>
<testcase>
<i>
sentence = 'Older and Wiser'
another_sentence = 'I learned Words'
</i>
</testcase>
<testcase>
<i>
sentence = 'Coins kept'
another_sentence = 'In pockets'
</i>
</testcase>
<testcase>
<i>
sentence = 'William Shakespeare'
another_sentence = 'I am a weakish speller'
</i>
</testcase>
</testcases>
</Editor>