The `None` keyword denotes a special data type in Python which represents an empty value. Values that are `None` are recognized as values having no specific state. They are just the default representation of a state that has not been initialized or assigned anything yet.

<Editor lang="python">
<code>
print(type(None))
</code>
</Editor>

We usually compare `None` to other values using the `is` keyword.

<Editor lang="python">
<code>
print("" is None)
print(3 is None)
print(True is None)
print(2.3 is None)
print(None is None)
</code>
</Editor>