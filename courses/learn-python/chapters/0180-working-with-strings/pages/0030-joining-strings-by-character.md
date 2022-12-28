Just like separating words into a list using a `.split()`, we can also join a list of strings into a sentence using `.join()`.

<codeblock language="python" type="lesson">
<code>
characters = ["Gangadhar", "Geetha", "Kilvish", "Dr.Jackal"]
print(', '.join(characters))
</code>
</codeblock>

We can use this method to frame sentences in our program.

<codeblock language="python" type="lesson">
<code>
characters = ["Gangadhar", "Geetha", "Kilvish", "Dr.Jackal"]
print(f"The main characters in Shaktimaan were {', '.join(characters)}")
</code>
</codeblock>