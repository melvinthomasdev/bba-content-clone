Currently, Officer Pavel's program only encrypts and sends one text message: `Tango, Charlie, Alpha`. Officer Pavel has therefore modified his `send_message() `function to accept an input string. However, the encrypt decorator does not work anymore.

Help him fix it so that all messages returned from `send_message()` are encrypted.


<Editor lang="python" type="exercise">
<code>
# Modify encrypt so that it accept arguments

def encrypt(function):
  def wrapper():
    message = function()
    return [ord(c) for c in message]
  return wrapper

@encrypt
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</code>

<solution>
# Modify encrypt so that it accept arguments

def encrypt(function):
  def wrapper(*args, **kwargs):
    message = function(*args, **kwargs)
    return [ord(c) for c in message]
  return wrapper

@encrypt
def send_message(message):
  return message

message = send_message("Hello Officers. This is your captain speaking.")

print(message)
</solution>
</Editor>