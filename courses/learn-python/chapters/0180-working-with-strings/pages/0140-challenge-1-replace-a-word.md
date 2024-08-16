Mrs. Alice has changed her number recently and made a request to ABC Ltd. to update the same. Given below are the old number and the new number. Write a program to help Sarah update the record in `text`. Print the text once done.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Replace Alice's old number with her new number

text = "Joseph +91-755-502-2339 Tom +91-915-551-9087 Bob +91-855-526-6867 Alice +91-755-585-7865 Carol +91-755-507-6331 Meenal +91-855-571-9817 Rose +91-855-596-4437 Alan +91-755-500-8969"

number = "+91-755-585-7865"
new_number = "+91-855-590-7672"
</code>

<solution>
# Replace Alice's old number with her new number

text = "Joseph +91-755-502-2339 Tom +91-915-551-9087 Bob +91-855-526-6867 Alice +91-755-585-7865 Carol +91-755-507-6331 Meenal +91-855-571-9817 Rose +91-855-596-4437 Alan +91-755-500-8969"

number = "+91-755-585-7865"
new_number = "+91-855-590-7672"

text = text.replace(number, new_number)
print(text)
</solution>
</codeblock>