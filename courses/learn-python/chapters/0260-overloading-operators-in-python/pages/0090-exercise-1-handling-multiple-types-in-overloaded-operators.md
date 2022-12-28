Joseph is designing a File handler that reads the content of a file. He wants to add the functionality to append data to the file using the + operator. The data can either be from another file or from a string.

Help Joseph overload the + operator based on the data type. If the input's data type is a string, append it to the content. If the input's data type is a File, append the content of the input file to the current file.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Overload the + operator to accept string or file as input arg
# If input is str, append to content
# if input is File, append content of file to content of current file

class File:
  def __init__(self, filename, content):
    self.filename = filename
    self.content = content

  def __repr__(self):
    return f"File(contents={self.content})"

  # Overload the + operator here

file_one = File("file1.txt", "Hello World. ")
file_two = File("file2.txt", "How are you doing? ")

file_one + "This is Jamie. "
file_one + file_two
print(file_one)
</code>

<solution>
# Overload the + operator to accept string or file as data arg
# If data is str, append to content
# if data is File, append content of file to content of current file

class File:
  def __init__(self, filename, content):
    self.filename = filename
    self.content = content

  def __repr__(self):
    return f"File(contents={self.content})"

  def __add__(self, data):
    if isinstance(data, File):
      self.content += data.content
    elif isinstance(data, str):
      self.content += data

file_one = File("file1.txt", "Hello World. ")
file_two = File("file2.txt", "How are you doing? ")

file_one + "This is Jamie. "
file_one + file_two
print(file_one)
</solution>
</codeblock>