A Counter is a utility in Python which calculates and maintains the count of items in a list, tuple, set or string.

<Editor lang="python">
<code>
from collections import Counter

string = "hello"
c = Counter(string)
print(c)
</code>
</Editor>

Counter also provides methods that can help us get the most common elements.

<Editor lang="python">
<code>
from collections import Counter

string = '''Peter Piper picked a peck of pickled peppers
A peck of pickled peppers Peter Piper picked
If Peter Piper picked a peck of pickled peppers
Where’s the peck of pickled peppers Peter Piper picked?'''

c = Counter(string.split())
print(c.most_common(3))
</code>
</Editor>