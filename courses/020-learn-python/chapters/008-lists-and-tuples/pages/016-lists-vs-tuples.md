Tuples are similar to Lists except that they cannot be modified. We cannot add or remove elements from a tuple once declared.

Tuples are read-only and can only be accessed or searched for elements.

We can declare a tuple using the `()` branckets.

<Editor lang="python">
<code>
planets = ("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus","Neptune")
print(planets)
</code>
</Editor>

Attempting to add an element to the `planets` tuple will result in an error.

<Editor lang="python">
<code>
planets = ("Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus","Neptune")
planets.append("Neptune")
print(planets)
</code>
</Editor>