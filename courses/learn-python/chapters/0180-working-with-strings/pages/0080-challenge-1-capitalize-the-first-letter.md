Tia has a bad habit of typing text incorrectly. As his teacher, you want to correct the text he wrote using the string methods in Python. Given the text he has typed:

1. Convert the text typed to lowercase using `.lower()`
2. Split the sentences by `. `
3. Capitalize the first letter of every sentence using `.capitalize()`
4. Join the sentence again by `. `
5. Print the text once done.

Note that there is a space after the full stop. `. `

<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Correct the sentence by converting the text to lowercase and capitalizing the first letter of every sentence
text = "i like travelling to Different Places. it is My Hobby. My other Hobbies include Reading, Dancing and Singing."
</code>

<solution>
# Correct the sentence by converting the text to lowercase and capitalizing the first letter of every sentence
text = "i like travelling to Different Places. it is My Hobby. My other Hobbies include Reading, Dancing and Singing."

lower_text = text.lower()
split_text = text.split(". ")
capitalized_text = []

for text in split_text:
  capitalized_text.append(text.capitalize())

result = ". ".join(capitalized_text)
print(result)
</solution>
</codeblock>