Complete the method definition below.

Given a string `sentence`, the method should return an array of all the unique vowels present in the sentence, sorted in alphabetical order and in lowercase. The method should return **No Vowels Found**, if no vowels are present in the sentence.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def find_vowels(sentence)
 # Write your code here
end
</code>

<solution>
def find_vowels(sentence)
  vowels = %w[ a e i o u ]
  result = vowels.map{|vowel| vowel if sentence.downcase.count(vowel) > 0 }.compact
  result.length > 0 ? result : "No Vowels Found"
end
</solution>

<testcases>
<caller>
puts find_vowels(sentence)
</caller>
<testcase>
<i>
sentence = 'Sly lynx fly by my crwth.'
</i>
</testcase>
<testcase>
<i>
sentence = 'Good Morning, have some tea!'
</i>
</testcase>
<testcase>
<i>
sentence = 'We can use regular expressions, which are basically patterns to match character combinations in strings'
</i>
</testcase>
</testcases>
</codeblock>
