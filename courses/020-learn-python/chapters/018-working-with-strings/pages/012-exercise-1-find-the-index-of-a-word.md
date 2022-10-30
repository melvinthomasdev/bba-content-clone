Sarah's boss wants her to find if a particular number is in their customer data. Sarah is given a text input of customer names and numbers. She is also given a specific number to cross-check if it exists in the text.

Use find  to help Sarah check if the number exists in the text. Print **The number is present at index `INDEX`** if it is present. Else print "The number is not present" if the number is missing in the text.


<Editor lang="python" type="exercise">
<code>
# Check if the number exists in text using find
# Print "The number is present at index `INDEX`" if it is present
# Print "The number is not present" if the number is missing
text = "Joseph +91-755-502-2339 Tom +91-915-551-9087 Bob +91-855-526-6867 Alice +91-755-585-7865 Carol +91-755-507-6331 Meenal +91-855-571-9817 Rose +91-855-596-4437 Alan +91-755-500-8969"

number = "+91-755-585-7865"
</code>

<solution>
# Check if the number exists in text using find
# Print "The number is present at index `INDEX`" if it is present
# Print "The number is not present" if the number is missing
text = "Joseph +91-755-502-2339 Tom +91-915-551-9087 Bob +91-855-526-6867 Alice +91-755-585-7865 Carol +91-755-507-6331 Meenal +91-855-571-9817 Rose +91-855-596-4437 Alan +91-755-500-8969"

number = "+91-755-585-7865"

index = text.find(number)

if index != -1:
  print(f"The number is present at index {index}")
else:
  print("The number is not present.")
</solution>
</Editor>