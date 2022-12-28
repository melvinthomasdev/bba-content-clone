Below are two lists containing filenames that need to be read by the system sequentially. Instead of writing two loops to go through the lists, join the lists using `chain()` and use a single loop.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
import itertools

files = ["tarzan.txt", "mowgli.txt", "aladdin.txt"]
more_files = ["rapunzel.txt", "shrek.txt"]

# Chain the files and more_files iterble together so we can read them sequentially
# iterator = 

for file in iterator:
  print(f"Reading {file}")
</code>

<solution>
import itertools

files = ["tarzan.txt", "mowgli.txt", "aladdin.txt"]
more_files = ["rapunzel.txt", "shrek.txt"]

iterator = itertools.chain(files, more_files)

for file in iterator:
  print(f"Reading {file}")
</solution>
</codeblock>