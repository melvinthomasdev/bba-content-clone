Find the sum of the length of the all the words in the given string
using "Symbol to Proc" style of programming.

<Editor lang="ruby" type="exercise">
<code>
string = "Today is a wonderful day"
</code>

<solution>
string = "Today is a wonderful day"
puts string.split.map(&:length).reduce(&:+)
</solution>
</Editor>