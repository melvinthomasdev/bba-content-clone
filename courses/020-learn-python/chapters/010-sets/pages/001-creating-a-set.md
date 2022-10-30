A set in Python is a sequential grouping of non-duplicate elements. A set cannot have any duplicate elements. 
Each element stored in a set must be unique.

We can create a set by calling the built-in `set()` function.
The `set( )` function takes a List as input and returns a Set containing unique values. Any repeating/duplicate values in the List are removed.
<Editor lang="python">
<code>
non_unique_list = ["Andria", "Amanda", "Andria", "Samantha", "Amanda"]
print(non_unique_list)

unique_set = set(non_unique_list)
print(unique_set)
</code>
</Editor>

We can also create a set by enclosing our values within the `{}.`

<Editor lang="python">
<code>
unique_number_set = {1, 2, 3, 3, 2, 1}
print(unique_number_set)
</code>
</Editor>