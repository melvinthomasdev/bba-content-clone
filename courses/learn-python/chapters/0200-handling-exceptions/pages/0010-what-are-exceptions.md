Exceptions are errors thrown by Python when we try to do something which we are not allowed to or is not possible to. We have already seen exceptions in previous chapters when we try to access a key that does not exist in a dictionary.

<codeblock language="python" type="lesson">
<code>
countries_and_capitals = {"India": "Delhi"}
print(countries_and_capitals["England"])
</code>
</codeblock>

We get similar errors when we try the following:

<codeblock language="python" type="lesson">
<code>
# Divide a number by 0
34 / 0
</code>
</codeblock><codeblock language="python" type="lesson">
<code>
# Add a string and an integer
"Hello" + 10
</code>
</codeblock><codeblock language="python" type="lesson">
<code>
# Access an index outside the length of the list
elements_of_matter = ["Earth", "Air", "Fire", "Water"]
print(elements_of_matter[4])
</code>
</codeblock>