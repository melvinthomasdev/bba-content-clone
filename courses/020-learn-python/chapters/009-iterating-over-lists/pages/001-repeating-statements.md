If we want to print all values from a list one after the other, we can do the following:

<Editor lang="python">
<code>
animals = ["dog", "cat", "wolf", "cow"]
print(f"This is a {animals[0]}")
print(f"This is a {animals[1]}")
print(f"This is a {animals[2]}")
print(f"This is a {animals[3]}")
</code>
</Editor>

This method is not efficient as the same code is repeated for every element in the list.
Instead we can use a **for loop** to do the same in a much more efficient way.

<Editor lang="python">
<code>
animals = ["dog", "cat", "wolf", "cow"]
for animal in animals:
  print(f"This is a {animal}")
</code>
</Editor>