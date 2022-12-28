The `.replace()` method in Python, allows us to replace a word within a string. If the word is not found, no text is replaced and the original text is returned. Note that, `.replace()` replaces all occurences of the word with the replacement word.

<codeblock language="python" type="lesson">
<code>
text = "The dishes served are Mutton, Soup, Pulav, Chicken, Salad"

text = text.replace("Soup", "Curry")
print(text)
</code>
</codeblock>