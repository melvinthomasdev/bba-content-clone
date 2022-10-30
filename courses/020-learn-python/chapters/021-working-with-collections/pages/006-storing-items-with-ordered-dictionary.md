Dictionaries by default do not maintain the order of the elements in the sequence in which they were entered. There might be some cases where we would like to have that. In those cases, we can use Ordered Dictionaries.

An Ordered Dictionary is a variant of a dictionary that **maintains the order of the elements in the way they were added**. The example below gets the count of every word in the string and prints the words in the order they appeared.

<Editor lang="python">
<code>
from collections import OrderedDict

string = '''Peter Piper picked a peck of pickled peppers
A peck of pickled peppers Peter Piper picked
If Peter Piper picked a peck of pickled peppers
Where’s the peck of pickled peppers Peter Piper picked?'''

position_mapping = OrderedDict()
words = string.split()

for position, word in enumerate(words, start=1):
  if word in position_mapping:
    position_mapping[word] += 1
  else:
    position_mapping[word] = 1

print(position_mapping)
</code>
</Editor>