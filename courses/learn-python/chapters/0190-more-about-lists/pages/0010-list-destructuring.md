We can assign values to multiple variables on a single line in Python in the following way. We just have to ensure that the number of variables and the number of values given are the same.

<codeblock language="python" type="lesson">
<code>
animal, bird, insect = "Dog", "Eagle", "Ant"
print(animal, bird, insect)
</code>
</codeblock>

Python also supports this feature for lists and tuples. If the number of values in the list/tuple are the same as the number of variables given, we could do the following.

<codeblock language="python" type="lesson">
<code>
creatures = ("Dog", "Eagle", "Ant", )
animal, bird, insect = creatures
print(animal, bird, insect)
</code>
</codeblock>

We can also handle cases where the number of values on the right-hand side is more than the number of variables on the left-hand side, using the `*` operator. When we use the `*` operator the extra values, are assigned to that variable as a list.

<codeblock language="python" type="lesson">
<code>
creatures = ("Dog", "Eagle", "Ant", "Snake", "Pirhana")
animal, bird, insect, *others = creatures
print(animal, bird, insect)
print(f"Others: {others}")
</code>
</codeblock>