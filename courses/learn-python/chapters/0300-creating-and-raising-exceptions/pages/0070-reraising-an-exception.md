Python also allows us to re-raise a handled exception. For example, we might want to first capture an error that occurs in our try-except block and store its details in some file. Then we would want to continue to raise that exception so that it can be handled at a higher level.

In such instances, we could use the `raise` keyword again along with the captured exception object in the except block. This would raise the error again and pass it over to the calling function.

<codeblock language="python" type="lesson">
<code>
age = 999


def log_error(e): # <-- dummy function to log error
  pass

class InvalidAgeException(Exception): # custom exception
  pass

try:
  if not 1 <= age <= 100:
    raise InvalidAgeException("Invalid age value provided.")
except InvalidAgeException as e:
  log_error(e) # <-- log the exception first
  raise e # <-- re raise the exception
except Exception:
  print("Some error occurred")
</code>
</codeblock>