The code snippet below validates a given name by checking if it is empty. It is encapsulated within a try-except block and prints "**Some error occurred"** when it catches an exception.

Your task is to create a custom exception of type `EmptyNameError`. Raise this exception if the name is empty. 

You should also capture this exception separately if it is raised and print "**Please enter a valid name in the input"**.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
name = ""

# create exception EmptyNameError


try:
  if name == "":
#     raise exception
    pass
# capture EmptyNameError and print: Please enter a valid name in the input
except Exception:
  print("Some error occurred")
</code>

<solution>
name = ""

class EmptyNameError(Exception):
  pass

try:
  if name == "":
    raise EmptyNameError()
except EmptyNameError:
  print("Please enter a valid name in the input")
except Exception:
  print("Some error occurred")
</solution>
</codeblock>