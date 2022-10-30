The collections module also provides a variant of a dictionary called Default Dictionary. A default dictionary pre initializes the values in a dictionary to a certain type.

To understand its need, let's take the following example.

Let's say we need to store the position of all occurrences of all the words in a string. We would use a dictionary with the key as the word and the value as a list of positions where the word appears. To do this we would have to first initialize the value for new keys to a list.

<Editor lang="python">
<code>
string = '''Peter Piper picked a peck of pickled peppers
A peck of pickled peppers Peter Piper picked
If Peter Piper picked a peck of pickled peppers
Where’s the peck of pickled peppers Peter Piper picked?'''

position_mapping = {}
words = string.split()

for position, word in enumerate(words, start=1):
  if word in position_mapping:
    position_mapping[word].append(position)
  else:
    position_mapping[word] = [position]

print(position_mapping)
</code>
</Editor>

As you can see we have an if condition in place to check if the key (word) exists in the dictionary or not. If it is not present we initialize the key with the value set to a list.

Using default dictionaries we could omit this condition and simplify our code.

<Editor lang="python">
<code>
from collections import defaultdict

string = '''Peter Piper picked a peck of pickled peppers
A peck of pickled peppers Peter Piper picked
If Peter Piper picked a peck of pickled peppers
Where’s the peck of pickled peppers Peter Piper picked?'''

# We initialize defaultdict here and pass list to it.
# This by default assigns an empty list an any new key.
# Other options are int, float, str, dict, tuple, set etc.
position_mapping = defaultdict(list)
words = string.split()

for position, word in enumerate(words, start=1):
    position_mapping[word].append(position)

print(position_mapping)
</code>
</Editor>