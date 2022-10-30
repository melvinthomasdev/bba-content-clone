Given to you below is a `read_lines()` function which takes in a filename and returns its hypothetical contents. While the contents of this file are small, there might be instances where the file contents are extremely large. We need to read such files efficiently.

Your task is to modify the `read_lines()` function to yield each line of the file as needed. Split the `data` string by lines and yield every line to the caller.


<Editor lang="python" type="exercise">
<code>
DISK = {'file1.txt': """Some say the world will end in fire,\n
Some say in ice.\n
From what I’ve tasted of desire\n
I hold with those who favor fire.\n
But if it had to perish twice,\n
I think I know enough of hate\n
To say that for destruction ice\n
Is also great\n
And would suffice."""}

def read_lines(filename):
  # modify this function to yield each line
  data = DISK[filename]
  return data

line_reader = read_lines("file1.txt") # Reads entire content

for line in line_reader: # works incorrectly right now
  print(line)
</code>

<solution>
DISK = {'file1.txt': """Some say the world will end in fire,\n
Some say in ice.\n
From what I’ve tasted of desire\n
I hold with those who favor fire.\n
But if it had to perish twice,\n
I think I know enough of hate\n
To say that for destruction ice\n
Is also great\n
And would suffice."""}

def read_lines(filename):
  data = DISK[filename]
  lines = data.split("\n")
  for line in lines:
    yield line

line_reader = read_lines("file1.txt")

for line in line_reader:
  print(line)
</solution>
</Editor>