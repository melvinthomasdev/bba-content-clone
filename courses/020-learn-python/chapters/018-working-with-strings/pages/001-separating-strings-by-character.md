Imagine you had a bunch of names all separated by a comma. There might be times when you would want to split these names at the comma and create a list.

Python provides an inbuilt string method to do the same. The `.split() `method takes in an argument `separator`, which it uses to split a text string into different items in a list.

<Editor lang="python">
<code>
characters = "Gangadhar, Geetha, Dr.Jackal, Kilvish"
print(characters.split(", "))
</code>
</Editor>

You can also separate words by  a space by doing the following.

<Editor lang="python">
<code>
characters = "To be or not to be"
print(characters.split())
</code>
</Editor>

The `separator` argument of split is set to space by default.