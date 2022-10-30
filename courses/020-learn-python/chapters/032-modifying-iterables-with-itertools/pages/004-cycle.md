The `cycle()` function loops through the values of a list infinitely. That is, once it finishes iterating through all the values from a list, it begins iterating again from the start of the list.

<Editor lang="python">
<code>
import itertools
cycled_list = itertools.cycle(["Red", "Blue", "Pink"]) # <-- repeats infintely

print(next(cycled_list)) # <-- starts from Red
print(next(cycled_list))
print(next(cycled_list))
print(next(cycled_list)) # <-- restarts from Red
print(next(cycled_list))
</code>
</Editor>