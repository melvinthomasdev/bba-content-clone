The chain method joins two or more iterables together to create a new combined iterable. When the values from the first iterables are exhausted, the values from the next iterable are picked up.

<Editor lang="python">
<code>
import itertools

chained_it = itertools.chain(range(1,4), range(4, 7), range(7, 10)) # <-- merges three iterables together
print(list(chained_it))
</code>
</Editor>