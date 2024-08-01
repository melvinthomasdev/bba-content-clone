Find the sum of the length of the all the words in the given string
using "Symbol to Proc" style of programming.

<codeblock language="ruby" type="exercise" testMode="fixedInput">
<code>
string = "Today is a wonderful day"
</code>

<solution>
string = "Today is a wonderful day"
puts string.split.map(&:length).reduce(&:+)
</solution>
</codeblock>