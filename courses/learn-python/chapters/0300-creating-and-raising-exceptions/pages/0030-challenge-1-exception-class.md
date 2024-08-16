Given below is a code snippet to validate a name. The snippet ensures that the name variable is not empty. Modify the snippet such that an exception is raised if the name variable is empty.  Add the message **Name cannot be empty** in the exception object.


<codeblock language="python" type="exercise" testMode="fixedInput">
<code>
# Create and raise and exception for age

name = ""

try:
  if len(name) == 0:
    # raise exeption here
except Exception as e:
  print(e)
</code>

<solution>
name = ""

try:
  if len(name) == 0:
    raise Exception("Name cannot be empty")
except Exception as e:
  print(e)
</solution>
</codeblock>