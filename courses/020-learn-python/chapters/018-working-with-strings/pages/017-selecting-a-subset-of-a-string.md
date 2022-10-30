Similar to lists we can get the length of the string using `len()` and select string characters using Indices.

<Editor lang="python">
<code>
movie = "Spiderman: No Way Home"

print(f"The first character is {movie[0]}")
print(f"The last character is {movie[-1]}") # gets the last character
print(f"The length of the string is {len(movie)}")
</code>
</Editor>

If we want to select a substring from the string, we can use indices within a range. This method is called string **slicing**.

<Editor lang="python">
<code>
movie = "Spiderman: No Way Home"
print(f"The text upto the 8th index is {movie[:9]}")
print(f"The text from the 11th index is {movie[11:]}")
print(f"The text from the 11th index to the 17th index is {movie[11:17]}")
</code>
</Editor>