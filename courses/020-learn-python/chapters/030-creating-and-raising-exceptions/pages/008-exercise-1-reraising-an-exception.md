Mr.Sharma wants you to design a login screen where the user has 3 attempts to login into his website.

Given below is a code snippet that authenticates a user using their email and password. If the password does not match, a `WrongPasswordError` is raised.

Your task is to capture this exception and reduce the number of login attempts by 1. Re-raise the exception once this is done.


<Editor lang="python" type="exercise">
<code>
# Handle WrongPasswordError and reduce attempts. Re raise the exception once done.

attempts = 2
email, password = "username@gmail.com", "pasword"

class WrongPasswordError(Exception):
  pass

try:
  try:
    if not (email == "username@gmail.com" and password == "password"):
      raise WrongPasswordError()
  except:
    # add changes here
    pass
except:
  print(f"Please try again. You have {attempts} left")
</code>

<solution>
attempts = 2
email, password = "username@gmail.com", "pasword"

class WrongPasswordError(Exception):
  pass

try:
  try:
    if not (email == "username@gmail.com" and password == "password"):
      raise WrongPasswordError()
  except WrongPasswordError as e:
    attempts -= 1
    raise e
except:
  print(f"Please try again. You have {attempts} left")
</solution>
</Editor>