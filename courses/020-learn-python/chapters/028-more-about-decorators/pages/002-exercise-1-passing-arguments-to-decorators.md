Pavel has been working on strengthning his encryption program. He has decided that once he converts his characters to numbers using `ord()` he will add them by a particular constant to increase their encryption strength.

Help him modify the decorator to accept an integer `strength` with the value 3, which will then be added to the result of every `ord(char)`.


<Editor lang="python" type="exercise">
<code>
# Modify encrypt decorator to accept argument strength
# Add it to ord(c)


def encrypt(function): # <-- Accept argument strength
  # Create a nested function
  def wrapper(*args, **kwargs):
    message = function(*args, **kwargs)
    return [ord(c) for c in message]  # <-- Add strength to ord(c)
  return wrapper

@encrypt # <-- pass argument strength
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</code>

<solution>
# Modify encrypt decorator to accept argument strength
# Add it to ord(c)

def encrypt(strength=0):
  def outer_wrapper(function):
    def wrapper(*args, **kwargs):
      message = function(*args, **kwargs)
      return [strength + ord(c) for c in message]
    return wrapper
  return outer_wrapper

@encrypt(strength=3)
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</solution>
</Editor>