We have learnt that `tr` method can be used to replace individual characters in a string.

Now, let's say we want to replace a continuous chunk of string within a larger string (also called a substring), with something else. For example, we want to convert the string `twist` into `test`. In such cases, we can use the `gsub` method.

<codeblock language="ruby" type="lesson">
<code>
word = "twist"
new_word = word.gsub("wi", "e")
puts new_word
</code>
</codeblock>

The `gsub` method replaces the substring provided in the first argument, with the substring provided in the second argument.

The `gsub` method can also be used to remove characters from a string. Just set the second argument to an empty string.

<codeblock language="ruby" type="lesson">
<code>
word = "monastery"
new_word = word.gsub("on", "")
puts new_word
</code>
</codeblock>


