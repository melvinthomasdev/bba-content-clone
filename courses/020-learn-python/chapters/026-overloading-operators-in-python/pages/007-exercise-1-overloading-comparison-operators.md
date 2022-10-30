Joseph is designing a File handler that contains the content of a file. He wants to add the functionality to compare file sizes using the `>`, `<`, and `==` operators.

Help Joseph overload these operators. If two files are compared like `file1 > file2` return `True` if the size of file1 is greater than file2.


<Editor lang="python" type="exercise">
<code>
# Support the operators >, < and == to compare file size for File

class File:
  def __init__(self, filename, filesize):
    self.filename = filename
    self.filesize = filesize

  # Overload operator ==

  # Overload operator <

  # Overload operator >
  

file_one = File("file1.txt", 243432)
file_two = File("file2.txt", 6755352)

if file_two < file_one:
  print(f"{file_one.filename} is larger in size")
elif file_one < file_two:
  print(f"{file_two.filename} is larger in size")
elif  file_one == file_two:
  print(f"{file_two.filename} and {file_two.filename} are the same size")
</code>

<solution>
class File:
  def __init__(self, filename, filesize):
    self.filename = filename
    self.filesize = filesize

  def __eq__(self, file):
    return self.filesize == file.filesize

  def __gt__(self, file):
    return self.filesize > file.filesize

  def __lt__(self, file):
    return self.filesize < file.filesize

file_one = File("file1.txt", 243432)
file_two = File("file2.txt", 6755352)

if file_two < file_one:
  print(f"{file_one.filename} is larger in size")
elif file_one < file_two:
  print(f"{file_two.filename} is larger in size")
elif  file_one == file_two:
  print(f"{file_two.filename} and {file_two.filename} are the same size")
</solution>
</Editor>