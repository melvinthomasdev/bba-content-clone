While we can use the Exception class to create and raise new errors, it is not the recommended method. The Exception class does not distinguish between different types of errors. It is a broad and generic class that classifies all exceptions the same way.

To help exception handlers (try-except block) distinguish between errors, we create a child exception class.

<Editor lang="python">
<code>
age = 999

class InvalidAgeException(Exception): # <-- inherit from Exception
  pass
  
if not 1 <= age <= 100:
  raise InvalidAgeException("Invalid age value provided.")
</code>
</Editor>

We can use the `InvalidAgeException` in a try-except block to handle age-related errors separately.

<Editor lang="python">
<code>
age = 999

class InvalidAgeException(Exception): # <-- inherit from Exception
  pass

try:
  if not 1 <= age <= 100:
    raise InvalidAgeException("Invalid age value provided.")
except InvalidAgeException: # <-- Handler for age related errors 
  print("Please enter a valid age in the input")
except Exception:
  print("Some error occurred")
</code>
</Editor>