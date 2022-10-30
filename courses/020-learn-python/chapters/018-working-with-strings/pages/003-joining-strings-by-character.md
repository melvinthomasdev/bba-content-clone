Just like separating words into a list using a `.split()`, we can also join a list of strings into a sentence using `.join()`.

<Editor lang="python">
<code>
characters = ["Gangadhar", "Geetha", "Kilvish", "Dr.Jackal"]
print(', '.join(characters))
</code>
</Editor>

We can use this method to frame sentences in our program.

<Editor lang="python">
<code>
characters = ["Gangadhar", "Geetha", "Kilvish", "Dr.Jackal"]
print(f"The main characters in Shaktimaan were {', '.join(characters)}")
</code>
</Editor>