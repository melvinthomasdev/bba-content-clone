Jamie is preparing for an English his test in school. He has to learn the opposites of a list of words. Help Jaime by preparing the following text for him.

Given two lists, one with the words and the other with its opposites, print a line for each pair as **The opposite of *word* is *opposite_word*.**

<Editor lang="python" type="exercise">
<code>
# Print a line for each pair as `The opposite of *word* is *opposite_word*.`
# Use the zip function

words = ["love", "beautiful", "borrow", "laugh"]
opposite_words = ["hate", "ugly", "lend", "cry"]
</code>

<solution>
# Print a line for each pair as `The opposite of *word* is *opposite_word*.`
# Use the zip function

words = ["love", "beautiful", "borrow", "laugh"]
opposite_words = ["hate", "ugly", "lend", "cry"]

for word, opposite in zip(words, opposite_words):
  print(f"The opposite of {word} is {opposite}")
</solution>
</Editor>