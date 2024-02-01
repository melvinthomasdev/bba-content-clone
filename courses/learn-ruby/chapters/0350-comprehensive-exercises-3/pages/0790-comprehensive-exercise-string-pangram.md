Finish the method definition given below.

Given a string `sentence`, the method should determine whether it is a pangram in the lowercase English alphabet, and return true if it is, and false otherwise. Ignore cases while checking.

A pangram is a sentence that contains every letter of the alphabet at least once.

<codeblock language="ruby" type="exercise" testMode="multipleInput">
<code>
def is_pangram?(sentence)
  # Write your code here
end
</code>

<solution>
def is_pangram?(sentence)
  ('a'..'z').all? { |char| sentence.downcase.include?(char) }
end
</solution>

<testcases>
<caller>
puts is_pangram?(sentence)
</caller>
<testcase>
<i>
sentence = 'The quick brown fox jumps over a lazy dog'
</i>
</testcase>
<testcase>
<i>
sentence = 'We promptly judged antique ivory buckles for the next prize'
</i>
</testcase>
<testcase>
<i>
sentence = 'Welcome to the gym'
</i>
</testcase>
<testcase>
<i>
sentence = 'Brown jars prevented the mixture from freezing too quickly'
</i>
</testcase>
<testcase>
<i>
sentence = 'The five boxing wizards jump quickly'
</i>
</testcase>
</testcases>
</codeblock>