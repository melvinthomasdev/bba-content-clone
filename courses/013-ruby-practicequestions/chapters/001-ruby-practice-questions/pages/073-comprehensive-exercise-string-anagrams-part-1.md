Finish the method definition given below.

Given two words `word` and `another_word`, the method should determine if one is an anagram of another, and return `true` if so, or `false` if not. The comparison should ignore cases.

An anagram is a word, phrase, or name formed by rearranging the letters of another, such as spar, formed from rasp.

<Editor lang="ruby" type="exercise" testMode="multipleInput">
<code>
def is_anagram?(word, another_word)
  # Write your code here
end
</code>

<solution>
def is_anagram?(word, another_word)
  downcase_and_sort(word) == downcase_and_sort(another_word)
end

def downcase_and_sort(word)
  word.downcase.split('').sort.join
end
</solution>

<testcases>
<caller>
puts is_anagram?(word, another_word)
</caller>
<testcase>
<i>
word = 'racecar'
another_word = 'carrace'
</i>
</testcase>
<testcase>
<i>
word = 'Stressed'
another_word = 'Desserts'
</i>
</testcase>
<testcase>
<i>
word = 'Hello'
another_word = 'Ollah'
</i>
</testcase>
<testcase>
<i>
word = 'Element'
another_word = 'Mentor'
</i>
</testcase>
</testcases>
</Editor>