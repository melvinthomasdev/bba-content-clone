Complete the method definition given below.

`word` is a scrambled word that contains capital letters in alphabetical order. `sample_dictionary` is an array of words that might contain the original word, for which `word` is a scrambled version (letters sorted alphabetically).

Given `word` and `sample_dictionary`, the method should return the original word if it is in `sample_dictionary`. If not, the method should return `false`.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def solve_jumble_words(word, sample_dictionary)
  # Write your code here
end
</code>

<solution>
def solve_jumble_words(word, sample_dictionary)
  sorted_word = word.downcase.chars.sort.join
  result = false

  sample_dictionary.each do |sample_word|
    if sorted_word == sample_word.downcase.chars.sort.join
      result = sample_word
      break
    end
  end

  result
end
</solution>

<testcases>
<caller>
puts solve_jumble_words(word, sample_dictionary)
</caller>
<testcase>
<i>
word = 'AEBUMRCNSSL'
sample_dictionary = ['Personality', 'Quadrillion', 'Abandonedly', 'Unscrambles', 'Abashedness']
</i>
</testcase>
<testcase>
<i>
word = 'AEHPSSR'
sample_dictionary = ['Surbase', 'Uncases', 'Phrases', 'Rubasse', 'Sucrase']
</i>
</testcase>
<testcase>
<i>
word = 'ABELLLSY'
sample_dictionary = ['Syllabus', 'Intellectualism', 'Pacifism', 'Syllable', 'Sidewall']
</i>
</testcase>
<testcase>
<i>
word = 'VSRLEO'
sample_dictionary = ['Pollen', 'Pulley', 'Follow', 'Solve']
</i>
</testcase>
</testcases>
</codeblock>
