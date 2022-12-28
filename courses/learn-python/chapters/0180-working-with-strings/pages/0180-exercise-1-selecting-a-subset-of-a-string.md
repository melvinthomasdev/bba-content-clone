Neil is trying to extract dialogues from the movie 300. He wants to make a collection of them.

Given below is a text, from one of the scenes in 300. Help Neil extract the dialogue given between quotes `"`. Use `.find()` to get the index of both the quotes and then extract the text **between** them and print it to the screen.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
text = "Leonidus nodded to his wife and turned towards the messenger and said \"Madness? This is SPARTAAA!\""
</code>

<solution>
text = "Leonidus nodded to his wife and turned towards the messenger and said \"Madness? This is SPARTAAA!\""

start = text.find("\"") + 1
end = text.find("\"", start)

print(text[start:end])
</solution>
</codeblock>