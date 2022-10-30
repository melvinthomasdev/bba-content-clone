Although we can use the `in` keyword to find if some word exists in a string, we sometimes instead require the index of the word of where it appears. Python has a `.find()` method for the same. The `.find()` method returns the index where the word is present in the string. It returns `-1` if the word was not found.

<Editor lang="python">
<code>
text = "The dishes served are Mutton, Soup, Pulav, Chicken, Salad."

i = text.find("Soup") # Returns the index if the text is found
print(f"The Index of Soup is {i}")

i = text.find("Ice Cream") # Returns -1 if the text is not found
print(f"The Index of Ice Cream is {i}")
</code>
</Editor>

If there are multiple occurrences of the word, we can provide a start index to `.find()`. `.find()` will then start searching for the word only from that index onwards.

<Editor lang="python">
<code>
text = "The dishes served are Mutton, Soup, Pulav, Chicken, Salad. Mutton is a special delicacy at this restaurant."

i = text.find("Mutton") # Returns the index of the first occurence
print(f"The Index of the first occurrence is {i}")

j = text.find("Mutton", i+1) # Searches for Mutton after the given index i
print(f"The Index of the second occurrence is {j}")
</code>
</Editor>