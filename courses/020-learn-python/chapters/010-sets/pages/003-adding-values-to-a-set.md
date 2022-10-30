Just like lists, we can add or remove values from sets.

We use the `add()` method to add elements to a set. 
The `add()` method will ignore any attempts to add an element that already exists within the set.

<Editor lang="python">
<code>
animals = {"cat", "dog", "pig", "cow"}
print(animals)

animals.add("horse") # add a new element
print(animals)

animals.add("cow") # add an existing element
print(animals)
</code>
</Editor>